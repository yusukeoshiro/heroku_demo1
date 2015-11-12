class StoresController < ApplicationController

	def index

        conn = PG::Connection.open(ENV['DATABASE_URL'])
		@res = conn.exec_params('SELECT * from salesforce.store__c')
		conn.close

	end

	def show
        
        conn = PG::Connection.open(ENV['DATABASE_URL'])
		@store = conn.exec_params("SELECT * from salesforce.store__c WHERE id ='#{params[:id]}'")[0]
		conn.close

	end

end
