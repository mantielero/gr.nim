#from gr_wrapper import gr_grid, gr_grid3d


#[
proc gr_grid*(a:cdouble, b:cdouble, c:cdouble, d:cdouble, e:cint, f:cint)    {.importc,dynlib: libName.}
proc gr_grid3d*(a:cdouble, b:cdouble, c:cdouble, d:cdouble, e:cdouble, f:cdouble, g:cint, h:cint, i:cint)    {.importc,dynlib: libName.}
]#

proc grid*(x_tick, y_tick, x_org, y_org: float, major_x, major_y:int) =
  ##[
  Draw a linear and/or logarithmic grid.

  Major grid lines correspond to the axes origin and major tick marks whether visible or not. Minor grid lines are drawn at points equal to minor tick marks. Major grid lines are drawn using black lines and minor grid lines are drawn using gray lines.

  - `x_tick`: The length in world coordinates of the interval between minor grid lines in X direction.
  - `y_tick`: The length in world coordinates of the interval between minor grid lines in Y direction.
  - `x_org`: The world coordinate of the origin (point of intersection) of the X axis.
  - `y_org`: The world coordinate of the origin (point of intersection) of the Y axis.
  - `major_x`: Unitless integer value specifying the number of minor grid lines between major grid lines on the X axis. Values of 0 or 1 imply no grid lines. 
  - `major_y`: Unitless integer value specifying the number of minor grid lines between major grid lines on the Y axis. Values of 0 or 1 imply no grid lines.  
  ]##
  gr_grid(x_tick.cdouble, y_tick.cdouble, x_org.cdouble, y_org.cdouble, major_x.cint, major_y.cint)



proc grid*(x_tick, y_tick, z_tick, x_org, y_org, z_org: float, major_x, major_y, major_z:int) =
  ##[
  Draw a linear and/or logarithmic grid.

  Major grid lines correspond to the axes origin and major tick marks whether visible or not. Minor grid lines are drawn at points equal to minor tick marks. Major grid lines are drawn using black lines and minor grid lines are drawn using gray lines.

  - `x_tick`: The length in world coordinates of the interval between minor grid lines in X direction.
  - `y_tick`: The length in world coordinates of the interval between minor grid lines in Y direction.
  - `z_tick`: The length in world coordinates of the interval between minor grid lines in Z direction.
  - `x_org`: The world coordinate of the origin (point of intersection) of the X axis.
  - `y_org`: The world coordinate of the origin (point of intersection) of the Y axis.
  - `z_org`: The world coordinate of the origin (point of intersection) of the Z axis.
  - `major_x`: Unitless integer value specifying the number of minor grid lines between major grid lines on the X axis. Values of 0 or 1 imply no grid lines. 
  - `major_y`: Unitless integer value specifying the number of minor grid lines between major grid lines on the Y axis. Values of 0 or 1 imply no grid lines.  
  - `major_z`: Unitless integer value specifying the number of minor grid lines between major grid lines on the Z axis. Values of 0 or 1 imply no grid lines.
  ]##
  gr_grid3d(x_tick.cdouble, y_tick.cdouble, z_tick.cdouble, x_org.cdouble, y_org.cdouble, z_org.cdouble, major_x.cint, major_y.cint, major_z.cint) 


proc grid*(minor_spacing:array[2,float], origin:array[2,float],major:array[2,int]) =
  ## Draw a linear and/or logarithmic grid.
  ## https://gr-framework.org/c-gr.html?highlight=gr_grid#_CPPv47gr_gridddddii
  grid( minor_spacing[0], minor_spacing[1], origin[0], origin[1], major[0], major[1])
  