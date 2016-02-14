module Analyzable

	def analyze

		content = self.bio

		if self.openness == nil #this was added to work with artificially created seed data for demo purposes and avoid blocking from 'after_create' method in Dog model
	  	response = Excon.post(ENV['ibm_url'],
	    :body => content,
	    :headers => { "Content-Type" => "text/plain" },
	    :user => ENV['ibm_user'],
	    :password => ENV['ibm_pass']
	  )
		  profile = JSON.load(response.body)

			profile["tree"]["children"][0]["children"][0]["children"].each do |trait|
				 self.update(trait["id"].downcase => trait["percentage"] * 10)
			end
		end
	end

end
