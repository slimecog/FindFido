class SessionsController < ApplicationController
  def create
    if
      user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to root_path, success: "Welcome, #{current_user.name}"
    else
      redirect_to root_path, danger: "Something went wrong. Try again?"
    end
  end

  def destroy
    session.clear
    redirect_to root_path, success: "Successfully Signed Out"
  end
end