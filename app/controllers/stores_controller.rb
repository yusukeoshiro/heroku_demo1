class StoresController < ApplicationController

	def index

        conn = PG::Connection.open(ENV['DATABASE_URL'])
		@res = conn.exec_params('SELECT * from salesforce.store__c')
		conn.close

	end

end
