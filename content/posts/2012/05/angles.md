Title:  Angles – the bother with boids
Posted: 2012-05-15 15:13Z
Cols:   2

<script src="http://static.paulboxley.com/boids/vendor/underscore-min.js"></script>
<script src="http://static.paulboxley.com/boids/lib/boids_2d_angle_bug.js"></script>

I discovered a bug in [my previous Boids post][boids]. To rotate a boid I was doing this:

    If current direction angle < target direction angle
      Increase current direction angle
    If current direction angle > target direction angle
      Decrease current direction angle

Which seemed reasonable enough, but I hadn't considered the way that angles are calculated.

In javascript all angles use [radians][]. You may remember that there are 2π radians in a circle. Within HTML5's &lt;canvas&gt;, radians have the following meanings:

* 0 radians means you are pointing East
* ½π radians means you are pointing South
* -½π radians means you are pointing North
* π or -π radians means you are pointing West

![Examples of all the angles](http://static.paulboxley.com/angles.png)

(Radians weren't the problem here, I would have had the same problem if javascript had used degrees)

The problem that I was seeing was that sometimes a boid would be travelling South West and its target would be North West of it, but rather than turning clockwise it would turn anti-clockwise.

Here is a boid being told to rotate to and from a direction in the South West and a direction in the North West, because an example is often more helpful than an explanation:

<canvas id="boids_2d_angle_bug" width="530" height="230"></canvas>
<p id="boids_2d_angle_bug_text_box" style="font-size: 3em; line-height: 1em; margin-top: -2.25em; margin-right: 2.25em; text-align: right"></p>
<script>$(document).ready(function() { angle_bug = new AngleBug(document.getElementById('boids_2d_angle_bug'), document.getElementById('boids_2d_angle_bug_text_box')); angle_bug.start() })</script>

As you can see, this boid is taking the long way around.

### What's going on?

The boid stores its direction as a number which reflects the angle in radians that it should be facing. If it starts at +3.0 radians and we instruct it to move towards -3.0 radians then it will follow its simple instructions:

    If +3.0 > -3.0
      Decrease current direction angle

+3.0 is greater than -3.0, so the boid decreases its current direction angle, moving from +3.0 to +2.9 to +2.8 to +2.7, which turns it anti-clockwise, going through the zero point and sending it the long way around.

What we'd expect to see is the boid taking the short route between the two points, through π (remember +π and -π mean the same thing in this situation).

### Why is this a problem?

As far as bugs go this isn't the end of the world, but it results in some undesirable behaviour.

If there are two boids, A and B, with directions of +3 and -3 respectively, when they come close to each other we would expect them to match directions, averaging to +π/-π (remember that +π and -π mean the same thing). What will actually happen is that the two boids will change direction away from each other, trying to average at 0, which is almost the opposite to the direction they're currently travelling in.

In a more general sense it makes it far less likely that a flock of boids will end up moving in a Westward direction.

### How do we fix this problem?

We need to treat the direction more intelligently. Rather than just treating it as a number we have to recognise that it's an angle and that +3.0 is actually closer to -3.0 than it is to 0.

In order to find the difference between one angle and another we can say:

    difference angle = end angle - start angle

But this only works if the two angles are either both North of 0 or both South of 0. If the two numbers are on opposite sides, say +2.0 and -2.0, then the result would be beyond either π or -π, in this case -4.0.

We can easily fix this though: we know that a circle has 2π radians, and that in HTML 5 canvas the semi-circle from East to South to West goes from 0 to +π, and the semi-circle from East to North to West goes from 0 to -π, so once we go beyond either π or -π we can just subtract or add 2π to that number to get a more reasonable number.

    difference angle = end angle - start angle
    if difference angle > π
      difference angle = difference angle - 2π
    if difference angle < -π
      difference angle = difference angle + 2π

Now the result of passing in +2.0 and -2.0 will return around 2.28

    Find difference between current direction and target direction
    If the difference < 0
      Increase the current direction
    If the difference > 0
      Decrease the current direction

Replacing this part of the code leads to the following behaviour:

<canvas id="boids_2d_angle_fix" width="530" height="230"></canvas>
<p id="boids_2d_angle_fix_text_box" style="font-size: 3em; line-height: 1em; margin-top: -2.25em; margin-right: 2.25em; text-align: right"></p>
<script>$(document).ready(function() { angle_fix = new AngleBug(document.getElementById('boids_2d_angle_fix'), document.getElementById('boids_2d_angle_fix_text_box'), { "new_algorithm": true }); angle_fix.start() })</script>

Which looks much better. Problem solved!

  [boids]: http://paulboxley.com/blog/2012/05/boids
  [radians]: http://en.wikipedia.org/wiki/Radian