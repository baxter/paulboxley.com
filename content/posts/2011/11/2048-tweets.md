Title: 2,048 Tweets
Posted: 2011-11-05 23:54Z

<script type="text/javascript">
  $(document).ready(function () {
    var scotrugPeople = [
      '@alancfrancis',
      '@nelstrom',
      '@scotrubyconf',
      '@paulanthonywils',
      '@philip_roberts',
      '@ryanstenhouse',
      '@scotrug',
      '@lenary',
      '@keavy',
      '@dies_el',
      '@semanticist',
      '@mconnell'
    ];
    
    var aswPeople = [
      '@mungler',
      '@mr_urf',
      '@tanjapislar'
    ];
    
    var gwwPeople = [
      '@stylva',
      '@poke',
      '@bexor'
    ]
    
    var alternateColors = function(index) { 
      return ['#AC9784', '#9e8972'][index % 2] 
    };
    
    var colorCoded = function(index) {
      if ($.inArray(this[1].label, scotrugPeople) >= 0) {
        return '#986359';
      }
      if ($.inArray(this[1].label, aswPeople) >= 0) {
        return '#6a6e7a';
      }
      if ($.inArray(this[1].label, gwwPeople) >= 0) {
        return '#5e8247';
      }
      return '#AC9784';
    }
    
    var standardAxisLabel = function(index) { return this[1].label };
    
    jQuery('#emoticon-graph').tufteBar({
      data: [
        [1, {label: ';D'}],
        [1, {label: 'D:'}],
        [2, {label: ':o'}],
        [2, {label: ':/'}],
        [6, {label: ':P'}],
        [7, {label: ';)'}],
        [7, {label: ':('}],
        [36, {label: ':D'}],
        [60, {label: ':)'}]
      ],
      axisLabel: function(index) { return "<span style=\"font-size: 2em; padding-top: 1em;\">" + this[1].label + "</span>" },
      colors: ['#AC9784']
    });
    
    jQuery('#retweet-graph').tufteBar({
      data: [
        [3, {label: '@alancfrancis'}],
        [3, {label: '@tanepiper'}],
        [3, {label: '@notch'}],
        [3, {label: '@nelstrom'}],
        [3, {label: '@edgeonline'}],
        [3, {label: '@RupertMurdochPR'}],
        [3, {label: '@poke'}],
        [3, {label: '@Cabel'}],
        [3, {label: '@newsyc150'}],
        [4, {label: '@scotrubyconf'}],
        [4, {label: '@paulanthonywils'}],
        [5, {label: '@philip_roberts'}],
        [5, {label: '@ryanstenhouse'}],
        [5, {label: '@mr_urf'}],
        [5, {label: '@Daily_Madness'}],
        [7, {label: '@mungler'}],
        [8, {label: '@dies_el'}],
        [9, {label: '@saveourforests'}]
      ],
      axisLabel: standardAxisLabel,
      color: colorCoded
    });
    
    jQuery('#retweet-distribution-graph').tufteBar({
      data: [
        [128, {label: '1'}],
        [20, {label: '2-3'}],
        [9, {label: '4+'}]
      ],
      axisLabel: function(index) { 
        var times;
        if (this[1].label === '1') {
          times = 'once';
        } else {
          times = this[1].label + ' times';
        }
        return 'Retweeted ' + times;
      },
      barLabel: function(index) { return $.tufteBar.formatNumber(this[0]) + " users" },
      colors: ['#AC9784']
    });
    
    jQuery('#mention-graph').tufteBar({
      data: [
        [13, {label: '@philip_roberts'}],
        [14, {label: '@nelstrom'}],
        [15, {label: '@paulanthonywils'}],
        [16, {label: '@scotrug'}],
        [16, {label: '@bexor'}],
        [17, {label: '@lenary'}],
        [20, {label: '@keavy'}],
        [21, {label: '@Daily_Madness'}],
        [21, {label: '@stylva'}],
        [28, {label: '@poke'}],
        [28, {label: '@dies_el'}],
        [30, {label: '@alancfrancis'}],
        [35, {label: '@mikos'}],
        [35, {label: '@ryanstenhouse'}],
        [41, {label: '@semanticist'}],
        [41, {label: '@mconnell'}],
        [44, {label: '@mr_urf'}],
        [45, {label: '@mungler'}]
      ],
      axisLabel: standardAxisLabel,
      color: colorCoded
    });
    
    jQuery('#word-graph').tufteBar({
      data: [
        [100, {label: 'in'}],
        [100, {label: 'that'}],
        [109, {label: 'of'}],
        [117, {label: 'is'}],
        [135, {label: 'you'}],
        [139, {label: 'it'}],
        [200, {label: 'a'}],
        [230, {label: 'to'}],
        [255, {label: 'the'}],
        [300, {label: 'I'}]
      ],
      axisLabel: standardAxisLabel,
      color: alternateColors
    });
    
    jQuery('#longer-word-graph').tufteBar({
      data: [
        [14, {label: 'seems'}],
        [17, {label: 'edinburgh'}],
        [18, {label: 'great'}],
        [19, {label: 'going'}],
        [19, {label: 'today'}],
        [20, {label: 'people'}],
        [24, {label: 'there'}],
        [28, {label: 'awesome'}],
        [32, {label: 'would'}],
        [34, {label: 'about'}],
        [37, {label: 'thats'}],
        [38, {label: 'think'}],
        [40, {label: 'really'}],
        [43, {label: 'thanks'}]
      ],
      axisLabel: standardAxisLabel,
      color: alternateColors
    });
  });
</script>

[2<sup>11</sup> tweets][2048]! Hooray!

It's been about a year since I hit [1,024 tweets][1024]. In that time a few things have changed; after four years working for the Forestry Commission I left to join the guys at ASMALLWORLD building and maintaining a huge Rails app.

I wondered what my mood had been within this period. One extremely unscientific indicator of mood is emoticons.

### Emoticons

<div id="emoticon-graph" class="graph" style="width: 530px; height: 200px;"></div>

As you can see, I have been mostly `:)`, occasionally `:D`, sometimes `:(` and hardly ever `D:` which is exactly how things should be, so that's good.

### Retweets

Over the past year I've averaged 2.61 tweets a day.

229 of those tweets (about 22%) have been retweets. That's higher than I thought it would be, so I had a look at who I'd been retweeting:

<div id="retweet-distribution-graph" class="graph" style="width: 530px; height: 200px;"></div>

Of the 229 retweets that I've made, 128 of those, or 55%, were retweets from users that I've only retweeted once. I don't even follow most of them. I wasn't aware how often I retweeted retweets, but the data suggests I do it quite a lot!

Of the people that I've retweeted three times or more, here's who I've retweeted the most:

<div id="retweet-graph" class="graph long-labels" style="width: 460px; height: 200px;"></div>

I've colour coded the charts to group people together. 

* In red are the people that I know through the [Scottish Ruby Users Group][scotrug].
* In blue are the people that I work with. 
* In green are the people that I know through my time spent helping with the [Guild Wars Wiki][gww].
* In brown are people that don't fall into any of the other groups!

At the top of the retweets is [@saveourforests][]. This is actually an account I registered myself during my time assisting in the [Save Our Forests][sof] campaign while at the Forestry Commission, so there is a little bit of self-promotion going on here, but since its creation the account has been updated almost exclusively by Tony, a former colleague, so I don't feel too guilty! And it was (and is) for a good cause!

Following on from that there's a good mix of people from ScotRUG and work who tend to say amusing or interesting things, and of course my girlfriend Lindsey, aka [@Daily_Madness][], who I am obliged to retweet from time to time to stay in her good books ;)

My [@notch][] retweets are due to my recent Minecraft addiction. The less said about that the better.

### Mentions

<div id="mention-graph" class="graph long-labels" style="width: 460px; height: 200px;"></div>

Mentions are more varied than retweets, probably because I'm more likely to have a conversation with most people than retweet them.

My colleagues [@mungler][] and [@mr_urf][] top the mentions chart, followed almost exclusively by members of ScotRUG and the Guild Wars Wiki, the only notable exceptions being my friend [@mikos][] who is not a ruby developer (shock horror) and @Daily_Madness.

### Hashtags

I feel like I have to mention hashtags since they're an important part of Twitter, but it would be pointless creating a chart for them since I only tend to use them as jokes.

The only two that I seem to have used seriously are [#yaypril][] 3 times and [#scotruby][] 7 times.

### Language

My most used word is "I". I'm so egocentric. This hasn't changed from last year.

<div id="word-graph" class="graph" style="width: 530px; height: 200px;"></div>

But short words aren't very interesting, so instead I examined my most used longer-than-four-letter words:

<div id="longer-word-graph" class="graph long-labels" style="width: 510px; height: 200px;"></div>

My most used words actually seem really positive! In fact you can almost read that last chart as a sentence.

I tend to say thanks a lot in real life, but I didn't realise this had carried over into Twitter.

I also probably say "awesome" a little too much. I am trying to replace this with "splendid".

### Summary

I'm not sure if analysing my tweets is a normal thing to do. I'm pretty certain it isn't. But it's quite fun to look closely at something that you've been doing almost absent-mindedly – like reading too much into people's doodles or trying to predict the future by examining the remnants of a cup of tea.

Thank you to my Twitter followers/followees for a year full of `:)`, here's hoping for another 2,048 mostly happy tweets!

  [1024]: /blog/2010/10/1024-tweets
  [2048]: https://twitter.com/#!/baxt3r/status/133645503639465984
  [scotrug]: http://scotrug.org/
  [gww]: http://wiki.guildwars.com/wiki/Main_Page
  [sof]: http://saveourforests.co.uk/
  
  [@saveourforests]: https://twitter.com/saveourforests
  [@Daily_Madness]: https://twitter.com/Daily_Madness
  [@notch]: https://twitter.com/notch
  [@mungler]: https://twitter.com/mungler
  [@mr_urf]: https://twitter.com/mr_urf
  [@mikos]: https://twitter.com/mikos
  [#yaypril]: https://twitter.com/#!/search/realtime/%23yaypril
  [#scotruby]: https://twitter.com/#!/search/realtime/%23scotruby