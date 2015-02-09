get '/categories' do
  if current_user
    @categories = Category.all
    erb :'categories/all'
  else
    erb :login
  end

end

get '/categories/:id' do
  @items = Item.where(category_id: params[:id])
  if current_user
    erb :'categories/show'
  else
    erb :login
  end
end