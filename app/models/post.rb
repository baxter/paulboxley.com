require_relative 'file_model'
require 'cgi'

class Post < FileModel
  
  class << self
    def list(options={})
      Dir.glob(self.file_location(options)).collect do |post|
        Post.new(:path => post)
      end.reject { |post| post.posted > Time.now.utc }
    end
    
    def file_location(options={})
      File.join("content","posts","%s","%s","%s.md") % 
      [
        options[:year]  || "**",
        options[:month] || "**",
        options[:name]  || "*"
      ]
    end
  end
  
  def external?
    if url == permalink
      false
    else
      true
    end
  end
  
  def internal?
    !external?
  end
  
  def domain
    return nil if internal?
    domain_part = %r{http[s]*://[w\.]*([^:/]+)}
    begin
      "[#{domain_part.match(url)[1]}]"
    rescue
      ""
    end
  end
  
  def feed_title
    if internal?
      title
    else
      "#{title} #{domain}"
    end
  end
  
  def url
    if metadata('url')
      metadata('url').strip
    else
      permalink
    end
  end
  
  def permalink
    Site[:base_url].gsub(/\/$/,'') + "/blog/#{self.year}/#{self.month}/#{self.name}"
  end
  
  def tweet
    params = {
      'url'     => permalink,
      'text'    => title,
      'related' => 'baxt3r'
    }.collect { 
      |k,v| CGI.escape(k) + '=' + CGI.escape(v)
    }.join '&'
    'http://twitter.com/share?' + params
  end
  
  def posted
    if metadata('posted').nil?
      nil
    else
      Time.parse(metadata 'posted')
    end
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