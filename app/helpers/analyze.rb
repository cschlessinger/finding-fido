module Analyzable

	def analyze

		content = self.bio

		big_5 = {}
		ranked_traits = []

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
