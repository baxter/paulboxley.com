require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'bluecloth'

set :haml, { :format => :html5 }
set :sass, { :style  => :expanded }

before do
  # response.headers['Cache-Control'] = 'public, max-age=31557600'
  headers 'Cache-Control' => 'public, max-age=31557600'
end

def page ( page_name )
  @page_name = page_name
  begin
    @content = BlueCloth.new(File.read("pages/#{page_name}.md")).to_html
  rescue
    raise Sinatra::NotFound
  end
  haml :default
end

get '/' do
  redirect '/index', 301
end

get '/style.css' do
  headers 'Content-type' => 'text/css; charset=utf-8'
  sass :stylesheet
end

get '/:page' do
  page params[:page]
end

not_found do
  page '404'
end
