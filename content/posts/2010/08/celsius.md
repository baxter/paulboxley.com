Title: Celsius
Posted: 2010-08-26 07:22Z

There is a well known rounding error in Google search's built-in calculator, so that

> [1000000000000000 - 1000000000000001 = 0][goog-rounding]

So I wasn't too surprised when [I read that Google produced the following result][hn1]:

> [0 degrees Celsius + 0 degrees Celsius = 273.15 degrees Celsius][goog-0celsius]

Except this isn't a mistake.

"Degrees Celsius" measures an absolute temperature, and that absolute temperature is 273.15 kelvin, or 273.15 Celsius degrees warmer than absolute zero.

> [0 degrees Celsius = 273.15 kelvin][goog-celsiusink]

Which means that if you rewrite the first calculation using kelvin it looks like:

> [(273.15 kelvin) + (273.15 kelvin) = 273.15 degrees Celsius][goog-kelvin]

  [goog-rounding]: https://encrypted.google.com/search?q=1000000000000000+-+1000000000000001
  [goog-0celsius]: https://encrypted.google.com/search?q=0+degrees+Celsius+%2B+0+degrees+Celsius
  [goog-celsiusink]: https://encrypted.google.com/search?q=0+degrees+Celsius+in+kelvin
  [goog-kelvin]: https://encrypted.google.com/search?q=273.15+kelvin+%2B+273.15+kelvin
  [hn1]: http://news.ycombinator.com/item?id=1610354