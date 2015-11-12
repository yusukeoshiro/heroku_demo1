class CouponsController < ApplicationController
	def index
		conn = PG::Connection.open(ENV['DATABASE_URL'])
		@coupons = conn.exec_params("SELECT * FROM salesforce.sentcoupon__c WHERE user__c = '#{session[:user_id]}' AND sent_time__c < '#{Time.now.utc}' ")
		conn.close
		#@num_coupons = @coupons.num_tuples()
		#@has_new_coupons = @num_coupons > 0
      
	end

end
