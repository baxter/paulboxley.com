require 'sinatra/base'
require 'bluecloth'


class FileModel
  def initialize(options={})
    
    # If one of the options is the path to the file then we can determine 
    # the name
    if options[:path]
      options[:name] ||= %r{([a-z0-9\-_]+).md}.match(options[:path])[1]
    end
    
    @name = options[:name]
    @metadata = {}
    
    matches = Dir.glob(self.file_location(options))
    if matches.empty?
      raise Sinatra::NotFound
    end
    f = File.open(matches.first)
    
    metadata_string, @content = f.read.split(/\r?\n\r?\n/, 2)
    
    # Turn each line that looks like this:
    #   Key: Value
    # into an entry in a hash called @metadata.
    # Exclude any lines that start with a double slash.
    metadata_string.split("\n").reject { |x| x =~ %r{^//.*} }.each do |line|
      key, value = line.split(/\s*:\s*/, 2)
      @metadata[key.downcase] = value
    end
  end
  
  def validate(options={})
    true
  end
  
  def name
    @name
  end
  
  def title
    if metadata('title').nil?
      name
    else
      metadata 'title'
    end
  end
  
  def metadata(key)
    @metadata[key]
  end
  
  def html
    BlueCloth.new(@content).to_html
  end

  # The location of this resource on the filesystem.
  # Subclasses of FileModel should implement a class method called
  # file_location. 
  def file_location(options={})
    self.class.file_location(options)
  end
end