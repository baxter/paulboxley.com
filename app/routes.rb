get '/' do
  redirect '/index', 301
end

get '/style.css' do
  headers 'Content-type' => 'text/css; charset=utf-8'
  sass :stylesheet
end

get '/blog' do
  "BLOG!"
end

get '/:page' do
  page params[:page]
end

not_found do
  page '404'
end