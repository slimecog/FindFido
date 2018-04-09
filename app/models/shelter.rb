class Shelter
  attr_reader :name,
              :phone,
              :email,
              :address,
              :city,
              :zip

  def initialize(attrs = {})
    @name = attrs[:name]
    @phone = attrs[:phone]
    @email = attrs[:email]
    @address = attrs[:address]
    @city = attrs[:city]
    @zip = attrs[:zip]
  end
end
