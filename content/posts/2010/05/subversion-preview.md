Title: Introversion release preview footage of route planning in their new game
Posted: 2010-05-05 07:18Z  
URL: http://forums.introversion.co.uk/introversion/viewtopic.php?t=2391  

*Subversion* uses blueprint-like graphics to simulate a 
world in which you play a team trying to infiltrate 
buildings.

This is the first footage that they've released and 
accompanies a post where developer Chris discusses how he 
decided on a pathfinding algorithm:

> Writing a system wrongly is often the best way to learn 
> how to do it right.
>   
> Path finding has been a great example of this. I've 
> written two pathfinding systems in my life : one for the 
> static world map of Defcon, and another for the numerous 
> maps in Multiwinia. Both games used a pretty crude 
> method which I was never entirely happy with, solving 
> route-planning the same way the internet routes messages 
> between distant routers, and for Subversion I knew i'd 
> have to solve it properly.
>
> ...
>
> The world is rasterized onto a 2d grid. Walls produce 
> solid grid cells that cannot be walked through. 
> Navigation uses A* across the grid. It does use a lot of 
> memory and there's a practical limit on how large the 
> world can be, but it's perfect for Subversion. It can 
> support dynamic scenery such as using shape-charge 
> explosives to blow a hole in a wall (you simply change 
> the relevant cells in the 2d grid), and it can support 
> dynamic obstacles by simply rasterising them onto the 
> same grid. Best of all, producing the 2d grid is 
> extremely fast and error tolerant - I basically don't 
> need to worry about navigation again. 

There's more detail in there about optimisations they've 
used which help you appreciate what's happening in the 
video.
