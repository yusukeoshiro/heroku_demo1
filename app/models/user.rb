class User < ActiveRecord::Base

    def self.authenticate(email, password)
      find_by_email_and_password(email, Digest::SHA1.hexdigest(password))
    end



end
