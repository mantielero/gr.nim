#from gr_wrapper import gr_setmarkertype, gr_inqmarkertype, gr_setmarkersize, gr_inqmarkersize, gr_setmarkercolorind, gr_inqmarkercolorind

#[
proc gr_setmarkertype*(a:cint)    {.importc,dynlib: libName.}
proc gr_inqmarkertype*(a:ptr cint)    {.importc,dynlib: libName.}
proc gr_setmarkersize*(a:cdouble)    {.importc,dynlib: libName.}
proc gr_inqmarkersize*(a:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_setmarkercolorind*(a:cint)    {.importc,dynlib: libName.}
proc gr_inqmarkercolorind*(a:ptr cint)    {.importc,dynlib: libName.}
]#

type
  MarkerType = enum
    mtOMARK = -32,      # o-mark
    mtHLINE = -31,      # horizontal line
    mtVLINE = -30,      # verical line
    mtSTAR_8 = -29,     # 8-pointed star (octagram)
    mtSTAR_7 = -28,     # 7-pointed star (heptagram)
    mtSTAR_6 = -27,     # 6-pointed star (hexagram)
    mtSTAR_5 = -26,     # 5-pointed star (pentagram)
    mtSTAR_4 = -25,     # 4-pointed star
    mtOCTAGON = -24,    # Octagon
    mtHEPTAGON = -23,   # Heptagon
    mtHEXAGON  = -22,   # Hexagon
    mtPENTAGON = -21,   # Pentagon
    mtSOLID PLUS = -20,        # Solid plus sign
    mtHOLLOW PLUS = -19,       # Hollow plus sign
    mtSOLID_TRI_LEFT = -18,    # Filled triangle pointing left
    mtSOLID_TRI_RIGHT = -17,   # Filled triangle point right
    mtTRI_UP_DOWN = -16,       # Hollow triangles pointing up and down overlaid
    mtSOLID_STAR = -15,        # Filled Star
    mtSTAR = -14,              # Hollow star
    mtSOLID_DIAMOND = -13,     # Filled Diamond
    mtDIAMOND = -12,           # Hollow diamond
    mtSOLID_HGLASS = -11,      # Filled hourglass
    mtHGLASS = -10,            # Hollow hourglass
    mtSOLID_BOWTIE = -9,       # Filled bowtie
    mtBOWTIE = -8,             # Hollow bowtie
    mtSOLID_SQUARE = -7,       # Filled square
    mtSQUARE = -6,             # Hollow square
    mtSOLID_TRI_DOWN = -5,     # Filled triangle pointing downward
    mtTRIANGLE_DOWN = -4,      # Hollow triangle pointing downward
    mtSOLID_TRI_UP = -3,       # Filled triangle pointing upward
    mtTRIANGLE_UP = -2,        # Hollow triangle pointing upward
    mtSOLID_CIRCLE = -1,       # Filled circle
    mtDOT = 1,                 # Smallest displayable dot
    mtPLUS = 2,                # Plus sign
    mtASTERISK = 3,            # Asterisk
    mtCIRCLE = 4,              # Hollow circle
    mtDIAGONAL_CROSS = 5,      # Diagonal cross

proc setMarkerType*(`type`:MarkerType) =
  ## Specifiy the marker type for polymarkers.
  gr_setmarkertype(`type`.cint)


proc getMarkerType():MarkerType =
  var val:cint
  gr_inqmarkertype(val)
  return val.MarkerType


proc setMarkerSize(size:float) =
  ##[
  Specify the marker size for polymarkers.

  The polymarker size is calculated as the nominal size generated on the graphics device multiplied by the marker size scale factor.

  Parameters:

  - `size`: Scale factor applied to the nominal marker size
  ]##
  gr_setmarkersize(size.cdouble)


proc getMarkerSize():float =
  var val:cdouble
  gr_inqmarkertype(val.addr)
  return val.float


proc setMarkerColor(color:Color) =
  ## Define the color of subsequent polymarker output primitives.
  gr_setmarkercolorind(color.cint)

proc getMarkerColor():Color =
  var color:cint
  gr_inqmarkercolorind(color.addr)
  return color.Color


proc polymarker(n:int, x:ptr float, y:ptr float) = 
  ##[
  Draw marker symbols centered at the given data points.

  The values for `x` and `y` are in world coordinates. The attributes that control the appearance of a polymarker are marker type, marker size scale factor and color index.
  
  Parameters:
  
  - `n`: The number of points
  - `x`: A pointer to the X coordinates
  - `y`: A pointer to the Y coordinates
  ]##
  gr_polymarker( n.cint, cast[ptr cdouble](x), cast[ptr cdouble](y) )

