get '/signup' do
  @message = flash[:message]
  erb :signup
end

post '/signup' do
  name = params[:name]
  email = params[:email]
  password=params[:password]
  password_conf=params[:password_confirmation]
  if name && valid_email(email) && password == password_conf
    session[:user]=User.create(name: name, email: email, password: password, password_confirmation: password_conf)
    redirect '/categories'
  elsif !valid_email(email)
    flash[:message] = " This is not a valid email"
    redirect '/signup'
  elsif !password == params[:password_confirmation]
    flash[:message] = " Passwords mismatch"
    redirect '/signup'
  else
    redirect '/signup'
  end
end
