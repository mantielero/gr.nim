type
  Axes2* = object
    origin*: array[2,float]     ## Origin position
    ticks*:  array[2,float]     ## By default the axis are hidden
    major_nticks*:array[2,int]  ## 
    tick_length*:float 

proc hideLabelsX(ax:var Axes2) =
  if ax.major_nticks[0] > 0:
    ax.major_nticks[0] *= -1


proc add*( ax:Axes2 ) =
  axes( ax.ticks[0], ax.ticks[1], 
        ax.origin[0], ax.origin[1], 
        ax.major_nticks[0], ax.major_nticks[1], 
        ax.tick_length)