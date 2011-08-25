xml.instruct! :xml, :version => '1.0', :encoding => 'utf-8'
xml.feed(:xmlns => 'http://www.w3.org/2005/Atom') {
  xml.title("PaulBoxley.com", :type => 'text')
  xml.updated(@updated)
  xml.id(Site[:base_url] + 'blog/feed.atom')
  xml.link(
    :rel => 'alternate', 
    :type => 'text/html', 
    :hreflang => 'en',
    :href => Site[:base_url] + 'blog'
  )
  xml.link(
    :rel => 'self', 
    :type => 'application/atom+xml',
    :href => Site[:base_url] + 'blog/feed.atom'
  )
  @posts.each do |post|
    xml.entry {
      xml.title(post.feed_title)
      xml.link(:rel => 'alternate', :type => 'text/html', :href => post.url)
      xml.id(post.permalink)
      xml.published(
        post.posted.strftime("%Y-%m-%dT%H:%M:%SZ")
      )
      xml.updated(
        post.modified.strftime("%Y-%m-%dT%H:%M:%SZ")
      )
      xml.author {
        xml.name("Paul Boxley")
        xml.uri(Site[:base_url])
      }
      xml.content(:type => 'html', "xml:lang" => 'en', "xml:base" => Site[:base_url]) {
        xml.cdata!(post.sanitized_html)
      }
    }
  end
}