#from gr_wrapper import gr_polyline, gr_setlinetype, gr_setlinecolorind, gr_inqlinetype, gr_inqlinecolorind, gr_setlinewidth, gr_inqlinewidth
#import common #from common import Dataset, Color

type
  LineType = enum
    ltTripleDot = -8,     ## Sequence of groups of three dots
    ltDoubleDot = -7,     ## Sequence of pairs of dots    
    ltSpacedDot = -6,     ## Sequence of dots double spaced
    ltSpacedDash = -5,    ## Sequence of dashes double spaced
    ltLongShortDash = -4, ## Sequence of a long dash followed by a short dash
    ltLongDash = -3,      ## Sequence of long dashes
    ltDash3Dot = -2,      ## Sequence of one dash followed by three dots
    ltDash2Dot = -1,      ## Sequence of one dash followed by two dots
    ltSolid = 1,          ## Solid line
    ltDashed = 2,         ## Dashed line
    ltDotted = 3,         ## Dotted line
    ltDashedDotted = 4    ## Dashed-dotted line


proc polyline*(n:int, x:ptr float, y:ptr float) =
  ##[
  Draw a polyline using the current line attributes, starting from the first data point and ending at the last data point.

  The values for

  `x` and `y` are in world coordinates. The attributes that control the appearance of a polyline are linetype, linewidth and color index.

  Parameters:

  - n: The number of points
  - x: A pointer to the X coordinates
  - y: A pointer to the Y coordinates
  ]##
  gr_polyline(n.cint, cast[ptr cdouble](x), cast[ptr cdouble](y))  

proc polyline*(x, y: seq[float]) =
  assert(x.len == y.len, "both sequences shall be equal")
  let n = x.len.cint
  let px = cast[ptr cdouble](x[0].unsafeAddr)
  let py = cast[ptr cdouble](y[0].unsafeAddr)
  gr_polyline(n, px, py)

proc polyline*(data:Dataset) =
  let n = data.x.len.cint
  let px = cast[ptr cdouble](unsafeAddr(data.x[0]))
  let py = cast[ptr cdouble](unsafeAddr(data.y[0]))
  gr_polyline(n, px, py)

# 3D
proc polyline*(x, y, z: seq[float]) =
  assert( x.len == y.len)
  assert( y.len == z.len )
  let n = x.len
  gr_polyline3d(n.cint, cast[ptr cdouble](unsafeAddr(x[0])), cast[ptr cdouble](unsafeAddr(y[0])), cast[ptr cdouble](unsafeAddr(z[0]))) 



proc setLineType*(lt:LineType) =
  ## Specify the line style for polylines.
  gr_setlinetype(lt.cint)


proc getLineType():LineType =
  var `type`:cint
  gr_inqlinetype(`type`.addr)
  return `type`.LineType


proc setLineColor*(color:Color) =
  ## Define the color of subsequent polyline output primitives.
  ## 0: white, 1: black
  gr_setlinecolorind(color.cint)  

proc setLineColor*(color:int) =
  setLineColor(color.Color)

proc getLineColor():Color =
  var color:cint
  gr_inqlinecolorind(color.addr)
  return color.Color


proc setLineWidth*(width:float) =
  ##[
  Define the line width of subsequent polyline output primitives.

  The line width is calculated as the nominal line width generated on the workstation multiplied by the line width scale factor. This value is mapped by the workstation to the nearest available line width. The default line width is 1.0, or 1 times the line width generated on the graphics device.
  ]##
  gr_setlinewidth(width.cdouble) 

proc getLineWidth():float =
  var width:cdouble
  gr_inqlinewidth(width.addr)
  return width.float

