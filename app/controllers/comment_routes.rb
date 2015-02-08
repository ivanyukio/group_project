post '/items/:category_id/comments/:id' do
  p params
  Comment.create(params)
  redirect back
end

put '/items/:category_id/comments/:id' do
  Comment.update_attributes(params)
  redirect back
end