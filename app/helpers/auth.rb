def current_user
  if session[:user]
    return User.find(session[:user])
  else
    return nil
  end
end

#doesn't belong here but checks an email is valid
def valid_email(email)
  return true if email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
  false
end
