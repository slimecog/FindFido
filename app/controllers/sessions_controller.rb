class SessionsController < ApplicationController
  def create
    if
      user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to root_path, danger: "Something went wrong. Try again?"
    end
  end

  def destroy
    session.clear
    redirect_to root_path, success: "Successfully Signed Out"
  end
end
