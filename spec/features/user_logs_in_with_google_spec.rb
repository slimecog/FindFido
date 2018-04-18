require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using google oauth2" do
    stub_omniauth

    visit root_path

    expect(page).to have_link("Sign in with Google")

    click_link "Sign in with Google"

    expect(page).to have_content("Signed in as cameron Johnson")
    expect(page).to have_content("Find Fido Welcomes You")
    expect(page).to have_link("Sign Out")

    click_link "Sign Out"

    expect(page).to have_content("Successfully Signed Out")
    expect(page).to_not have_content("Signed in as")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: "google_oauth2",
      uid: "12345678910",
      info: {
        email: "wlcjohnson@gmail.com",
        first_name: "cameron",
        last_name: "Johnson"
      },
      credentials: {
        token: "abcdefg12345",
        refresh_token: "12345abcdefg",
        expires_at: DateTime.now
      }
    })
  end
end
