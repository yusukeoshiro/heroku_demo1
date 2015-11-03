class WelcomeController < ApplicationController
	#skip_before_action :login_required, :only => [:index]

	def index
		require 'pg'
		#conn = PG::Connection.open(:dbname => 'myapp_development')
        conn = PG::Connection.open(ENV['DATABASE_URL'])
		@res = conn.exec_params('SELECT * from salesforce.contact')
		conn.close
		#res[0]


	end



	
end
