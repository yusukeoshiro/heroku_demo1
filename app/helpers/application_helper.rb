module ApplicationHelper
	def getImageByCode(code)

		require 'pg'
		conn = PG::Connection.open(ENV['DATABASE_URL'])
		q = "SELECT url__c FROM salesforce.branding__c WHERE code__c = '#{code}' "
		puts q
		res = conn.exec_params(q)
		conn.close

		if res.num_tuples == 0
			return false
		else
			if res[0]['url__c'] == nil
				return false
			else
				return res[0]['url__c']
			end

		end
	end

end
