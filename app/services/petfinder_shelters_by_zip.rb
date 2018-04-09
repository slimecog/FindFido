class PetfinderSheltersByZip
  def initialize(location)
    @location = location
  end

  def shelters
    PetfinderShelterSearch.new(location).run[:shelters].map do |raw_shelter|
      Shelter.new(raw_shelter)
    end
  end

  private
    attr_reader :location
end
