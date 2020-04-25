import ../src/gr
import sequtils, sugar, math
import random

#[
julia> # Draw the contour plot
julia> contour(x, y, z)

julia> # Create example grid data
julia> x = LinRange(-2, 2, 40)
julia> y = LinRange(0, pi, 20)
julia> z = sin.(x') .+ cos.(y)
julia> # Draw the contour plot
julia> contour(x, y, z)
julia> # Draw the contour plot using a callable
julia> contour(x, y, (x,y) -> sin(x) + cos(y))    
]#


randomize()


# Create random floats between -4.0, 4.0
let n = 100
var x= newSeq[float](n)
for i in 0..<n:
  x[i] = rand(1.0) * 8.0 - 4.0 

var y= newSeq[float](n)
for i in 0..<n:
  y[i] = rand(1.0) * 8.0 - 4.0 

var z = newSeq[float](n)
for i in 0..<n:
  z[i] = sin(x[i]) + cos(y[i])

var xx, yy, zz:seq[float]
if x.len == y.len and y.len == z.len:
  (xx, yy, zz) = gridit(x,y,z, 200, 200)
  #echo xx

discard setSpace(zz.min, zz.max, 0, 90)
let h = linRange(zz.min, zz.max, 20)

#[
zmin, zmax = plt.kvs[:zrange]
if length(x) == length(y) == length(z)
    x, y, z = GR.gridit(x, y, z, 200, 200)
    zmin, zmax = get(plt.kvs, :zlim, (_min(z), _max(z)))
end
GR.setspace(zmin, zmax, 0, 90)


levels = get(plt.kvs, :levels, 0)
clabels = get(plt.kvs, :clabels, false)
if typeof(levels) <: Int
    hmin, hmax = GR.adjustrange(zmin, zmax)
    h = linspace(hmin, hmax, levels == 0 ? 21 : levels + 1)
else
    h = float(levels)
end
GR.contour(x, y, h, z, clabels ? 1 : 1000)
colorbar(0, length(h))    
]#

#echo len x
#let (edges, counts) = hist(x,nbins=19)
#echo counts



let (xmin, xmax, ymin, ymax) = (-4.0,4.0,-4.0,4.0)
setWindow(xmin,xmax, ymin,ymax)

setViewport()



# Axes
setLineColor(1)
axes( 0.5, 0.5,
      -4.0,-4.0, 
      4, 4, 
      0.01) 

axes( 0.5, 0.5,
      4.0,4.0, 
      -4, -4,  # Negative means no labels
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


contour(xx, yy, zz, h, 0)#3 )

gr_updatews()
discard readLine(stdin)