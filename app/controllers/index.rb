get '/' do
	session.delete(:errors)
	if session[:user_id]
		@matches = User.find(session[:user_id]).analyze
	else
		@matches = User.first.analyze
	end
	# @dogs = []
	# @matches.each {|pup| @dogs << Dog.search(pup)}
	@dogs = Dog.search("pug")
	erb :application
end


post '/users' do
	@user = User.new(params)
	if @user.bio.length < 300
		session[:errors] = "We need a bio of at least 300 words to match you with your perfect pet!"
		erb :application
	else
		@user.save
		session[:user_id] = @user.id
		redirect '/'
	end
end
