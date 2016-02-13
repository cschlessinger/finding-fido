class User < ActiveRecord::Base
	include Analyzable

	def match

		my_traits = self.analyze

		matches = []

		Dog.all.each do |dog|
			results = dog.analyze
			if results == my_traits
				matches << dog
			end
		end

		p matches

	end
end
