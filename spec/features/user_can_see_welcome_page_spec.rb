require "rails_helper"

describe "as a guest user" do
  describe "when i visit '/'" do
    it "loads the welcome page with google sign in link" do
      visit '/'

      expect(page).to have_link("Sign In With Google")
    end
  end
end
