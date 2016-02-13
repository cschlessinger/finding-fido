class Owner < ActiveRecord::Base

	BASE_URL="https://gateway.watsonplatform.net/personality-insights/api/v2/profile"

  def analyze

		content = self.bio
  		big_5 = {}

  	  response = Excon.post(BASE_URL,
  	    :body => content,
  	    :headers => { "Content-Type" => "text/plain" },
  	    :user => ENV['user'],
  	    :password => ENV['pass']
  	  )
  	  
  	  profile = JSON.load(response.body)

  	  profile["tree"]["children"][0]["children"][0]["children"].each do |trait|
  	  	big_5[trait["name"]] = trait["percentage"]
  	  end

  	  big_5.sort {|a,b| b[1]<=>a[1]}
  	  			
		end

		big_5

  	end
end
