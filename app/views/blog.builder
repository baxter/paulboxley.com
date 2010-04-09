xml.instruct! :xml, :version => '1.1', :encoding => 'utf-8'
xml.feed(:xmlns => 'http://www.w3.org/2005/Atom') {
  xml.head {
    xml.title("PaulBoxley.com", :type => 'text')
  }
  xml.updated("UPDATED")
  xml.id("ID")
  xml.link(
    :rel => 'alternate', 
    :type => 'text/html', 
    :hreflang => 'en',
    :href => 'http://paulboxley.com/blog'
  )
  xml.link(
    :rel => 'self', 
    :type => 'application/atom+xml',
    :href => 'http://paulboxley.com/blog/feed.atom'
  )
  @posts.each do |post|
    xml.entry {
      xml.title(post.title)
      xml.link(:rel => 'alternate', :type => 'text/html', :href => post.url)
      xml.id(post.permalink)
      xml.published(
        post.posted.strftime("%Y-%m-%dT%H:%M:%SZ")
      )
    }
  end
}