##[
GR
==

Windows / Viewports
-------------------

To position content, GR and GKS perform a series of transformations from the coordinates you work with to the final coordinates on the screen or an image file.

The coordinates you work with can be in whatever range you want and are purely chosen by you. The space they lie in is usually called the **world space**. 

**Window**: maybe you do not want to include all of this world space in an image, but only a rectangular section of it. This section of world space that you are interested in is called the window and can be set using the `setwindow` function. This window is indicated in world coordinates.


**Viewport**: region of the output in which it is drawn. From 0 to 1 (for both x's and y's).

The window controls what region of your world space is drawn and the viewport controls which region of your output it is drawn on.

setwindow: indicates which area of a figure we want to see

setviewport: indicates where we want to display it

]##
import math

include gr/gr_wrapper
include gr/common
include gr/grid
include gr/axes
include gr/polyline
include gr/text
include gr/plot

#, common, axes, polyline
#export Dataset, plot


