get '/' do
  # Look in app/views/index.erb
  redirect to("/posts")
end

get '/new' do
  erb :new
end

post '/new' do
  post = Post.create(params[:post])
  tags = params[:tags].split(",")
  tags.each{|name| post.tags.create(:name=>name)}
  redirect to("/")
end
