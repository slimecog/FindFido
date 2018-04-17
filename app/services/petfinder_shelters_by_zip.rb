class PetfinderSheltersByZip
  def initialize(zipcode)
    @zipcode = zipcode
  end

  def shelters
    PetfinderShelterSearch.new(zipcode).run[:petfinder][:shelters][:shelter].map do |raw_shelter|
      require "pry"; binding.pry
      Shelter.new(raw_shelter)
    end
  end

  private
    attr_reader :zipcode
end
