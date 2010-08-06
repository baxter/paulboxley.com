Title: Encapsulation in JavaScript
Posted: 2010-08-06 16:44Z

On the subject of JavaScript, I've become very fond of the following technique for creating objects with encapsulated properties:

    var object = function(val) {
      return {
        getVal = function() {
          return val;
        },
        setVal = function(newVal) {
          val = newVal;
        }
      };
    }("My initial value.");