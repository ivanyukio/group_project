post '/categories/:category_id/items/:item_id/comments' do
  p params
  Comment.create(content: params[:content], user_id: session[:user].id, item_id: params[:item_id])
  redirect back
end

put '/categories/:category_id/items/:item_id/comments/:comment_id' do
  p params
  Comment.update(params[:comment_id], {:content => params[:content]})
  redirect back
end