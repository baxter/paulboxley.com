Title:  Placekitten — Placeholder images of kittens
Posted: 2011-03-01 14:03Z
URL:    http://placekitten.com/
Cols:   3

![A cute kitten](http://placekitten.com/g/180/230)![Another cute kitten](http://placekitten.com/450/230)![A final cute kitten](http://placekitten.com/g/200/230)

In the spirit of [placehold.it][ph.it], [Mark James][mj] has created placekitten, a service that provides pictures of kittens that you can use as placeholder images when designing websites.

But that's not the only use for this service. [Lee Semel][lsemel] has created a jQuery plugin, [jquery-placekitten][jqp] to replace all images on the current page with images from placekitten, and Hacker News user [sisk][] created this [bookmarklet][bm] that you can paste into your URL bar and will replace all images on the current page.

    javascript:(function(){var a=document.getElementsByTagName('img'),i=a.length;while(b=a[--i]){b.setAttribute('src','http://placekitten.com/'+b.width+'/'+b.height);}})();

I love you, Internets.

  [ph.it]: http://placehold.it
  [mj]: http://mark.james.name
  [jqp]: https://github.com/lsemel/jquery-placekitten
  [lsemel]: http://leesemel.com/
  [sisk]: http://news.ycombinator.com/user?id=sisk
  [bm]: http://news.ycombinator.com/item?id=2274265