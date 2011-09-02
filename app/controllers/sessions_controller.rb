class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_username(params[:username])
  	if user && user.authenticate(params[:password])
  		sign_in user
  		redirect_to root_path, :notice => "logged in!"
  	else
  		flash.now.alert = "invalid email or password"
  		render "new"
  	end
  end

  def destroy
  	sign_out
  	redirect_to root_path, :notice => "logged out!"
  end
end
