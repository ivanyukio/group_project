get "/categories/:category_id/items/:id" do
  @item_to_display = Item.find(params[:id])
  erb :"items/show_item"
  # erb :_comments
end

get "/items/new" do
  @categories = Category.all
  erb :"items/new_item"
end

post "/items/new" do
  p params
  Item.create(name: params[:name], description: params[:description], price: params[:price], photo_url: params[:photo_url], category_id: params[:category_id], user_id: session[:user].id)
  redirect "/categories/#{params[:category_id]}"
end

get "/categories/:category_id/items/:id/update" do
  if session[:user].items.include?(Item.find(params[:id]))
    @item_to_edit = Item.find(params[:id])
    erb :"items/edit_item"
  else
    redirect "/categories/#{params[:category_id]}/items/#{params[:id]}"
  end
end

put "/categories/:category_id/items/:id/update" do

  Item.update(params[:id], {:name => params[:name], :description => params[:description], price: params[:price], :photo_url => params[:photo_url]})
  redirect "/categories/#{params[:category_id]}/items/#{params[:id]}"
end

delete "/categories/:category_id/items/:id" do
  Item.destroy(params[:id])
  redirect "/categories/#{params[:category_id]}"
end