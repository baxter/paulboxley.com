require 'rubygems'
require 'sinatra'
require 'haml'
# require 'maruku'

set :haml, {:format => :html5 }

get '/*' do
  @title = "Welcome"
  #@content = Maruku.new("
  #Welcome
  #-------
  #Welcome to PaulBoxley.com
  #").to_html
  @content = "<h2>Welcome</h2><p>Welcome to PaulBoxley.com</p>"
  haml :index
end