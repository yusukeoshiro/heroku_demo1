class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :login_required
  before_filter :application

  def application
    #@test = 'test'  
      conn = PG::Connection.open(ENV['DATABASE_URL'])
      @coupons = conn.exec_params("SELECT * FROM salesforce.sentcoupon__c WHERE user__c = '#{session[:user_id]}' AND sent_time__c < '#{Time.now.utc}' ")
      @num_coupons = conn.exec_params("SELECT * FROM salesforce.sentcoupon__c WHERE user__c = '#{session[:user_id]}' AND sent_time__c < '#{Time.now.utc}' AND sent_time__c > '#{(Time.now -  60 * 24).utc}' ").num_tuples()
      @has_new_coupons = @num_coupons > 0
      conn.close

  end


  private
  def current_user
  	if session[:user_id]
  		#@login_user ||= User.find_by(:id=>session[:user_id])


      conn = PG::Connection.open(ENV['DATABASE_URL'])
      res = conn.exec_params("SELECT * FROM salesforce.contact WHERE sfid = '#{session[:user_id]}'")
      conn.close
      if res.num_tuples() > 0
        return res[0]
      else
        return false
      end
  	end
  end

  	

  def login_required
  	unless current_user
  		flash[:alert] = "please login"
  		redirect_to login_path
  	end
  end

end
