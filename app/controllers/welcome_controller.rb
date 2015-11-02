class WelcomeController < ApplicationController
	#skip_before_action :login_required, :only => [:index]

	def index
		require 'pg'
		#conn = PG::Connection.open(:dbname => 'myapp_development')
		conn = PG::Connection.open('postgres://jlvqgelfdubvrg:6lZ-mGpJwbPffz62kXQvXyHOvD@ec2-54-225-194-162.compute-1.amazonaws.com:5432/d3qroctqca1n9g')
		@res = conn.exec_params('SELECT * from salesforce.contact')
		#res[0]


	end



	
end
