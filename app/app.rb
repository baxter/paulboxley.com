require 'sinatra'
require 'haml'
require 'sass'
require 'bluecloth'
require 'app/routes'

set :haml, { :format => :html5 }
set :sass, { :style  => :expanded }

set :public, Proc.new { File.join("content", "static") }

before do
  headers 'Cache-Control' => 'public, max-age=31557600'
end

def page ( page_name )
  @page_name = page_name
  begin
    @content = BlueCloth.new(File.read("content/pages/#{page_name}.md")).to_html
  rescue
    raise Sinatra::NotFound
  end
  haml :default
end
