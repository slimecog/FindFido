class Shelter
  attr_reader :name,
              :phone,
              :email,
              :address,
              :city,
              :zipcode,
              :latitude,
              :longitude,
              :id

  def initialize(attrs = {})
    @name      = attrs[:name][:$t]
    @phone     = attrs[:phone][:$t]
    @email     = attrs[:email][:$t]
    @address   = attrs[:address1][:$t]
    @city      = attrs[:city][:$t]
    @state     = attrs[:state][:$t]
    @zipcode   = attrs[:zip][:$t]
    @latitude  = attrs[:latitude][:$t].to_f
    @longitude = attrs[:longitude][:$t].to_f
    @id        = attrs[:id][:$t]
  end

  def mailing_address
    if @address.nil?
      @city + ' ' + @state + ' ' + @zipcode
    else
      @address + ' ' + @city + ' ' + @state + ' ' + @zipcode
    end
  end
end
