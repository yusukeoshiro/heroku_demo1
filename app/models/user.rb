class User < ActiveRecord::Base

	before_create :encrypt_password

    def self.authenticate(email, password)
      find_by_email_and_password(email, Digest::SHA1.hexdigest(password))
    end

    private 
    def encrypt_password
    	self.password = Digest::SHA1.hexdigest(self.password)
	end

end
