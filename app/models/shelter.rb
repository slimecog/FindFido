class Shelter
  attr_reader :name,
              :phone,
              :email,
              :address,
              :city,
              :zip,
              :latitude,
              :longitude

  def initialize(attrs = {})
    require "pry"; binding.pry
    @name      = attrs[:name][:$t]
    @phone     = attrs[:phone][:$t]
    @email     = attrs[:email][:$t]
    @address   = attrs[:address1][:$t]
    @city      = attrs[:city][:$t]
    @zip       = attrs[:zip][:$t]
    @latitude  = attrs[:latitude][:$t]
    @longitude = attrs[:longitude][:$t]
  end

  def mailing_address
    if @address
      @address + ' ' + @city + ' ' + @state
    else
      @city + ' ' + @state
    end
  end
end
