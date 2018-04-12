class Report < ApplicationRecord
  geocoded_by :full_street_address
  after_validation :geocode

  validates_presence_of :street
  validates_presence_of :city
  validates_presence_of :zip

  def full_street_address
    street + " " + city + " " + zip
  end
end
