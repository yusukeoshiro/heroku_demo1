class ProductsController < ApplicationController

	def index
		require 'pg'
		#conn = PG::Connection.open(:dbname => 'myapp_development')
        conn = PG::Connection.open(ENV['DATABASE_URL'])
		@res = conn.exec_params('SELECT * from salesforce.product__c')
		conn.close

	end
end
