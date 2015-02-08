get '/logout' do
  session.delete(:user)
  redirect '/'
end