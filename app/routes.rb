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

get '/blog/page-:page' do
  options = {}
  options[:page_number] = params[:page].to_i
  blog(options)
end

get %r{/blog(/[0-9]{4})?(/[0-9]{2})?(/[a-z0-9\-]+)?} do
  options = {}
  params[:captures] ||= []
  params[:captures].each { |x| x.gsub!('/','') unless x.nil? } # Remove leading slashes
  options[:year]  = params[:captures][0]
  options[:month] = params[:captures][1]
  options[:name]  = params[:captures][2]
  blog(options)
end

get '/:page' do
  page params[:page]
end

not_found do
  page '404'
end