get "/categories/:category_id/items/:id" do
  @item_to_display = Item.find(params[:id])
  if current_user
    erb :"items/show_item"
  else
    erb :login
  end
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

delete "/categories/:category_id/items/:id" do
  Item.destroy(params[:id])
  redirect "/categories/#{params[:category_id]}"
end