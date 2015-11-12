class CartProductsController < ApplicationController

	def index
		query = "
		SELECT salesforce.cartitem__c.id AS cartitem_id, salesforce.cartitem__c.*, salesforce.product__c.*
		FROM salesforce.cartitem__c
		INNER JOIN salesforce.product__c ON salesforce.cartitem__c.product__c = salesforce.product__c.sfid
		WHERE salesforce.cartitem__c.user__c = '#{session['user_id']}'
		";
		#print query
		conn = PG::Connection.open(ENV['DATABASE_URL'])
		@res = conn.exec_params(query)
		conn.close
	end

	def add
		product_id = params[:pid]
		#find product sfid
		conn = PG::Connection.open(ENV['DATABASE_URL'])
		product = conn.exec_params("SELECT sfid FROM salesforce.product__c WHERE id = '#{product_id}'")
		product_sfid = product[0]['sfid']
		
		#insert into cart		
		conn.exec_params("INSERT INTO salesforce.cartitem__c (product__c, user__c, quantity__c) VALUES ('#{product_sfid}','#{session['user_id']}', 1)  ")
        #@res = conn.exec_params("INSERT INTO salesforce.contact (lastname, password__c, email) VALUES ('#{@user.name}','#{@user.password}','#{@user.email}')")
		conn.close

		redirect_to cart_path
	end

	def remove
		id = params[:id]
		conn = PG::Connection.open(ENV['DATABASE_URL'])
		conn.exec_params( "DELETE FROM salesforce.cartitem__c WHERE id = '#{id}'" );
		conn.close		
		redirect_to cart_path
	end

end



#SELECT salesforce.cartitem__c.*, salesforce.product__c.* FROM salesforce.cartitem__c INNER JOIN salesforce.product__c ON salesforce.cartitem__c.product__c = salesforce.product__c.sfid WHERE salesforce.cartitem__c.user__c = '003280000083synAAA'
