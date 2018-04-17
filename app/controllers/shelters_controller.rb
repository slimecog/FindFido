class SheltersController < ApplicationController
  before_action :require_user

  def index
    @shelters = PetfinderSheltersByZip.new(params[:location]).shelters
  end
end
