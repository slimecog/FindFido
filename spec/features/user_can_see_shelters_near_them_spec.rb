require "rails_helper"

describe "as a user" do
  describe "when i visit '/dashboard' and enter my zip and click shelters near me" do
    it "redirects to /shelters and shows top ten nearest shelters" do
      user = User.create!(provider: "google_oauth2", uid: "xyz456", name: "cameron", oauth_token: "abc123", oauth_expires_at: "2018-04-18 16:15:56", zipcode: 80202)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = (File.open'./spec/fixtures/shelters_by_zip.json')
      stub_request(:get, "http://api.petfinder.com/shelter.find?key=#{ENV['PETFINDER_API_KEY']}&location=#{user.zipcode}&format=json&count=10")
        .to_return(status: 200, body: json_response)

      visit '/dashboard'
      within("#report-form") do
        click_on "Shelters Near Me"
      end

      expect(current_path).to eq('/shelters')
      expect(page).to have_content("Name:", count: 10)
      expect(page).to have_content("Phone:", count: 10)
      expect(page).to have_content("Email:", count: 10)
      expect(page).to have_content("Address:", count: 10)
      expect(page).to have_content("Name: Saving Dobermankind Animal Rescue")
    end
  end

  describe "when i click on a shelter name from the dashboard" do
    it "redirects to shelter show page with that shelter's data" do
      user = User.create!(provider: "google_oauth2", uid: "xyz456", name: "cameron", oauth_token: "abc123", oauth_expires_at: "2018-04-18 16:15:56", zipcode: 80202)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = (File.open'./spec/fixtures/shelters_by_zip.json')
      stub_request(:get, "http://api.petfinder.com/shelter.find?key=#{ENV['PETFINDER_API_KEY']}&location=#{user.zipcode}&format=json&count=10")
        .to_return(status: 200, body: json_response)

      json_response2 = (File.open'./spec/fixtures/shelter_by_id.json')
      stub_request(:get, "http://api.petfinder.com/shelter.get?key=#{ENV['PETFINDER_API_KEY']}&id=CO453&format=json")
        .to_return(status: 200, body: json_response2)

      visit '/dashboard'
      within("#report-form") do
        click_on "Shelters Near Me"
      end

      click_on "Name: Saving Dobermankind Animal Rescue"

      expect(current_path).to eq('/shelters/CO453')
      expect(page).to have_content("Currently Viewing a Shelter")
      expect(page).to have_content("Name: Saving Dobermankind Animal Rescue")
    end
  end
end
