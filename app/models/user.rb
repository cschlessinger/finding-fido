class User < ActiveRecord::Base
	include Analyzable

	def match
		dogs = Dog.all

		matches = []

		dogs.each do |dog|
			results = dog.analyze
			if results = self.analyze
				matches << dog
			end
		end

		matches

	end
end
