get '/profiles/:id/edit' do
  @user = User.find(params[:id])
  @message_email = flash[:message_email]
  @message_password = flash[:message_password]
  erb :edit
end



# One edit for each item
post '/edit_name' do
  session[:user].update_attributes(name: params[:name])
  @user = session[:user]
  redirect "profiles/#{@user.id}/edit"
end

post '/edit_email' do
  if valid_email(params[:email])
    session[:user].update_attributes(email: params[:email])
  else
    flash[:message_email]= "This is not a valid email"
  end
  @user = session[:user]
  redirect "profiles/#{@user.id}/edit"
end


# passwords must match, message displayed in the edit page, next to the field
post '/edit_password' do
  if params[:password] == params[:password_confirmation]
    session[:user].update_attributes(password: params[:password])
  else
    flash[:message_password] = "The passwords must match"
  end
  @user = session[:user]
  redirect "profile/#{@user.id}/edit"
end