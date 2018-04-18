require "rails_helper"

RSpec.describe Report, type: :model do
  it "has attributes" do
    json_response = (File.open'./spec/fixtures/geocoded_report.json')
    stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=1333%2017th%20st%20denver%2080202&key=AIzaSyC5YJOlPCEVWz_i5J6vwhr-QMnLry1AlAI&language=en&sensor=false")
      .to_return(status: 200, body: json_response)

    report = Report.create!(street: "1333 17th st", city: "denver", zip: "80202", description: "a doggo", latitude: nil, longitude: nil, found: false)
    
    expect(report.street).to eq("1333 17th st")
    expect(report.city).to eq("denver")
    expect(report.zip).to eq("80202")
    expect(report.description).to eq("a doggo")
    expect(report.latitude).to eq(39.7503686)
    expect(report.longitude).to eq(-104.9964951)
    expect(report.found).to eq(false)
  end

  it "can has full address and can be geocoded by it" do
    json_response = (File.open'./spec/fixtures/geocoded_report.json')
    stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=1333%2017th%20st%20denver%2080202&key=AIzaSyC5YJOlPCEVWz_i5J6vwhr-QMnLry1AlAI&language=en&sensor=false")
      .to_return(status: 200, body: json_response)

    report = Report.create!(street: "1333 17th st", city: "denver", zip: "80202", description: "a doggo", latitude: nil, longitude: nil, found: false)

    expect(report.full_street_address).to eq("1333 17th st denver 80202")
    expect(report.geocode).to eq([39.7503686, -104.9964951])
    expect(report.latitude).to eq(39.7503686)
    expect(report.longitude).to eq(-104.9964951)
  end
end
