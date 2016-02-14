module Analyzable

	def analyze

		content = self.bio

		big_5 = {}
		ranked_traits = []
 		if self.openness == nil || self.agreeableness == nil || self.neuroticism == nil || self.extraversion == nil || self.conscientiousness == nil
		  response = Excon.post(ENV['url'],
		    :body => content,
		    :headers => { "Content-Type" => "text/plain" },
		    :user => ENV['user'],
		    :password => ENV['pass']
		  )

		  profile = JSON.load(response.body)


		  profile["tree"]["children"][0]["children"][0]["children"].each do |trait|
			  self.update(trait["id"].downcase => trait["percentage"] * 10)
	  	end
		end
	end

end
