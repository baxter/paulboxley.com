require 'app/models/file_model'

class Page < FileModel  
  def file_location(options={})
    File.join("content","pages","%s.md") % options[:name]
  end
end