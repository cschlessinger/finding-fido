get '/dogs/:id' do
	dog = Dog.find(params[:id])
	dog.analyze
end

get '/owners/:id' do
	owner = Owner.find(params[:id])
	owner.analyze
end

get '/' do
	p "*" * 100
end