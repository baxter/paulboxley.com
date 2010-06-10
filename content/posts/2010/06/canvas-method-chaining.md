Title: Method chaining in HTML5 Canvas
Posted: 2010-06-10 09:56Z

I've started playing with the new HTML5 canvas element. Here is an example from Mozilla's [canvas tutorial][moz]:

    var canvas = document.getElementById("c");
    var context = canvas.getContext("2d");
    // Draw a circle
    context.beginPath();
    context.arc(75,75,50,0,Math.PI*2,true);
    context.stroke();

The first thing that springs to mind is that this code could be improved with method chaining:

    var canvas = document.getElementById("c");
    var context = canvas.getContext("2d");
    // Draw a circle
    context.beginPath().arc(75,75,50,0,Math.PI*2,true).stroke();

As great as this would be, `beginPath` and `arc` don't return `context`. It would probably be *possible* to alter how `context`'s methods work, but I think a better alternative is to create some sort of wrapper, a bit like jQuery does. I envisage something like:

    var context_wrapper(document.getElementById("c"));
    context_wrapper.circle(75,75,50).stroke();

Even this could be improved, but it is elegant enough for me to tolerate.
    
  [moz]: https://developer.mozilla.org/en/Canvas_tutorial/Drawing_shapes