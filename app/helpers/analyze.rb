module Analyzable

	def analyze

		content = self.bio

		big_5 = {}
		ranked_traits = []

	  response = Excon.post(ENV['url'],
	    :body => content,
	    :headers => { "Content-Type" => "text/plain" },
	    :user => ENV['user'],
	    :password => ENV['pass']
	  )

	  profile = JSON.load(response.body)

	  profile["tree"]["children"][0]["children"][0]["children"].each do |trait|
	  	# big_5[trait["name"]] = trait["percentage"]
		  self[trait["name"]] = trait["percentage"]
		  self.save
	  end

	end


end
