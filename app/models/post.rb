require 'app/models/file_model'

class Post < FileModel
  
  class << self
    def list(options={})
      Dir.glob(self.file_location(options)).collect do |post|
        Post.new(:path => post)
      end
    end
    
    def file_location(options={})
      File.join("content","posts","%s","%s","%s.md") % [options[:year] || "**",options[:month] || "**",options[:name] || "*"]
    end
  end
  
  def title
    if metadata('title').nil?
      @name
    else
      metadata 'title'
    end
  end
  
  def url
    "/blog/#{self.year}/#{self.month}/#{self.name}"
  end
  
  def posted
    Time.parse(metadata 'posted')
  end
  
  def modified
    if metadata('modified').nil?
      posted
    else
      Time.parse(metadata 'modified')
    end
  end
  
  def year
    posted.year
  end
  
  def month
    posted.strftime("%m")
  end
  
  def <=>(o)
    self.posted <=> o.posted
  end
end