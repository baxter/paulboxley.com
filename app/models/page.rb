require File.dirname(__FILE__) + '/file_model'

class Page < FileModel
  class << self  
    def file_location(options={})
      File.join("content","pages","%s.md") % options[:name]
    end
  end
end