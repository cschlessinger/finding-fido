class User < ActiveRecord::Base
	include Analyzable

	def match
		dogs = Dog.all

		match = []

		dogs.each do |dog|
			results = dog.analyze
			if results = self.analyze
				match << dog
			end
		end
	end
end
