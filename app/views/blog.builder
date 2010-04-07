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
  xml.entry {
    xml.comment! "HI"
    xml.h1("Header")
    xml.p("paragraph")
  }
}