require 'sinatra/base'
require 'bluecloth'

class FileModel
  def initialize(name)
    @name = name
    @metadata = {}
    f = File.open(file_location name)    
    
    metadata_string, @content = f.read.split(/\r?\n\r?\n/, 2)
    
    metadata_string.split("\n").select { |x| x =~ /^--/ }.each do |line|
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
  
  def file_location
    nil
  end
end