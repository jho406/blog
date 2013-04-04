get '/' do
  # Look in app/views/index.erb
  @posts = Post.all
  erb :index
end

get '/new' do
  erb :new
end

post '/new' do
  post = Post.new(params[:post])
  tags = params[:tags].split(",")
  tags.each{|name| post.tags.create(:name=>name)}
  redirect to("/")
end
