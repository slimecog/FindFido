require "rails_helper"

describe "as a user" do
  context "when i visit /reports/new and fill out the form" do
    it "redirects to /reports with my report on the page" do
      user = User.create!(provider: "google_oauth2", uid: "xyz456", name: "cameron", oauth_token: "abc123", oauth_expires_at: "2018-04-18 16:15:56", zipcode: 80202)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'

      within("#about") do
        click_on ("Report Found Pet")
      end

      # fill_in :street, with: "1085 pearl st"

    end
  end
end
