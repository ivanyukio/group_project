get '/' do
  if current_user
    @categories = Category.all
    erb :'categories/all'
  else
    erb :login
  end
end

get '/login' do
  erb :login
end


post '/login' do
  user = User.authenticate(params[:email],params[:password])
  if user
    session[:user] = user
    redirect '/categories'
  else
    redirect '/login'
  end


end
