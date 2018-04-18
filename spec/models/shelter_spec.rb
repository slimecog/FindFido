require "rails_helper"

RSpec.describe Shelter, type: :model do
  it "has attributes" do
    attrs = {
              "country": {
                  "$t": "US"
              },
              "longitude": {
                  "$t": "-104.9842"
              },
              "name": {
                  "$t": "Saving Dobermankind Animal Rescue"
              },
              "phone": {
                  "$t": "(720) 722-4277"
              },
              "state": {
                  "$t": "CO"
              },
              "address2": {},
              "email": {
                  "$t": "hookedondobies@gmail.com"
              },
              "city": {
                  "$t": "Denver"
              },
              "zip": {
                  "$t": "80250"
              },
              "fax": {},
              "latitude": {
                  "$t": "39.7392"
              },
              "id": {
                  "$t": "CO453"
              },
              "address1": {}
            }
    shelter = Shelter.new(attrs)

    expect(shelter.name).to eq("Saving Dobermankind Animal Rescue")
    expect(shelter.phone).to eq("(720) 722-4277")
    expect(shelter.email).to eq("hookedondobies@gmail.com")
    expect(shelter.address).to eq(nil)
    expect(shelter.city).to eq("Denver")
    expect(shelter.zipcode).to eq("80250")
    expect(shelter.latitude).to eq(39.7392)
    expect(shelter.longitude).to eq(-104.9842)
    expect(shelter.id).to eq("CO453")
  end

  it "skips address line on .mailing_address if a.address.nil?" do
    attrs = {
              "country": {
                  "$t": "US"
              },
              "longitude": {
                  "$t": "-104.9842"
              },
              "name": {
                  "$t": "Saving Dobermankind Animal Rescue"
              },
              "phone": {
                  "$t": "(720) 722-4277"
              },
              "state": {
                  "$t": "CO"
              },
              "address2": {},
              "email": {
                  "$t": "hookedondobies@gmail.com"
              },
              "city": {
                  "$t": "Denver"
              },
              "zip": {
                  "$t": "80250"
              },
              "fax": {},
              "latitude": {
                  "$t": "39.7392"
              },
              "id": {
                  "$t": "CO453"
              },
              "address1": {}
            }
    shelter = Shelter.new(attrs)

    expect(shelter.mailing_address).to eq("Denver CO 80250")
  end

  it "includes address in .mailing_address if .address" do
    attrs = {
              "country": {
                  "$t": "US"
              },
              "longitude": {
                  "$t": "-104.9842"
              },
              "name": {
                  "$t": "Saving Dobermankind Animal Rescue"
              },
              "phone": {
                  "$t": "(720) 722-4277"
              },
              "state": {
                  "$t": "CO"
              },
              "address2": {},
              "email": {
                  "$t": "hookedondobies@gmail.com"
              },
              "city": {
                  "$t": "Denver"
              },
              "zip": {
                  "$t": "80250"
              },
              "fax": {},
              "latitude": {
                  "$t": "39.7392"
              },
              "id": {
                  "$t": "CO453"
              },
              "address1": {
                  "$t": "123 main st"
              }
            }
    shelter = Shelter.new(attrs)

    expect(shelter.mailing_address).to eq("123 main st Denver CO 80250")
  end
end
