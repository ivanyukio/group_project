get '/signup' do
  erb :signup
end

post '/signup' do
  name = params[:name]
  email = params[:email]
  password=params[:password]
  if name && valid_email(email) && password == params[:password_confirmation]
    session[:user]=User.create(name: name, email: email, password_digest: password)
    redirect '/categories'
  elsif !valid_email(email)
    @message = " This is not a valid email"
    redirect '/signup'
  elsif !password == params[:password_confirmation]
    @message = " Passwords mismatch"
    redirect '/signup'
  else
    redirect '/signup'
  end
end
