class ProductsController < ApplicationController

	def index
		require 'pg'
		#conn = PG::Connection.open(:dbname => 'myapp_development')
		conn = PG::Connection.open('postgres://qjatvjbnvxzfsw:KXQiEFnBauRwwzgjwV-i8-1zCk@ec2-107-21-221-59.compute-1.amazonaws.com:5432/d2v2ondd0t67ci')
		@res = conn.exec_params('SELECT * from salesforce.product2')
	end
end
