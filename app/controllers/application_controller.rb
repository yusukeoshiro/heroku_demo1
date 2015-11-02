class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :login_required

  private
  def current_user
  	if session[:user_id]
  		@login_user ||= User.find_by(:id=>session[:user_id])
  	end
  end

  	

  def login_required
  	unless current_user
  		flash[:alert] = "please login"
  		redirect_to login_path
  	end
  end

end
