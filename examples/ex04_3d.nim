import ../src/gr
import sequtils, sugar, math

let x = linRange(0.0, 30.0, 1000)
let y = x.map(x => cos(x) * x) 
let z = x.map(x => sin(x) * x) 

#gr_initgr()

setWindow( x.min, x.max, 
           y.min, y.max, 
           z.min, z.max )
polyline(x, y, z)
axes( 5.0, 5.0, 5.0,
      x.max, y.max, z.max,
      5, 5, 5,
      0.02)

grid( 5.0, 5.0, 5.0, 
      0.0, 0.0, 0.0, 
      2, 0, 2 )  

grid( 5.0, 5.0, 5.0,
      0.0, 0.0, 0.0,
      0, 2, 0 )

#[
GR.grid3d(xtick, 0, ztick, xorg[1], yorg[2], zorg[1], 2, 0, 2)
GR.grid3d(0, ytick, 0, xorg[1], yorg[2], zorg[1], 0, 2, 0)      
]#


axes( 5.0, 0.0, 5.0, 
      0.0, 0.0, 0.0,    #xorg[1], yorg[1], zorg[1], 
      5, 0, 5, -0.02 )

axes( 0, 5.0, 0, 
      0.0, 0.0, 0.0,#xorg[2], yorg[1], zorg[1], 
      0, 5, 0, #0, majory, 0, 
      -0.02 ) #ticksize)

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


#[
zmin, zmax = plt.kvs[:zrange]
if scale & GR.OPTION_Z_LOG == 0
    if !haskey(plt.kvs, :zlim)
        zmin, zmax = GR.adjustlimits(zmin, zmax)
    end
    if haskey(plt.kvs, :zticks)
        ztick, majorz = plt.kvs[:zticks]
    else
        majorz = major_count
        ztick = GR.tick(zmin, zmax) / majorz
    end
else
    ztick = majorz = 1
end

if scale & GR.OPTION_FLIP_Z == 0
    zorg = (zmin, zmax)
else
    zorg = (zmax, zmin)
end
plt.kvs[:zaxis] = ztick, zorg, majorz      
]#
gr_updatews()
discard readLine(stdin)