class Dog < ActiveRecord::Base
  require 'awesome_print'
  include Analyzable
  after_create :analyze

  def self.search(breed)
		response = Excon.get("http://api.petfinder.com/pet.find?location=san+francisco+CA&breed=#{breed}&format=json&count=100&key=#{ENV['petfinder_key']}")
		body = JSON.load(response.body)

  	data = []

		body["petfinder"]["pets"]["pet"].each do |dog|
			arr = [dog["name"]["$t"], dog["description"]["$t"], dog["media"]["photos"]["photo"][0]["$t"]]
			data << arr
		end

		data

	end

end
