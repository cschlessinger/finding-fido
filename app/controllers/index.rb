# get '/dogs/:id' do
# 	dog = Dog.find(params[:id])
# end

# get '/owners/:id' do
# 	owner = Owner.find(params[:id])
# end

get '/' do
	@matches = User.first.match

	# @matches.each do |breed|
	# 	breed = Dog.find(breed)
	# end
	@dogs = Dog.search("pug")


	# p @dogs["31947859"]

	# @dogs.each do |key|
	# 	p key
	# end

	# thing.each do |key, value|
	# 	p key[value]
	# end



	# @matches.each do |breed|
	# 	@breed = Dog.search(breed)
	# 	p @breed
	# end

	erb :application
end
