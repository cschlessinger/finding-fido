class Owner < ActiveRecord::Base

  def analyze

		content = self.bio
  		big_5 = []

  	  response = Excon.post(BASE_URL,
  	    :body => content,
  	    :headers => { "Content-Type" => "text/plain" },
  	    :user => USER,
  	    :password => PASS
  	  )
  	  
  	  profile = JSON.load(response.body)

  	  profile["tree"]["children"][0]["children"][0]["children"].each do |trait|
  	  	big_5 << trait["percentage"]
  	  end
  	  			
		end

  	end
end
