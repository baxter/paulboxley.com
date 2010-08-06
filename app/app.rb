require 'sinatra'
require 'haml'
require 'sass'
require 'builder'
require 'bluecloth'
require 'app/models/page'
require 'app/models/post'
require 'app/routes'

set :haml, { :format => :html5 }
set :sass, { :style  => :expanded }

set :public, Proc.new { File.join("content", "static") }

configure do
  if ENV['RACK_ENV'] == 'development' then
    Site = {
      :title => 'Paul Boxley – DEV',
      :base_url => 'http://localhost:9393/',
    }
  else
    Site = {
      :title => 'Paul Boxley',
      :base_url => 'http://paulboxley.com/',
    }
  end
end

before do
  headers 'Cache-Control' => 'public, max-age=3600'
end

def feed ( type )
  if type != :atom
    raise Sinatra::NotFound
  end
  headers 'Content-type' => 'application/atom+xml'
  @posts = Post.list.sort { |a,b| b <=> a }
  @updated = @posts[0].posted.strftime("%Y-%m-%dT%H:%M:%SZ")
  builder :blog
end

def page ( page_name )
  page = Page.new(:name => page_name)
  @title = page.title
  @content = page.html
  haml :default
end

def blog ( options={} )
  options[:limit] ||= 100
  # Limiting posts -after- the array has been built is inefficient
  # but its impact seems to be negligible for now.
  @posts = Post.list(options).sort { |a,b| b <=> a }[0...options[:limit]]
  if @posts.size == 1 then
    @title = @posts[0].title
  end
  haml :blog
end
