namespace "/posts" do

  get "" do
    filter = params[:filter] 
    if filter.nil?
      @posts = Post.all
    else
      @posts = Tag.find_by_name(filter).posts
    end
    erb :"post/index"
  end

  get '/new' do
    erb :"post/new"
  end

  post '/new' do
    post = Post.create(params[:post])
    tags = Tag.tags_from_str(params[:tags])
    post.tags = tags

    redirect to("/posts")
  end

  get '/:id/edit' do
    @post = Post.find(params[:id])
    erb :"post/edit"
  end

  post '/:id/edit' do
    post = Post.find(params[:id])
    post.update_attributes(params[:post])
    tags = Tag.tags_from_str(params[:tags])
    post.tags = tags

    redirect("/post/#{post.id}")
  end


  get '/:id' do
    @post = Post.find(params[:id])
    erb :"post/show"
  end

  # delete "posts/:id"

end