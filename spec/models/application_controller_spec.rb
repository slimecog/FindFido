require "rails_helper"

describe ApplicationController do
  describe "report_coordintates" do
    it "returns the coordinates of all existing reports where found: true" do
      json_response = (File.open'./spec/fixtures/geocoded_report.json')
      stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=1333%2017th%20st%20denver%2080202&key=AIzaSyC5YJOlPCEVWz_i5J6vwhr-QMnLry1AlAI&language=en&sensor=false")
        .to_return(status: 200, body: json_response)

      report1 = Report.create!(street: "1333 17th st", city: "denver", zip: "80202", description: "a doggo", latitude: nil, longitude: nil, found: false)

      expect(subject.report_coordinates).to eq([[39.7503686, -104.9964951]])
    end

    it "returns the coordinates of no existing reports where found: false" do
      json_response = (File.open'./spec/fixtures/geocoded_report.json')
      stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=1333%2017th%20st%20denver%2080202&key=AIzaSyC5YJOlPCEVWz_i5J6vwhr-QMnLry1AlAI&language=en&sensor=false")
        .to_return(status: 200, body: json_response)

      report1 = Report.create!(street: "1333 17th st", city: "denver", zip: "80202", description: "a doggo", latitude: nil, longitude: nil, found: true)

      expect(subject.report_coordinates).to eq([])
    end
  end
end
