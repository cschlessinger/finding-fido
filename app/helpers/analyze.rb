module Analyzable

	def analyze

		content = self.bio

		big_5 = {}

	  response = Excon.post(ENV['url'],
	    :body => content,
	    :headers => { "Content-Type" => "text/plain" },
	    :user => ENV['user'],
	    :password => ENV['pass']
	  )
	  
	  profile = JSON.load(response.body)

	  profile["tree"]["children"][0]["children"][0]["children"].each do |trait|
	  	big_5[trait["name"]] = trait["percentage"]
	  end

	  sorted_traits = big_5.sort {|a,b| b[1]<=>a[1]}
	  			
		p sorted_traits

	end

end