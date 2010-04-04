require 'app/models/file_model'

class Post < FileModel  
  def file_location(name,year="**",month="**")
    File.join("content","posts","%s","%s","%s.md") % [year,month,name]
  end
end