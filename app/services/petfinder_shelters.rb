class PetfinderShelters
  def initialize(param)
    @param = param
  end

  def by_zip
    PetfinderShelterSearch.new(param).by_zip[:petfinder][:shelters][:shelter].map do |raw_shelter|
      Shelter.new(raw_shelter)
    end
  end

  def by_id
    attrs = PetfinderShelterSearch.new(param).by_id[:petfinder][:shelter]
    Shelter.new(attrs)
  end

  private
    attr_reader :param
end
