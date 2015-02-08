get '/categories' do
  @categories = Category.all
  erb :'categories/all' if current_user
end

get '/categories/:id' do
  @category_name = Category.find(params[:id]).name
  @items = Item.where(category_id: params[:id])
  erb :'categories/show'
end

post "/categories" do
  session[:user] = nil
  redirect "/login"
end