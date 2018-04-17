class SheltersController < ApplicationController
  before_action :require_user

  def index
    @shelters ||= PetfinderShelters.new(current_user.zipcode).by_zip
    @shelter_coordinates = shelter_coordinates
  end

  def show
    @shelter = PetfinderShelters.new(params[:id]).by_id
  end

  private
    def shelter_coordinates
      @shelters.reduce(Array.new) do |memo, shelter|
        memo << [shelter.latitude, shelter.longitude]
        memo
      end
    end
end
