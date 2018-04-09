class PetfinderShelterSearch

  def initialize(location)
    @location = location
  end

  def run
    get_json("/shelter.find")
  end

  private
    attr_reader :location

    def conn
      Faraday.new("http://api.petfinder.com/", params: params)
    end

    def params
      {
        'key' => ENV['PETFINDER_API_KEY'],
        "location" => @location,
        "format" => "json",
        "count" => "10"
      }
    end

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
end
