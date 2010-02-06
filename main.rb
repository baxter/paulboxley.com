require 'rubygems'
require 'sinatra'
require 'haml'
require 'bluecloth'

set :haml, { :format => :html5 }
set :sass, { :style  => :expanded }

before do
  response.headers['Cache-Control'] = 'public, max-age=31557600'
end

def page ( page_name )
  begin
    @content = BlueCloth.new(File.read("pages/#{page_name}.md")).to_html
  rescue
    raise Sinatra::NotFound
  end
  @title = page_name
  haml :default
end

get '/' do
  page("index")
end

get '/style.css' do
  header 'Content-type' => 'text/css; charset=utf-8'
  sass :stylesheet
end

get '/:page' do
  page(params[:page])
end

not_found do
  page("404")
end
