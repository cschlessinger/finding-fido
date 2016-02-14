class User < ActiveRecord::Base
	include Analyzable
	after_create :analyze
  after_create :match

def match

breeds_array = []

  Dog.all.each do |pup|
    if (self.openness + 15) >= pup.openness && pup.openness >= (self.openness - 15)
      if (self.agreeableness + 15) >= pup.agreeableness && pup.agreeableness >= (self.agreeableness - 15)
        if (self.extraversion + 15) >= pup.extraversion && pup.extraversion >= (self.extraversion - 15)
          if (self.conscientiousness + 15) >= pup.conscientiousness && pup.conscientiousness >= (self.conscientiousness - 15)
            if (self.neuroticism + 15) >= pup.neuroticism && pup.neuroticism >= (self.neuroticism - 15)
              breeds_array << pup.breed
            end
          end
        end
      end
    end
  end

  p breeds_array

end

end
