class User < ActiveRecord::Base

	before_create :encrypt_password

	def self.authenticate(email, password)
      #find_by_email_and_password(email, Digest::SHA1.hexdigest(password))
      conn = PG::Connection.open(ENV['DATABASE_URL'])
      #@res = conn.exec_params("SELECT * FROM salesforce.contact (lastname, password__c, email) VALUES ('#{@user.name}','#{@user.password}','#{@user.email}')")
      res = conn.exec_params("SELECT * FROM salesforce.contact WHERE email = '#{email}' AND hd_password__c = '#{Digest::SHA1.hexdigest(password)}'")
      conn.close
      if res.num_tuples() > 0
      	return res[0]
      else
      	return nil
      end

  end

  private 
  def encrypt_password
  	self.password = Digest::SHA1.hexdigest(self.password)
  end

end
