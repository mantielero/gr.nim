import ../src/gr
import sequtils, sugar, math
import random


proc hist(x:seq[float]; xmin:float= -1.0;xmax:float=1.0;nbins:int=0):tuple[edges:seq[float],counts:seq[int]] =
  var bins = nbins
  if nbins <= 1:
    bins = (3.3 * log10(x.len.float) + 1.0).int  # Si hay 100, pasamos a 10 grupos.

  let edges = linRange(xmin, xmax, nbins + 1)
  
  var counts = newSeq[int](nbins)
  for i in 0..<nbins:
      let mi = edges[i]
      let ma = edges[i+1]
      counts[i] = 0
      for j in x:
          if mi <= j and j < ma:
              counts[i] += 1
  return (edges, counts)


randomize()

#[ Julia
# Create example data
x = 2 .* rand(100) .- 1
# Draw the histogram
histogram(x)
# Draw the histogram with 19 bins
histogram(x, nbins=19)    
]#

# Create random floats between -1.0, 1.0
let n = 100
var x= newSeq[float](n)
for i in 0..<n:
  x[i] = rand(1.0) * 2.0 - 1.0 
#echo len x
let (edges, counts) = hist(x,nbins=19)
#echo counts



let (xmin, xmax, ymin, ymax) = (-1.0,1.0,0.0,10.0)
setWindow(xmin,xmax, ymin,ymax)

setViewport()



# Axes
setLineColor(1)
axes( 0.1, 1.0,
      -1.0,0.0, 
      5, 2, 
      0.01) 

axes( 0.1, 1.0,
      1.0,10.0, 
      -5, -5,  # Negative means no labels
      -0.01) 

grid(0.2,1.0, 0.0, 0.0,5,5)
#[
proc label(a1,a2:cdouble, a3:var cstring, a4:cdouble) =
    discard ""
gr_axeslbl(0.2, 1.0,
      2.0,20.0, 
      5, 5, 
      -0.01, nil, nil)
]#

# Draw bars
for i in 0..<counts.len:
    setFillColor(989)
    setFillintStyle(fillSOLID)
    #proc gr_drawrect*(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble) {.impgrC.}
    gr_fillrect(edges[i], edges[i+1], 0.0, counts[i].float)
    #GR.fillrect(x[i], x[i+1], ymin, y[i])
    setFillColor(1)
    setFillintStyle(fillHOLLOW)
    gr_fillrect(edges[i], edges[i+1], 0.0, counts[i].float)


gr_updatews()
discard readLine(stdin)