get '/' do
  p session
  if current_user
    @categories = Category.all
    redirect "/categories"
  else
    redirect "/login"
  end
end

get '/login' do
  erb :login
end

post "/" do
  session[:user] = nil
  redirect "/login"
end

post "/login" do
  session[:user] = User.authenticate(params[:email], params[:password])
  if session[:user] != nil
    redirect "/categories"
  else
    redirect "/login"
  end
end
