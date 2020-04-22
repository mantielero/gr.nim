type
  FillingStyle = enum
    fillHOLLOW  = 0, ## No filling. Just draw the bounding polyline
    fillSOLID   = 1, ## Fill the interior of the polygon using the fill color index
    fillPATTERN = 2, ## Fill the interior of the polygon using the style index as a pattern index
    fillHATCH   = 3, ## Fill the interior of the polygon using the style index as a cross-hatched style
    fillSOLID_WITH_BORDER =4   ## Fill the interior of the polygon using the fill color index and draw the bounding polyline

proc FillArea*(n:int, x,y: ptr float) =
  ##[
  Allows you to specify a polygonal shape of an area to be filled.

  The attributes that control the appearance of fill areas are fill area interior style, fill area style index and fill area color index.

  Parameters:

  - `n`: The number of points
  - `x`: A pointer to the X coordinates
  - `y`: A pointer to the Y coordinates
  ]##
  gr_fillarea(n.cint, cast[ptr cdouble](x), cast[ptr cdouble](y)) 

proc FillArea*(x, y:seq[float]) =
  assert(x.len == y.len)
  let n = x.len
  FillArea(n, cast[ptr float](x.unsafeAddr), cast[ptr float](y.unsafeAddr))


proc setFillingStyle*(style:FillingStyle) =
  ## Set the fill area interior style to be used for fill areas.
  ## This function defines the interior style for subsequent fill area output primitives. The default interior style is HOLLOW.
  gr_setfillintstyle(style.cint)


proc getFillintStyle():FillingStyle =
  var style:cint
  gr_inqfillintstyle*(style.unsafeAddr)
  return style.FillingStyle


proc setFillStyle*(style:int) = # For PATTERN or HATCH
  ##[
  Set the fill area interior style to be used for fill areas.

  This function specifies an index when PATTERN fill or HATCH fill is requested by the gr_setfillintstyle function. If the interior style is set to PATTERN, the fill style index points to a device-independent pattern table. If interior style is set to HATCH the fill style index indicates different hatch styles. If HOLLOW or SOLID is specified for the interior style, the fill style index is unused.

  Parameters:

  - index: The fill style index to be used
  ]##
    
  gr_setfillstyle(style.cint)  

proc getFillStyle*():int =
  var index:cint
  gr_inqfillstyle(index.unsafeAddr)
  return index.int

proc setFillColor*(color:Color) =
  ##[
  Sets the current fill area color index.

  This function defines the color of subsequent fill area output primitives. GR uses the default foreground color (black=1) for the default fill area color index.
 
  Parameters:
  
  - `color`: The fill area color index (COLOR < 1256)
  ]##
  gr_setfillcolorind(color.cint)

proc getFillColor*():Color =
  ## Gets the current fill area color index.
  ##
  ## This function gets the color of fill area output primitives.
  var color:cint
  gr_inqfillcolorind*(color.unsafeAddr)
  return color.Color

