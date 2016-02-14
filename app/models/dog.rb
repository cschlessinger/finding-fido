class Dog < ActiveRecord::Base
  require 'awesome_print'
  include Analyzable
  after_create :analyze

  def self.search(breed)
		response = Excon.get("http://api.petfinder.com/pet.find?location=san+francisco+CA&breed=#{breed}&format=json&count=100&key=#{ENV['petfinder_key']}")
		body = JSON.load(response.body)

		# p body["petfinder"]["pets"]["pet"]["name"]["$t"]

  # 	data = {}

		# body["petfinder"]["pets"]["pet"].each do |dog|
		# 	id = dog["id"]["$t"]
		# 	data[id] = {}
		# 	data[id]["name"] = dog["name"]["$t"]
		# 	data[id]["description"] = dog["description"]["$t"]
		# 	data[id]["photo"] = dog["media"]["photos"]["photo"][0]["$t"]
		# end

  	data = []

		body["petfinder"]["pets"]["pet"].each do |dog|
			arr = [dog["name"]["$t"], dog["description"]["$t"], dog["media"]["photos"]["photo"][0]["$t"]]
			data << arr
		end

		data

		# ["name"]
		# data["description"] = body["petfinder"]["pets"]["pet"]["description"]
		# data["photo"] = body["petfinder"]["pets"]["pet"]["media"]["photos"]["photo"][0]["$t"]
		# p data
	end

end
