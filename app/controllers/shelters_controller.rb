class SheltersController < ApplicationController
  def index
    @shelters = PetfinderSheltersByZip.new(params[:location]).shelters
  end
end
