get '/' do
  redirect '/about', 301
end

get '/style.css' do
  headers 'Content-type' => 'text/css; charset=utf-8'
  sass :stylesheet
end

get '/blog' do
  Post.list().inject do |post|
    post.html
  end
end

get '/blog/:year/:month/:name' do
  post(
    :year => params[:year],
    :month => params[:month],
    :name => params[:name]
  )
end

get '/:page' do
  page params[:page]
end

not_found do
  page '404'
end