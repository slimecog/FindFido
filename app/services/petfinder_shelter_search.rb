class PetfinderShelterSearch
  def initialize(param)
    @param = param
  end

  def by_zip
    get_json("shelter.find?key=#{ENV['PETFINDER_API_KEY']}&location=#{param}&format=json&count=10")
  end

  def by_id
    get_json("shelter.get?key=#{ENV['PETFINDER_API_KEY']}&id=#{param}&format=json")
  end

  private
    attr_reader :param

    def conn
      Faraday.new("http://api.petfinder.com/")
    end

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
end
