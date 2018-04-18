require 'rails_helper'

RSpec.describe User, type: :model do
  it "has attributes" do
    user = User.create!(provider: "google_oauth2", uid: "xyz456", name: "cameron", oauth_token: "abc123", oauth_expires_at: "2018-04-18 16:15:56", zipcode: 80202)

    expect(user.provider).to eq("google_oauth2")
    expect(user.uid).to eq("xyz456")
    expect(user.name).to eq("cameron")
    expect(user.oauth_token).to eq("abc123")
    expect(user.oauth_expires_at).to eq("2018-04-18 16:15:56")
    expect(user.zipcode).to eq(80202)
  end
end
