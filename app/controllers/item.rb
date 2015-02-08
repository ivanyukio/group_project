get "/categories/:category_id/items/:id" do
  @item_to_display = Item.find(params[:id])

  erb :"items/show_item"
end

get "/profiles/:id/new_item" do
  erb :"items/new_item"
end

post "/profiles/:id/new_item" do
  user = User.find(session[:user].id)
  user.items.create(name: params[:name], description: params[:description], price: params[:price], photo_url: params[:photo_url], category_id: params[:cat_id].to_i)
  redirect "/profiles/#{user.id}"
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
  Item.update(params[:id], {:name => params[:name], :description => params[:description], price: params[:price]})
  redirect "/categories/#{params[:category_id]}/items/#{params[:id]}"
end