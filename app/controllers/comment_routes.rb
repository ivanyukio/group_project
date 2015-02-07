post '/items/:id/comments/?' do
  Comment.create(params)
  redirect back
end

put '/items/:id/comments/:id/?' do
  Comment.update_attributes(params)
  redirect back
end