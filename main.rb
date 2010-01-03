require 'rubygems'
require 'sinatra'
require 'haml'
require 'maruku'

set :haml, {:format => :html5 }

get '/*' do
  @title = "Welcome"
  @content = Maruku.new("
  Welcome
  -------
  Welcome to PaulBoxley.com
  ").to_html
  haml :index
end