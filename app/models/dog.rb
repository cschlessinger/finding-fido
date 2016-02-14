class Dog < ActiveRecord::Base
  require 'awesome_print'
  include Analyzable
  after_create :analyze

  def self.find(breed)
		response = Excon.get("http://api.petfinder.com/pet.find?location=san+francisco+CA&breed=#{breed}&format=json&count=3&key=#{ENV['petfinder_key']}")
		body = JSON.load(response.body)
		name = body["petfinder"]["pets"]["pet"]["name"]
		description = body["petfinder"]["pets"]["pet"]["description"]
		photo = body["petfinder"]["pets"]["pet"]["media"]["photos"]["photo"][0]["$t"]
	end

end
