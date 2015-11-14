class PagesController < ApplicationController

	def index
	end

	def userid
		#@user = User.find(session['user_id'])
		query = "SELECT * FROM salesforce.contact WHERE sfid = '#{session['user_id']}'"
		puts query
		conn = PG::Connection.open(ENV['DATABASE_URL'])
		res = conn.exec_params(query)
		conn.close

		@user = res[0]
	end

end
