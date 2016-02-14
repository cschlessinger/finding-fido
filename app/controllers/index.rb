# get '/dogs/:id' do
# 	dog = Dog.find(params[:id])
# end

# get '/owners/:id' do
# 	owner = Owner.find(params[:id])
# end

get '/' do
	@matches = User.first.match
	erb :application
end
