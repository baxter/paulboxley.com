require 'app/models/file_model'

class Page < FileModel  
  def file_location(name)
    File.join("content","pages","%s.md") % name
  end
end