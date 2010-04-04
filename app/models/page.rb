require 'sinatra/base'
require 'bluecloth'

class Page
  def initialize(name)
    @name = name
    begin
      @content = File.read(File.join("content","pages","#{page_name}.md"))
    rescue
      raise Sinatra::NotFound
    end
  end
  
  def html
    BlueCloth.new(@content).to_html
  end
end