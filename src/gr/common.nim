#import gr_wrapper
#import math

type
  Color* = range[0..1255]
  Window* = object
    ## Rectangular subspace of world coordinates to be plotted
    xmin*:float ## The left horizontal coordinate of the window (xmin < xmax).
    xmax*:float ## The right horizontal coordinate of the window (xmin < xmax).
    ymin*:float ## The bottom vertical coordinate of the window (ymin < ymax).
    ymax*:float ## The top vertical coordinate of the window (ymin < ymax).

  Dataset* = object
    name*:string
    x*, y*:seq[float]

  

proc setWindow*(xmin, xmax,ymin,ymax:float) =
  ##[
  Establishes a window, or rectangular subspace, of world coordinates to be plotted. If you desire log scaling or mirror-imaging of axes, use the gr_setscale function.

  This function defines the rectangular portion of the World Coordinate space (WC) to be associated with the specified normalization transformation. The WC window and the Normalized Device Coordinates (NDC) viewport define the normalization transformation through which all output primitives are mapped. The WC window is mapped onto the rectangular NDC viewport which is, in turn, mapped onto the display surface of the open and active workstation, in device coordinates. By default, GR uses the range [0,1] x [0,1], in world coordinates, as the normalization transformation window.

  Parameters:

  - `xmin`: The left horizontal coordinate of the window (xmin < xmax).
  - `xmax`: The right horizontal coordinate of the window (xmin < xmax).
  - `ymin`: The bottom vertical coordinate of the window (ymin < ymax).
  - `ymax`: The top vertical coordinate of the window (ymin < ymax).
  ]##
  gr_setwindow(xmin.cdouble, xmax.cdouble, ymin.cdouble, ymax.cdouble)

proc setWindow*(xmin, xmax, ymin, ymax, zmin, zmax:float) =
  ##[
  Set the three dimensional window. Only used for perspective and orthographic projection.

  Parameters:

  - `xmin`: min x-value
  - `xmax`: max x-value
  - `ymin`: min y-value
  - `ymax`: max y-value
  - `zmin`: min z-value
  - `zmax`: max z-value
  ]##
  gr_setwindow3d( xmin.cdouble, xmax.cdouble, 
                  ymin.cdouble, ymax.cdouble, 
                  zmin.cdouble, zmax.cdouble )


template on*(filename: string, body: untyped) =
  gr_beginprint(filename.cstring)
  body
  gr_endprint()


template update*(body:untyped) =
  ## TODO: add output condition
  while true:
    gr_clearws()
    body
    gr_updatews()

proc linRange*(i, j:float, n:int ):seq[float] =
  let step = (j - i) / (n ).float
  var tmp:seq[float]
  var val = i
  for k in 0..n:
    tmp &= val
    val += step
  return tmp