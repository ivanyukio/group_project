get '/profiles' do
  @profiles = User.all
  erb :profiles
end

get '/profiles/:id' do
  @user = User.find(params[:id])
  erb :profile
end

get "/profiles/:id/new_item" do

  erb :"items/new_item"
end

post "/profiles/:id/new_item" do
  user = User.find(session[:user].id)
  user.items.create(name: params[:name], description: params[:description], price: params[:price], photo_url: params[:photo_url], category_id: params[:cat_id].to_i)
  redirect "/profiles/#{user.id}"
end