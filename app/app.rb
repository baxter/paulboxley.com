require 'sinatra'
require 'haml'
require 'sass'
require 'builder'
require 'bluecloth'
require_relative 'models/page'
require_relative 'models/post'
require_relative 'routes'

set :haml, { :format => :html5 }

set :public, Proc.new { File.join("content", "static") }

configure do
  if ENV['RACK_ENV'] == 'development' then
    Site = {
      :title => 'Paul Boxley - DEV',
      :base_url => 'http://localhost:9393/',
    }
    set :sass, { :style  => :expanded }
  else
    Site = {
      :title => 'Paul Boxley',
      :base_url => 'http://paulboxley.com/',
    }
    set :sass, { :style  => :compressed }
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
  if page.metadata('redirect')
    redirect page.metadata('redirect'), 302
  else
    @title = page.title
    @content = page.html
    @content_type = :page
    haml :default
  end
end

def blog ( options={} )
  @period = case
    when options[:name]  then :single
    when options[:month] then :month
    when options[:year]  then :year
    else :all
  end
  puts "Period: #{@period}"
  @content_type = :blog
  options[:page_size] ||= 10
  options[:page_number] ||= 1
  @current_page = options[:page_number] # The view needs this to build page nav links
  last_post  = @current_page * options[:page_size]
  first_post = last_post - options[:page_size]
  # Limiting posts -after- the array has been built is inefficient
  # but its impact seems to be negligible for now.
  # Should be cached with varnish anyway.
  all_posts = Post.list(options).sort { |a,b| b <=> a }
  @posts = all_posts[first_post...last_post]
  @total_pages = (all_posts.length.to_f / options[:page_size].to_f).ceil
  if @posts.nil? or @posts.size == 0 then
    not_found
  end
  if @posts.size == 1 then
    @title = @posts[0].title
  end
  haml :blog
end
