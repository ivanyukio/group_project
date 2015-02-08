get '/categories' do
  @categories = Category.all

  erb :'categories/all'
end

get '/categories/:id' do
  @items = Item.where(category_id: params[:id])

  erb :'categories/show'
end

get "/categories/new_item" do
  erb :"items/new_item"
end

post "/categories/new_item" do
  User.find(session[:user].id).items.create(name: params[:name], description: params[:description], price: params[:price], photo_url: params[:photo_url], category_id: params[:category_id].to_i)
  redirect "/categories/#{params[:category_id]}"
end