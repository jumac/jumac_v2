class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_username(params[:username])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id  	
      notice = "Login successfully."	
    else 
      notice = "Invalid username or password."
  	end
    redirect_to home_index_path, :notice => notice
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to home_index_path, :notice => "Logged out."
  end
end
