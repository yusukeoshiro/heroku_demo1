class SessionsController < ApplicationController
	skip_before_action :login_required, :only => [:new,:create]


	def create
		user = User.authenticate(params[:email],params[:password])
		if user
			session[:user_id] = user['sfid']
			session[:user_name] = user['name']
			redirect_to root_path
		else
			flash[:alert] = "failed to login"
			render :action => 'new'
		end
	end

	def destroy
		reset_session
		flash[:alert] = "logged out"
		redirect_to login_path
	end

	def new
	end
end
