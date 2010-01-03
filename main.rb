require 'rubygems'
require 'sinatra'
require 'haml'

set :haml, {:format => :html5 }

get '/*' do
  @title = "Index"
  @content = "Welcome!"
  haml :index
end