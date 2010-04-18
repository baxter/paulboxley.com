get '/' do
  redirect '/blog', 301
end

get '/index' do
  redirect '/blog', 301
end

get '/stylesheet.css' do
  redirect '/style.css', 301
end

get '/:style.css' do
  headers 'Content-type' => 'text/css; charset=utf-8'
  sass params[:style].to_sym
end

get '/blog/feed.atom' do
  feed :atom
end

get '/blog' do
  blog
end

get '/blog/:year' do
  blog(
    :year => params[:year]
  )
end

get '/blog/:year/:month' do
  blog(
    :year => params[:year],
    :month => params[:month]
  )
end

get '/blog/:year/:month/:name' do
  blog(
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