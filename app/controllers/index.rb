before '/post*' do
  @tags = Tag.all
end

get '/' do
  # Look in app/views/index.erb
  redirect to("/posts")
end


