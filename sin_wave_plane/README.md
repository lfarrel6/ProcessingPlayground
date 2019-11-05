## A visualisation plane modulating according to a sine wave function

Inspired by: [Bees and Bombs](https://twitter.com/beesandbombs/status/940639806522085376) and [The Coding Train](https://editor.p5js.org/full/lCDER-xsu)

This sketch creates a 3d plane of boxes, which modulate their height using a sine wave combined with a distance function.

The height of a given box varies using the value of the sine function and an offset, calculated as the distance from the center of the plane.

There are several lines to play around with in this one:
  - Save a GIF by updating the recording boolean (and tweaking the `maxFrames` value), you can then stitch the saved files with either gifsicle(mac) or unfreez(windows).
  - Change the point light parameters to update the light's colour or direction
  - Change the fill mode to vary the colour scheme
