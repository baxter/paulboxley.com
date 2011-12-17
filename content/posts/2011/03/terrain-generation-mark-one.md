Title: Terrain generation with the diamond square algorithm
Posted: 2011-03-26 16:13Z

Lately I've been playing with the [diamond square algorithm][diamond-square], a fractal algorithm that's pretty good at generating realistic looking terrain.

I started in Ruby initially but, inspired by [Jamis Buck's excellent maze algorithm visualisations][mazes], I decided to rewrite my work in CoffeeScript. It's still a work in progress but I figured I'd show what I had so far.

The diamond square algorithm works on a 2D array that's 2<sup>n</sup>+1 square, and needs the four corner points of the array to have a value set before it starts. All the other points in the grid have no value, but in the visualisation below I've displayed the points as though they were set to zero.

I've also drawn polygons between the points to make the visualisation look a bit clearer.

<script src="http://static.paulboxley.com/terrain-1/generate_terrain.js"></script>
<script src="http://static.paulboxley.com/terrain-1/draw_terrain.js"></script>
<script>$(document).ready(function(){
  initialise();
  draw();
})</script>

<p style="text-align: center; font-size: 1.25em;">
  <canvas id="terrain" width="530" height="430"></canvas>
  <a href="#" onclick="draw_step(); return false;">Step</a> &mdash;
  <a href="#" onclick="draw_run(); return false;">Run</a> &mdash;
  <a href="#" onclick="draw_reset(); return false;">Reset</a>
</p>

The first thing that the algorithm does is set the centre point by averaging the four corner values and adding or subtracting a random amount of noise. This is the 'diamond' step.

The next thing that the algorithm does is set the four mid points between the corners, i.e. North, South, East and West, by averaging the two values on either side of the point in question and adding or subtracting a slightly smaller random amount of noise. This is the 'square' step.

Clicking 'step' above will go through one diamond and one square step.

After these two steps are complete there will be nine points with values set; the four corner points, the centre point, and the four midpoints between each corner point. This means that we can split the starting array into four smaller arrays and call the algorithm again four times, this time reducing the magnitude of the noise applied.

The process continues on until there are no empty points left in the grid.

The whole process runs extremely quickly, even in the browser, so I've added a delay between each step when the 'run' link is clicked.

As I said before, it's a work in progress, so if you encounter any bugs or think I should try something different then send me an email at paul [at] paulboxley.com or send a tweet to [@baxt3r][].

***Update: See [my next post][next] for links to the source code.***

  [diamond-square]: http://en.wikipedia.org/wiki/Diamond-square_algorithm
  [mazes]: http://www.jamisbuck.org/mazes/
  [@baxt3r]: https://twitter.com/baxt3r
  [next]: /blog/2011/03/terrain-generation-source