require 'sinatra/base'
require 'bluecloth'

class FileModel
  def initialize(options={})
    if options[:path]
      options[:name] = %r{([a-z0-9\-]+).md}.match(options[:path])[1]
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
  
  def name
    @name
  end
  
  def metadata(key)
    @metadata[key]
  end
  
  def html
    BlueCloth.new(@content).to_html
  end

  def file_location(options={})
    self.class.file_location(options)
  end
end