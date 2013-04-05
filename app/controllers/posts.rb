

get "/posts" do
  @posts = Post.all
  erb :"post/index"
end

get '/post/new' do
  erb :"post/new"
end

post '/post/new' do
  post = Post.create(params[:post])
  tags = Tag.tags_from_str(params[:tags])
  post.tags = tags

  redirect to("/posts")
end

get '/post/:id/edit' do
  @post = Post.find(params[:id])
  erb :"post/edit"
end

post '/post/:id/edit' do
  post = Post.find(params[:id])
  post.update_attributes(params[:post])
  tags = Tag.tags_from_str(params[:tags])
  post.tags = tags

  redirect("/post/#{post.id}")
end


get '/post/:id' do
  @post = Post.find(params[:id])
  erb :"post/show"
end

# delete "posts/:id"

