Title: Upgrading to 1.9.2 &mdash; Invalid byte sequence in US-ASCII
Posted: 2011-03-13 11:30Z

The site was down for about a short while today while I migrated to the Bamboo stack on Heroku which runs Ruby 1.9.2.

Testing locally using rvm showed that a few changes would be necessary to my code in order to get it to work.

The biggest problem that I ran into was that the default method of opening files in Ruby is now US-ASCII, meaning any multibyte UTF characters in a file will cause ruby to throw errors by default.

Initially I figured that doing a find and replace on certain commonly used non-ASCII characters would be enough. For example, I tend to liberally use em dashes (&mdash;) so I replaced all instances of em dashes in my markdown files with the HTML escaped version.

While this was enough to satisfy ruby on my local machine, trying it on Heroku caused `ArgumentError - invalid byte sequence in US-ASCII` in the part of my model that loads and parses files.

I tried to track down which characters were causing this error and found

 * &mdash; (&amp;mdash;)
 * &rsquo; (&amp;rsquo;)
 * &reg; (&amp;reg;)
 * &pound; (&amp;pound;)

Upon reaching the pound sign I decided that a far more sensible approach would be to instruct ruby to always load files in UTF-8 format, so I changed this line:

    f = File.open(matches.first)

to this

    f = File.open(matches.first, "r:UTF-8")

which solved the problem.