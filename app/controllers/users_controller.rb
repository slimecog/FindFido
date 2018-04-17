class UsersController < ApplicationController
  def update
    user = User.find(params[:id])
    user.update! zipcode: params[:user][:zipcode]
    redirect_to shelters_path
  end
end
