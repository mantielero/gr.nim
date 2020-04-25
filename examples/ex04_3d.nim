import ../src/gr
import sequtils, sugar, math

let x = linRange(0.0, 30.0, 1000)
let y = x.map(x => cos(x) * x) 
let z = x.map(x => sin(x) * x) 

#gr_initgr()

setWindow(   x.min, x.max, 
           y.min, y.max, 
           z.min, z.max )
polyline(x, y, z)
axes( 5.0, 5.0, 5.0,
      x.max, y.max, z.max,
      5, 5, 5,
      0.02)

grid( 5.0,5.0,5.0, 
      0.0,0.0,0.0, 
      2, 0, 2)  

grid( 5.0,5.0,5.0, 
      0.0,0.0,0.0, 
      0, 2, 0)        
#[
GR.grid3d(xtick, 0, ztick, xorg[1], yorg[2], zorg[1], 2, 0, 2)
GR.grid3d(0, ytick, 0, xorg[1], yorg[2], zorg[1], 0, 2, 0)      
]#


axes( 5.0, 0.0, 5.0, 
      0.0,0.0,0.0,#xorg[1], yorg[1], zorg[1], 
      5, 0, 5, -0.02)
axes( 0, 5.0, 0, 
      0.0,0.0,0.0,#xorg[2], yorg[1], zorg[1], 
      0,5,0, #0, majory, 0, 
      -0.02) #ticksize)

#[
setWindow( 0.0, 30.0, -30.0, 30.0, -30.0, 30.0 )
polyline(x, y, z)
axes( 5.0, 5.0, 5.0,
      0.0, 0.0, 0.0,
      5, 5, 5,
      2.0)

grid(5.0,5.0,5.0, 0.0,0.0,0.0, 5, 5, 5)  
gr_updatews()    
]#

gr_updatews()
discard readLine(stdin)