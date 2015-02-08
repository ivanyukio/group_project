get "/profiles" do
  @profiles = User.all
  erb :all_profiles
end

get '/profiles/:id' do
  @user = User.find(params[:id])
  erb :profile
end