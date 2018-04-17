class PetfinderShelterSearch
  def initialize(zipcode)
    @zipcode = zipcode
  end

  def run
    get_json("shelter.find?key=#{ENV['PETFINDER_API_KEY']}&location=#{zipcode}&format=json&count=10")
  end

  private
    attr_reader :zipcode

    def conn
      Faraday.new("http://api.petfinder.com/")
    end

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
end
