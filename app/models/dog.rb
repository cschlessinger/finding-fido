class Dog < ActiveRecord::Base
  include Analyzable
  after_create :analyze
  require 'awesome_print'

  def self.find(breed)
		response = Excon.get("http://api.petfinder.com/pet.find?location=san+francisco+CA&breed=#{breed}&format=json&count=1&key=#{ENV['petfinder_key']}")
		p response[:body][:petfinder]
		# ["pets"]["pet"][0]["age"]
	end

end
