require "rails_helper"

describe "as a user" do
  context "when i visit /reports" do
    it "shows all exiting reports where found: false" do
      user = User.create!(provider: "google_oauth2", uid: "xyz456", name: "cameron", oauth_token: "abc123", oauth_expires_at: "2018-04-18 16:15:56", zipcode: 80202)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = (File.open'./spec/fixtures/geocoded_report.json')
      stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=1333%2017th%20st%20denver%2080202&key=AIzaSyC5YJOlPCEVWz_i5J6vwhr-QMnLry1AlAI&language=en&sensor=false")
        .to_return(status: 200, body: json_response)

      report = Report.create!(street: "1333 17th st", city: "denver", zip: "80202", description: "a doggo", latitude: nil, longitude: nil, found: false)

      visit '/reports'

      expect(current_path).to eq('/reports')
      expect(page).to have_content("All Found Pets")
      expect(page).to have_content("Location: 1333 17th st denver 80202")
      expect(page).to have_content("Description: a doggo")
    end
  end
end
