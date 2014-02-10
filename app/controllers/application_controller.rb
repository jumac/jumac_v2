class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :get_current_username

  add_flash_types :message

  def get_current_username
    if session[:user_id]
      @username = User.find_by_id(session[:user_id]).username.upcase
    end
  end

  def authorize
  	unless User.find_by_id(session[:user_id])
  		redirect_to login_path, :alert => "Please login."
  	end
  end
end
