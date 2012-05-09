Title:  Boids
Posted: 2012-05-07 20:06Z
Cols:   3

I've always been fascinated by emergent behaviour, there's something cool about simple rules resulting in a complex outcome. I think that [Boids][] is a really good way of demonstrating emergent behaviour.

> Boids is an artificial life program, developed by Craig Reynolds in 1986, which simulates the flocking behaviour of birds.

I decided to put together a 2D version of Boids using HTML5 canvas. Click the "Start" link below to see them start moving.

<p style="text-align: center; font-size: 1.25em;">
  <canvas id="boids" width="830" height="430"></canvas>
  <script src="http://static.paulboxley.com/boids/vendor/underscore-min.js"></script>
  <script src="http://static.paulboxley.com/boids/lib/boids_2d_v1.js"></script>
  <script>$(document).ready(function() { boids_2d_v1.init(); })</script>
  <a href="javascript:void(0)" onclick="boids_2d_v1.start(); return false;">Start</a> &mdash;
  <a href="javascript:void(0)" onclick="boids_2d_v1.stop(); return false;">Stop</a> &mdash;
  <a href="javascript:void(0)" onclick="boids_2d_v1.stop(); boids_2d_v1.reset(); boids_2d_v1.init(); return false;">Reset</a>
</p>

<div style="display: none">
  <p>
    <input id="boids_match_direction" type="checkbox" checked="yes" onclick="boids_2d_v1.toggle('boids_match_direction')">
    <label for="boids_match_direction">Boids like travelling in the same direction as their neighbours</label>
  </p>
  <p>
    <input id="boids_keep_distance" type="checkbox" checked="yes" onclick="boids_2d_v1.toggle('boids_keep_distance')">
    <label for="boids_keep_distance">Boids dislike being too close to each other</label>
  </p>
  <p>
    <input id="boids_move_toward_centre" type="checkbox" checked="yes" onclick="boids_2d_v1.toggle('boids_move_toward_centre')">
    <label for="boids_move_toward_centre">Boids like to move toward the centre of the flock</label>
  </p>
  <p>
    <input id="draw_between_nearby" type="checkbox" onclick="boids_2d_v1.toggle('draw_between_nearby')">
    <label for="draw_between_nearby">Draw lines between nearby boids</label>
  </p>
</div>

The boids above follow three very simple rules (that you can switch on and off):

1. <input id="boids_match_direction" type="checkbox" checked="yes" onclick="boids_2d_v1.toggle('boids_match_direction')"> <label for="boids_match_direction">Boids like to travel in the same direction as their neighbours.</label>
2. <input id="boids_keep_distance" type="checkbox" checked="yes" onclick="boids_2d_v1.toggle('boids_keep_distance')"> <label for="boids_keep_distance">Boids dislike being too close to each other</label>
3. <input id="boids_move_toward_centre" type="checkbox" checked="yes" onclick="boids_2d_v1.toggle('boids_move_toward_centre')"> <label for="boids_move_toward_centre">Boids like to move toward the centre of the flock</label>

<input id="draw_between_nearby" type="checkbox" onclick="boids_2d_v1.toggle('draw_between_nearby')"> <label for="draw_between_nearby">Draw lines between neighbours</label> (This isn't a rule, it just helps visualise who's a neighbour!)

### What's going on here

I start by creating 30 boids, each with a random starting position and direction.

On each frame, each boid investigates its neighbours and figures out the average directions of those that are reasonably close (within 100px) and those that are *too* close (within 30px).

If the first rule is enabled then the boid will rotate itself slightly *towards* the average direction of the reasonably close boids.

If the second rule is enabled then it will rotate itself slightly *away* from the average direction of the very close boids.

If the third rule is enabled then it will also survey all the boids on the canvas, figure out where the highest population of boids is and rotate slightly in that direction. This is useful for the boids that occasionally disappear off on their own and would otherwise fly off in a straight line forever (which isn't a huge problem in this example, since boids reaching the edge will wrap around to the opposite edge).

It's quite fun disabling the 2nd rule, watching the boids squish up close to each other, and then enabling it again to see them all fly away from each other.

### Source code

The source code is available on [my github page][github]. It's written in coffeescript and is hopefully fairly self explanatory. I tried making some docco docs but that didn't go very well. Hopefully I'll get them up soon.

Let me know if you have any questions or suggestions [@baxt3r][]

  [boids]: http://en.wikipedia.org/wiki/Boids
  [github]: https://github.com/baxter/2D-Boids/blob/master/src/boids_2d_v1.coffee
  [@baxt3r]: http://twitter.com/baxt3r