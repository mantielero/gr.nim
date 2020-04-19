#from gr_wrapper import gr_axes
#[
type
  Axes* = object
    origin: array[2,float]
    minor_ticks_spacing:array[2,float]  ## By default the axis are hidden
    major_nticks:array[2,int]
    tick_length:float

proc showX*(ax:var Axes,tick_spacing:float) =
  if tick_spacing <= 0.0:
    raise newException(ValueError, "`tick_spacing` should be bigger than 0.0")
  ax.minor_ticks_spacing[0] = tick_spacing

proc showY*(ax:var Axes,tick_spacing:float) =
  if tick_spacing <= 0.0:
    raise newException(ValueError, "`tick_spacing` should be bigger than 0.0")
  ax.minor_ticks_spacing[1] = tick_spacing
]#

# Axes

proc axes*(x_tick, y_tick, x_org, y_org:float, major_x, major_y:int, tick_size:float) =
  ##[
Draw X and Y coordinate axes with linearly and/or logarithmically spaced tick marks.

Tick marks are positioned along each axis so that major tick marks fall on the axes origin (whether visible or not). Major tick marks are labeled with the corresponding data values. Axes are drawn according to the scale of the window. Axes and tick marks are drawn using solid lines; line color and width can be modified using the gr_setlinetype and gr_setlinewidth functions. Axes are drawn according to the linear or logarithmic transformation established by the gr_setscale function.

Parameters:

- `x_tick`: The interval between minor tick marks on the X axis.
- `y_tick`: The interval between minor tick marks on the Y axis.
- `x_org`: The world coordinate of the origin (point of intersection) of the X axis.
- `y_org`: The world coordinate of the origin (point of intersection) of the Y axis.
- `major_x`: Unitless integer value specifying the number of minor tick intervals between major tick marks on the X axis. Values of 0 or 1 imply no minor ticks. Negative values specify no labels will be drawn for the associated axis.
- `major_y`: Unitless integer value specifying the number of minor tick intervals between major tick marks on the Y axis. Values of 0 or 1 imply no minor ticks. Negative values specify no labels will be drawn for the associated axis.
- `tick_size`: The length of minor tick marks specified in a normalized device coordinate unit. Major tick marks are twice as long as minor tick marks. A negative value reverses the tick marks on the axes from inward facing to outward facing (or vice versa).
  ]##
  gr_axes(x_tick.cdouble, y_tick.cdouble, x_org.cdouble, y_org.cdouble, major_x.cint, major_y.cint, tick_size.cdouble)  


proc axes*(x_tick, y_tick, z_tick, 
           x_org, y_org, z_org:float, 
           major_x, major_y, major_z:int, 
           tick_size:float) =
  ##[
  Draw X, Y and Z coordinate axes with linearly and/or logarithmically spaced tick marks.

  Tick marks are positioned along each axis so that major tick marks fall on the axes origin (whether visible or not). Major tick marks are labeled with the corresponding data values. Axes are drawn according to the scale of the window. Axes and tick marks are drawn using solid lines; line color and width can be modified using the gr_setlinetype and gr_setlinewidth functions. Axes are drawn according to the linear or logarithmic transformation established by the gr_setscale function.

  Parameters:

  - `x_tick`: The length in world coordinates of the interval between minor grid lines in X direction.
  - `y_tick`: The length in world coordinates of the interval between minor grid lines in Y direction.
  - `z_tick`: The length in world coordinates of the interval between minor grid lines in Z direction.
  - `x_org`: The world coordinate of the origin (point of intersection) of the X axis.
  - `y_org`: The world coordinate of the origin (point of intersection) of the Y axis.
  - `z_org`: The world coordinate of the origin (point of intersection) of the Z axis.
  - `major_x`: Unitless integer value specifying the number of minor grid lines between major grid lines on the X axis. Values of 0 or 1 imply no grid lines.
  - `major_y`: Unitless integer value specifying the number of minor grid lines between major grid lines on the Y axis. Values of 0 or 1 imply no grid lines.
  - `major_z`: Unitless integer value specifying the number of minor grid lines between major grid lines on the Z axis. Values of 0 or 1 imply no grid lines.
  - `tick_size`: The length of minor tick marks specified in a normalized device coordinate unit. Major tick marks are twice as long as minor tick marks. A negative value reverses the tick marks on the axes from inward facing to outward facing (or vice versa).
  ]##
  gr_axes3d( x_tick.cdouble, y_tick.cdouble, z_tick.cdouble, 
             x_org.cdouble, y_org.cdouble, z_org.cdouble, 
             major_x.cint, major_y.cint, major_z.cint,
             tick_size.cdouble)  


proc axes*( origin:array[2,float],
            minor_ticks_spacing:array[2,float]=[1.0,0.0]; 
            major_nticks:array[2,int]=[0,1]; 
            tick_length:float=0.01 ) =
  ##[
  Draw X and Y coordinate axes with linearly and/or logarithmically spaced tick marks.
  
  There are two kind of ticks: minor ticks are just a tick in the axe and major ticks are
  twice as long ticks with a label.

  `minor_ticks_spacing` indicates the spacing between minor ticks in world coordinates. If 0.0, then that axe is not represented.
  
  `major_nticks` indicates how many minor ticks (minus one) there are for every major tick. 
  The values 0 or 1 means that there are no minor ticks.

  The `tick_length` indicates the minor tick's length (major ticks are twice as long) in
  NDC (Normalized Device Coordinate) units. Negative values reverses the tick mark on the axe.
  The value 0.0 is not valid

  `original documentation <https://gr-framework.org/c-gr.html#_CPPv47gr_axesddddiid>`_
  ]##
  axes( minor_ticks_spacing[0], minor_ticks_spacing[1],
           origin[0], origin[1], 
           major_nticks[0], major_nticks[1], 
           tick_length)



#proc gr_tick*(a:cdouble, b:cdouble):cdouble

proc tick*(min,max:float):float = 
  ## Calculates the spacing between ticks in order to have 5 minor ticks 
  # replaces gr_tick
  (max-min)/5.0