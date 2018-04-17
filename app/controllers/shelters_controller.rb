class SheltersController < ApplicationController
  before_action :require_user

  def index
    @shelters = PetfinderSheltersByZip.new(current_user.zipcode).shelters
  end
end
