 get "/tag/:name" do
  @posts = Tag.find_by_name(params[:name]).posts   
  erb :"post/index"
 end


# Show me all posts with a given tag
