Title: Building strings in Ruby
Posted: 2010-12-05 17:04Z

The standard way of building strings in Ruby is to use the spade operator (`<<`) to modify an existing string by appending other strings to the end of it.

In some situations, though, I prefer a different method of building strings.

Let's say we want to build a URI that will carry out an advanced search on Wikipedia. The ingredients that we have are the *hostname*, the *base URI* and the *parameters for the [query string][qs]*.

    host     = "en.wikipedia.org"
    base_uri = "/w/index.php"
    parameters   = {
      "title"    => "Special:Search",
      "redirs"   => "1",
      "search"   => "Ruby",
      "ns0"      => "1",
      "advanced" => "1",
      "fulltext" => "Advanced+search",
    }
    
How do we go about building the query string itself?

One way would be to iterate through each of the elements in our `parameters` hash and append each one to a string, separating the key and the value with an '`=`' character and separating each pair with an ampersand.

Let's write a `querystring` method to do that:

    def querystring(p)
      query_string = ""

      p.each do |key, value|
        query_string << "#{key}=#{value}&"
      end

      query_string
    end

That gives the following output:

    querystring(parameters)
    # => "ns0=1&title=Special:Search&redirs=1&advanced=1&fulltext=Advanced+search&search=Ruby&"

There are a few problems with this code though.

* We have to initialise an empty string.
* We have to mention the string at the end of the method, since without it `params` would be returned.
* We get a trailing ampersand in our query string.

We could work around that last problem, but that would make this method more complex. Let's think of a more elegant way of building the string.

`Enumerable`'s [`collect`][collect] method accepts a block as a parameter and then goes through every element, running that block against each element, then returning a new `Array`. We can make use of `collect` to turn our `params` `Hash` into an `Array` where each element looks like `"key=value"`.

    parameters.collect do |key, value|
      "#{key}=#{value}"
    end
    # => ["ns0=1", "title=Special:Search", "redirs=1", "advanced=1", "fulltext=Advanced+search", "search=Ruby"]

Now that we've got an `Array` that looks like this we can make use of `Array`'s [`join`][join] method to create a string containing each element in the `Array` separated by an ampersand:
    
    parameters.collect do |key, value|
      "#{key}=#{value}"
    end.join "&"
    # => "ns0=1&title=Special:Search&redirs=1&advanced=1&fulltext=Advanced+search&search=Ruby"

We can change our `querystring` method to make use of this technique:

    def querystring(p)
      p.collect do |key, value|
        "#{key}=#{value}"
      end.join "&"
    end

    querystring(parameters)
    # => "ns0=1&title=Special:Search&redirs=1&advanced=1&fulltext=Advanced+search&search=Ruby"

Now we've addressed all the problems raised before:

* There's no need to initialise an empty string
* We don't have to force the string to be returned since `Array#join` returns the string we want.
* We lose that trailing ampersand without having to add any conditions to our code.

  [qs]: http://en.wikipedia.org/wiki/Query_string
  [collect]: http://ruby-doc.org/core/classes/Enumerable.html#M003127
  [join]: http://ruby-doc.org/core/classes/Array.html#M002182