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
		  self.update(trait["id"].downcase => trait["percentage"] * 100)
	  end

	end

end
