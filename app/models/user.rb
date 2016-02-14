class User < ActiveRecord::Base
	include Analyzable
	after_create :analyze
  # after_create :match

	def match

		breeds_array = []

	  Dog.all.each do |pup|
	    if (self.openness + 3) >= pup.openness && pup.openness >= (self.openness - 3)
	      if (self.agreeableness + 3) >= pup.agreeableness && pup.agreeableness >= (self.agreeableness - 3)
	        if (self.extraversion + 3) >= pup.extraversion && pup.extraversion >= (self.extraversion - 3)
	          if (self.conscientiousness + 3) >= pup.conscientiousness && pup.conscientiousness >= (self.conscientiousness - 3)
	            if (self.neuroticism + 3) >= pup.neuroticism && pup.neuroticism >= (self.neuroticism - 3)
	              breeds_array << pup.breed
	            end
	          end
	        end
	      end
	    end
	  end

	  breeds_array

	end

end
