import ../src/gr
import sequtils, sugar, math

let x = linRange(-2.0, 2.0, 40)
let y1 = x.map(x => 2.0 * x + 4.0) #y = 2 .* x .+ 4
let y2 = x.map(x => x^3 + x^2 + x) 

#plot(x, y) #, [-2.0,2.0, -10.0,20.0])
let (xmin, xmax, ymin, ymax) = (-2.0,2.0,-10.0,20.0)
setWindow(xmin,xmax, ymin,ymax)

setViewport()



# Axes
setLineColor(1)
axes( 0.2, 1.0,
      -2.0,-10.0, 
      5, 5, 
      0.01) 

axes( 0.2, 1.0,
      2.0,20.0, 
      -5, -5,  # Negative means no labels
      -0.01) 

grid(0.2,1.0, -2.0,-10.0,5,5)
#[
proc label(a1,a2:cdouble, a3:var cstring, a4:cdouble) =
    discard ""
gr_axeslbl(0.2, 1.0,
      2.0,20.0, 
      5, 5, 
      -0.01, nil, nil)
]#

# Curves
setLineColor(2)
polyline(x,y1)

setLineColor(4)
polyline(x,y2)

gr_updatews()
discard readLine(stdin)