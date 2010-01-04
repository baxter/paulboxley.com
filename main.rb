require 'rubygems'
require 'sinatra'
require 'haml'

set :haml, {:format => :html5 }

get '/*' do
  @title = "Welcome"
  @content = "<h2>Welcome</h2><p>Welcome to PaulBoxley.com</p>"
  haml :index
end