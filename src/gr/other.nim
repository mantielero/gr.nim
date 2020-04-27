proc cellArray*[F:SomeFloat,I:SomeInteger]( xmin,xmax,ymin,ymax:F,
                                            dimx,dimy, scol,srow,ncol,nrow:I,
                                            color:seq[Color] ) =
  ##[
  Display rasterlike images in a device-independent manner. The cell array function partitions a rectangle given by two corner points into DIMX X DIMY cells, each of them colored individually by the corresponding color index of the given cell array.

  The values for

  xmin, xmax, ymin and ymax are in world coordinates.

  Parameters:
  
  - xmin: X coordinate of the lower left point of the rectangle
  - xmax: X coordinate of the upper right point of the rectangle
  - ymin: Y coordinate of the lower left point of the rectangle
  - ymax: Y coordinate of the upper right point of the rectangle
  - dimx: X dimension of the color index array
  - dimy: Y dimension of the color index array
  - scol: number of leading columns in the color index array
  - srow: number of leading rows in the color index array
  - ncol: total number of columns in the color index array
  - nrow: total number of rows in the color index array
  - color: color index array
  ]##                                         
  gr_cellarray( xmin.cdouble, xmax.cdouble, ymin.cdouble, ymax.cdouble, 
                dimx.cint, dimy.cint, scol.cint, srow.cint, ncol.cint, nrow.cint, 
                color[0].unsafeAddr)


proc nonUniformCellArray*[F:SomeFloat](x,y:seq[F], scol, srow, ncol, nrow:int, color:seq[Color]) =
  ##[
  Display a two dimensional color index array with nonuniform cell sizes.

  The values for

  x and y are in world coordinates. x must contain dimx+1 elements and y must contain dimy+1 elements. The elements i and i+1 are respectively the edges of the i-th cell in X and Y direction.
  
  Parameters:

  - x: X coordinates of the cell edges
  - y: Y coordinates of the cell edges
  - dimx: actual X dimension of the color index array in the memory
  - dimy: actual Y dimension of the color index array in the memory
  - scol: 1-based starting column of color index and x array
  - srow: 1-based starting row of color index and y array
  - ncol: number of columns displayed
  - nrow: number of rows displayed
  - color: color index array

  To draw all cells of the color index array use::

      gr_nonuniformcellarray(x, y, dimx, dimy, 1, 1, dimx, dimy, color)

  scol and srow can be used to specify a (1-based) starting column and row in the color, x and y array. dimx and dimy specify the actual dimension of the arrays in the memory whereof ncol and nrow values are displayed.
  ]##
  #double *x, double *y, int dimx, int dimy,

  gr_nonuniformcellarray( x[0].unsafeAddr, y[0].unsafeAddr, x.len.cint, y.len.cint, 
                          scol.cint, srow.cint, ncol.cint, nrow.cint, color[0].unsafeAddr)


proc polarCellArray*[F:SomeFloat,I:SomeInteger]( 
          x_org, y_org, phimin, phimax, rmin, rmax:F, 
          dimphi, dimr, scol, srow, ncol, nrow:I, 
          color:seq[Color] ) =
  ##[
  Display a two dimensional color index array mapped to a disk using polar coordinates.

  The two dimensional color index array is mapped to the resulting image by interpreting the X-axis of the array as the angle and the Y-axis as the raidus. The center point of the resulting disk is located at

  x_org, y_org and the radius of the disk is rmax.

  Parameters:

  - `x_org`: X coordinate of the disk center in world coordinates
  - `y_org`: Y coordinate of the disk center in world coordinates
  - `phimin`: start angle of the disk sector in degrees
  - `phimax`: end angle of the disk sector in degrees
  - `rmin`: inner radius of the punctured disk in world coordinates
  - `rmax`: outer radius of the disk in world coordinates
  - `dimphi`: Phi (X) dimension of the color index array
  - `dimr`: R (Y) dimension of the color index array
  - `scol`: number of leading columns in the color index array
  - `srow`: number of leading rows in the color index array
  - `ncol`: total number of columns in the color index array
  - `nrow`: total number of rows in the color index array
  - `color`: color index array

  To draw a contiguous array as a complete disk use:

  gr_polarcellarray(x_org, y_org, 0, 360, 0, rmax, dimphi, dimr, 1, 1, dimphi, dimr, color)

  The additional parameters to the function can be used to further control the mapping from polar to cartesian coordinates.

  If rmin is greater than 0 the input data is mapped to a punctured disk (or annulus) with an inner radius of rmin and an outer radius rmax. If rmin is greater than rmax the Y-axis of the array is reversed.

  The parameter phimin and phimax can be used to map the data to a sector of the (punctured) disk starting at phimin and ending at phimax. If phimin is greater than phimax the X-axis is reversed. The visible sector is the one starting in mathematically positive direction (counterclockwise) at the smaller angle and ending at the larger angle. An example of the four possible options can be found below:

  phimin	phimax	Result
  90	270	Left half visible, mapped counterclockwise
  270	90	Left half visible, mapped clockwise
  -90	90	Right half visible, mapped counterclockwise
  90	-90	Right half visible, mapped clockwise

  scol and srow can be used to specify a (1-based) starting column and row in the color array. ncol and nrow specify the actual dimension of the array in the memory whereof dimphi and dimr values are mapped to the disk.
  ]##
  gr_polarcellarray( x_org.cdouble, y_org.cdouble, 
                     phimin.cdouble, phimax.cdouble, 
                     rmin.cdouble, rmax.cdouble,
                     dimphi.cint, dimr.cint, scol.cint, srow.cint, ncol.cint, nrow.cint,
                     cast[ptr cint](color[0].unsafeAddr) )


proc grp*[F:SomeFloat, I:SomeInteger]( x,y:seq[F],n,m:I,k:seq[I] ) =
  ##[
  TBD
  ]##
  gr_gdp(x.len.cint, cast[ptr cdouble](x[0].unsafeAddr), cast[ptr cdouble](y[0].unsafeAddr), n.cint, m.cint, cast[ptr cint](k[0].unsafeAddr))


proc spline*[F:SomeFloat, I:SomeInteger]( x,y:seq[F],m, `method`:I ) =
  ##[
  Generate a cubic spline-fit, starting from the first data point and ending at the last data point.

  The values for `x` and `y` are in world coordinates. The attributes that control the appearance of a spline-fit are linetype, linewidth and color index.

  Parameters:

  - `n`: The number of points
  - `px`: A pointer to the X coordinates
  - `py`: A pointer to the Y coordinates
  - `m`: The number of points in the polygon to be drawn (m > n)
  - `method`: The smoothing method

  If method is > 0, then a generalized cross-validated smoothing spline is calculated. If method is 0, then an interpolating natural cubic spline is calculated. If method is < -1, then a cubic B-spline is calculated.
  ]##
  gr_spline( x.len.cint, cast[ptr cdouble](x[0].unsafeAddr), cast[ptr cdouble](y[0].unsafeAddr), m.cint, `method`.cint )


#[

proc gr_herrorbars*(a1: cint, a2: ptr cdouble, a3: ptr cdouble, a4: ptr cdouble, a5: ptr cdouble) {.impgrC.}

]#



proc vErrorBars*[F:SomeFloat](x,y,e1,e2:seq[F]) =
  ##[
  Draw a standard vertical error bar graph.

  Parameters:

  - n: The number of points
  - px: A pointer to the X coordinates
  - py: A pointer to the Y coordinates
  - e1: A pointer to the absolute values of the lower error bar data
  - e2: A pointer to the absolute values of the upper error bar data
  ]##
  gr_verrorbars(x.len.cint, 
      cast[ptr cdouble](x[0].unsafeAddr), cast[ptr cdouble](y[0].unsafeAddr), 
      cast[ptr cdouble](e1[0].unsafeAddr), cast[ptr cdouble](e2[0].unsafeAddr) )

proc hErrorBars*[F:SomeFloat](x,y,e1,e2:seq[F]) =
  ##[
  Draw a standard horizontal error bar graph.

  Parameters:

  - n: The number of points
  - px: A pointer to the X coordinates
  - py: A pointer to the Y coordinates
  - e1: A pointer to the absolute values of the lower error bar data
  - e2: A pointer to the absolute values of the upper error bar data
  ]##
  gr_herrorbars(x.len.cint, 
      cast[ptr cdouble](x[0].unsafeAddr), cast[ptr cdouble](y[0].unsafeAddr), 
      cast[ptr cdouble](e1[0].unsafeAddr), cast[ptr cdouble](e2[0].unsafeAddr) )


proc polymarker3d*[F:SomeFloat](x, y, z:seq[F]) =
  ##[
  Draw marker symbols centered at the given 3D data points.

  The values for x, y and z are in world coordinates. The attributes that control the appearance of a polymarker are marker type, marker size scale factor and color index.

  Parameters:

  - `n`: The number of points
  - `px`: A pointer to the X coordinates
  - `py`: A pointer to the Y coordinates
  - `pz`: A pointer to the Z coordinates
  ]##
  gr_polymarker3d(x.len.cint, 
     cast[ptr cdouble](x[0].unsafeAddr), 
     cast[ptr cdouble](y[0].unsafeAddr), 
     cast[ptr cdouble](z[0].unsafeAddr) )


proc title*(x_title, y_title, z_title:string) =
  ##[
  Display axis titles just outside of their respective axes.

  Parameters:

  - `x_title`: The text to be displayed on the X axis
  - `y_title`: The text to be displayed on the Y axis
  - `z_title`: The text to be displayed on the Z axis
  ]##
  gr_titles3d( x_title.cstring, y_title.cstring, z_title.cstring )


type
  SurfaceType* = enum
    stLINES = 0,         ## Use X Y polylines to denote the surface
    stMESH = 1,          ## Use a wire grid to denote the surface
    stFILLED_MESH = 2,   ## Applies an opaque grid to the surface
    stZ_SHADED_MESH = 3, ## Applies Z-value shading to the surface
    stCOLORED_MESH = 4,  ## Applies a colored grid to the surface
    stCELL_ARRAY = 5,    ## Applies a grid of individually-colored cells to the surface
    stSHADED_MESH = 6     ## Applies light source shading to the 3-D surface

proc surface*( x, y, z:seq[float], option:SurfaceType) =
  ##[
  Draw a three-dimensional surface plot for the given data points.

  `x` and `y` define a grid. z is a singly dimensioned array containing at least nx * ny data points. z describes the surface height at each point on the grid. Data is ordered as shown in the following table:

  Parameters:

  - `nx`: The number of points along the X axis
  - `ny`: The number of points along the Y axis
  - `px`: A pointer to the X coordinates
  - `py`: A pointer to the Y coordinates
  - `pz`: A pointer to the Z coordinates
  - `option`: Surface display option (see table)

  To see option 2 correctly change linecolorind or fillcolorind. Both default values are black.
  ]##
  gr_surface( x.len.cint, y.len.cint, 
              cast[ptr cdouble](x[0].unsafeAddr), cast[ptr cdouble](y[0].unsafeAddr), 
              cast[ptr cdouble](z[0].unsafeAddr),
              option.cint )


proc contour*( x, y, z, h:seq[float], major_h:int) =
  ##[
  Draw contours of a three-dimensional data set whose values are specified over a rectangular mesh. Contour lines may optionally be labeled.

  Parameters
  
  - `nx`: The number of points along the X axis
  - `ny`: The number of points along the Y axis
  - `nh`: The number of height values
  - `px`: A pointer to the X coordinates
  - `py`: A pointer to the Y coordinates
  - `h`: A pointer to the height values
  - `pz`: A pointer to the Z coordinates
  - `major_h`: Directs GR to label contour lines. For example, a value of 3 would label every third line. A value of 1 will label every line. A value of 0 produces no labels. To produce colored contour lines, add an offset of 1000 to major_h
  ]##
  gr_contour( x.len.cint, y.len.cint, h.len.cint, 
              cast[ptr cdouble](x[0].unsafeAddr), 
              cast[ptr cdouble](y[0].unsafeAddr), 
              cast[ptr cdouble](h[0].unsafeAddr), 
              cast[ptr cdouble](z[0].unsafeAddr), 
              major_h.cint )


proc contourf*( x, y, z, h:seq[float], major_h:int ) =
  ##[
  Draw filled contour plot of a three-dimensional data set whose values are specified over a rectangular mesh.

  Parameters:

  - `nx: The number of points along the X axis
  - `ny: The number of points along the Y axis
  - `nh: The number of height values. 0 for default contours.
  - `px: A pointer to the X coordinates
  - `py: A pointer to the Y coordinates
  - `h: A pointer to the height values. If NULL, use nh evenly distributed height values between minimum and maximum Z value.
  - `pz: A pointer to the Z coordinates
  - `major_h: Directs GR to label contour lines. For example, a value of 3 would label every third line. A value of 1 will label every line. A value of 0 produces no labels. To produce colored contour lines, add an offset of 1000 to major_h
  ]##
  gr_contourf( x.len.cint, y.len.cint, h.len.cint, 
               cast[ptr cdouble](x[0].unsafeAddr), 
               cast[ptr cdouble](y[0].unsafeAddr), 
               cast[ptr cdouble](h[0].unsafeAddr), 
               cast[ptr cdouble](z[0].unsafeAddr),                
               major_h.cint ) 


proc tricontour*(x, y, z, levels:seq[float]) =
  ##[
  Draw a contour plot for the given triangle mesh.

  Parameters:

  - `npoints`: The number of points
  - `x`: A pointer to the X coordinates
  - `y`: A pointer to the Y coordinates
  - `z`: A pointer to the Z coordinates
  - `nlevels`: The number of contour levels
  - `levels`: A pointer to the contour levels
  ]##
  gr_tricontour( x.len.cint, 
                 cast[ptr cdouble](x[0].unsafeAddr),
                 cast[ptr cdouble](y[0].unsafeAddr),
                 cast[ptr cdouble](z[0].unsafeAddr),
                 levels.len.cint,
                 cast[ptr cdouble](levels[0].unsafeAddr ) )

proc hexbin*(x,y:seq[float], n:int) =
  ##[
  TBD
  ]##
  let tmp = gr_hexbin( x.len.cint,
                       cast[ptr cdouble](x[0].unsafeAddr),
                       cast[ptr cdouble](y[0].unsafeAddr),  
                       n.cint)




type
  ColorMap = enum
    cmUniform      = 0,
    cmTemperature  = 1,
    cmGrayscale    = 2,
    cmGlowing      = 3,
    cmRainbowlike  = 4,
    cmGeologic     = 5,
    cmGreenscale   = 6,
    cmCyanscale    = 7,
    cmBluescale    = 8,
    cmMagentascale = 9,
    cmRedscale     = 10,
    cmFlame        = 11,
    cmBrownscale   = 12,
    cmPilatus      = 13,
    cmAutumn       = 14,
    cmBone         = 15,
    cmCool         = 16,
    cmCopper       = 17,
    cmGray         = 18,
    cmHot          = 19,
    cmHsv          = 20,
    cmJet          = 21,
    cmPink         = 22,
    cmSpectral     = 23,
    cmSpring       = 24,
    cmSummer       = 25,
    cmWinter       = 26,
    cmGist_Earth   = 27,
    cmGist_Heat    = 28,
    cmGist_Ncar    = 29,
    cmGist_Rainbow = 30,
    cmGist_Stern   = 31,
    cmAfmhot       = 32,
    cmBrg          = 33,
    cmBwr          = 34,
    cmCoolwarm     = 35,
    cmCmrmap       = 36,
    cmCubehelix    = 37,
    cmGnuplot      = 38,
    cmGnuplot2     = 39,
    cmOcean        = 40,
    cmRainbow      = 41,
    cmSeismic      = 42,
    cmTerrain      = 43,
    cmViridis      = 44,
    cmInferno      = 45,
    cmPlasma       = 46,
    cmMagma        = 47


proc setColorMap*(index:ColorMap) =
  ##[
  Set the currently used colormap.

  A list of colormaps can be found at:

  https://gr-framework.org/colormaps.html
  
  Parameters:

  - index: Colormap index

  Using a negative index will use the reverse of the selected colormap.
  ]##
  gr_setcolormap( index.cint )


proc getColorMap*():int =
  var index:cint
  gr_inqcolormap(index.unsafeAddr)
  return index.int


proc setColorMapFromRGB*( r ,g ,b, x:seq[float] ) =
  ##[
  Define a colormap by a list of RGB colors.

  This function defines a colormap using the n given color intensities. If less than 256 colors are provided the colors intensities are linear interpolated. If x is NULL the given color values are evenly distributed in the colormap. Otherwise the normalized value of x defines the position of the color in the colormap.

  Parameters:

  - `n`: The number of colors
  - `r`: A pointer to the red intensities in range 0.0 to 1.0
  - `g`: A pointer to the green intensities in range 0.0 to 1.0
  - `b`: A pointer to the blue intensities in range 0.0 to 1.0
  - `x`: A pointer to the positions of the corresponding color in the resulting colormap or NULL. The values of x must increase monotonically from 0.0 to 1.0. If x is NULL the given colors are evenly distributed in the colormap.
  ]##
  gr_setcolormapfromrgb( r.len.cint, 
                         cast[ptr cdouble](r[0].unsafeAddr),
                         cast[ptr cdouble](g[0].unsafeAddr),
                         cast[ptr cdouble](b[0].unsafeAddr),
                         cast[ptr cdouble](x[0].unsafeAddr) ) 
 

proc colorbar*() =
  ##[
  TBD
  ]##
  gr_colorbar()


proc getColor(n:int):int =
  ##[
  TBD
  ]##  
  var tmp:cint
  gr_inqcolor( n.cint, tmp.unsafeAddr)
  return tmp.int


proc getColorFromRGB*( r,g,b:float ):Color =
  let tmp = gr_inqcolorfromrgb(r.cdouble, g.cdouble, b.cdouble)
  return tmp.getColor


proc hsv2rgb(h,s,v:float):tuple[r:float, g:float, b:float] =
  var r,g,b:cdouble
  gr_hsvtorgb( h.cdouble, s.cdouble, v.cdouble, 
              r.unsafeAddr, g.unsafeAddr, b.unsafeAddr) 
  return (r.float, g.float, b.float)

#[




]#

proc validateRange*[F:SomeFloat](a,b:F):int =
  ##[
  TBC
  ]##
  let tmp = gr_validaterange(a.cdouble, b.cdouble)
  return tmp.int


proc adjustLimits*():tuple[a:float, b:float] = 
  ##[
  TBC
  ]##  
  var a,b:cdouble
  gr_adjustlimits(a.unsafeAddr, b.unsafeAddr)
  return (a.float, b.float)


proc adjustRange*():tuple[a:float, b:float] = 
  ##[
  TBC
  ]##  
  var a,b:cdouble
  gr_adjustrange(a.unsafeAddr, b.unsafeAddr)
  return (a.float, b.float)





proc beginPrint*( pathname: string ) =
  ##[
  Open and activate a print device.

  This function opens an additional graphics output device. The device type is obtained from the given file extension. The following file types are supported:

  Parameters
  
  - `pathname`: Filename for the print device.

  The following file types are supported:

  .ps, .eps	PostScript
  .pdf	Portable Document Format
  .bmp	Windows Bitmap (BMP)
  .jpeg, .jpg	JPEG image file
  .png	Portable Network Graphics file (PNG)
  .tiff, .tif	Tagged Image File Format (TIFF)
  .svg	Scalable Vector Graphics
  .wmf	Windows Metafile
  .mp4	MPEG-4 video file
  .webm	WebM video file
  .ogg	Ogg video file
  ]##
  gr_beginprint( pathname.cstring )


proc beginPrintText( pathname, mode, format, orientation:string ) = 
  ##[
  Open and activate a print device with the given layout attributes.

  The available formats are:

  A4	0.210 x 0.297
  B5	0.176 x 0.250
  Letter	0.216 x 0.279
  Legal	0.216 x 0.356
  Executive	0.191 x 0.254
  A0	0.841 x 1.189
  A1	0.594 x 0.841
  A2	0.420 x 0.594
  A3	0.297 x 0.420
  A5	0.148 x 0.210
  A6	0.105 x 0.148
  A7	0.074 x 0.105
  A8	0.052 x 0.074
  A9	0.037 x 0.052
  B0	1.000 x 1.414
  B1	0.500 x 0.707
  B10	0.031 x 0.044
  B2	0.500 x 0.707
  B3	0.353 x 0.500
  B4	0.250 x 0.353
  B6	0.125 x 0.176
  B7	0.088 x 0.125
  B8	0.062 x 0.088
  B9	0.044 x 0.062
  C5E	0.163 x 0.229
  Comm10E	0.105 x 0.241
  DLE	0.110 x 0.220
  Folio	0.210 x 0.330
  Ledger	0.432 x 0.279
  Tabloid	0.279 x 0.432

  Parameters:

  - `pathname`: Filename for the print device.
  - `mode`: Output mode (Color, GrayScale)
  - `format`: Output format (see table)
  - `orientation`: Page orientation (Landscape, Portait)
  ]##
  gr_beginprintext(pathname.cstring, mode.cstring, format.cstring, orientation.cstring)


proc endPrint() =
  ##[
  TBC
  ]##
  gr_endprint()






proc ndc2wc*():tuple[a:float, b:float] =
  ##[
  TBC
  ]##  
  var a,b:cdouble
  gr_ndctowc(a.unsafeAddr, b.unsafeAddr)
  return (a.float, b.float)

proc wc2ndc*():tuple[a:float, b:float] =
  ##[
  TBC
  ]##  
  var a,b:cdouble
  gr_wctondc(a.unsafeAddr, b.unsafeAddr)
  return (a.float, b.float)


proc wc32wc*():tuple[a:float, b:float, c:float] =
  ##[
  TBC
  ]##  
  var a,b,c:cdouble
  gr_wc3towc(a.unsafeAddr, b.unsafeAddr, c.unsafeAddr)
  return (a.float, b.float, c.float)




proc drawRect*[F:SomeFloat](xmin,xmax,ymin,ymax:F) =
  ##[
  Draw a rectangle using the current line attributes.

  Parameters:

  - `xmin`: Left edge of the rectangle
  - `xmax`: Right edge of the rectangle
  - `ymin`: Bottom edge of the rectangle
  - `ymax`: Upper edge of the rectangle
  ]##
  gr_drawrect(xmin.cdouble,xmax.cdouble,ymin.cdouble,ymax.cdouble)


proc fillRect*[F:SomeFloat](xmin,xmax,ymin,ymax:F) =
  ##[
  Draw a filled rectangle using the current fill attributes.

  Parameters:

  - `xmin`: Left edge of the rectangle
  - `xmax`: Right edge of the rectangle
  - `ymin`: Bottom edge of the rectangle
  - `ymax`: Upper edge of the rectangle
  ]##
  gr_fillrect(xmin.cdouble,xmax.cdouble,ymin.cdouble,ymax.cdouble)

#[
proc fillRect*[F:SomeFloat](xmin,xmax,ymin,ymax:F) =
  ##[
  Draw a filled rectangle using the current fill attributes.

  Parameters:

  - `xmin`: Left edge of the rectangle
  - `xmax`: Right edge of the rectangle
  - `ymin`: Bottom edge of the rectangle
  - `ymax`: Upper edge of the rectangle
  ]##
  gr_fillrect(xmin.cdouble,xmax.cdouble,ymin.cdouble,ymax.cdouble)
]#

proc drawArc*[F:SomeFloat](xmin,xmax,ymin,ymax,a1,a2:F) =
  ##[
  Draw a circular or elliptical arc covering the specified rectangle.

  The resulting arc begins at a1 and ends at a2 degrees. Angles are interpreted such that 0 degrees is at the 3 o’clock position. The center of the arc is the center of the given rectangle.

  Parameters:

  - `xmin`: Left edge of the rectangle
  - `xmax`: Right edge of the rectangle
  - `ymin`: Bottom edge of the rectangle
  - `ymax`: Upper edge of the rectangle
  - `a1`: The start angle
  - `a2`: The end angle
  ]##
  gr_drawarc( xmin.cdouble,xmax.cdouble,ymin.cdouble,ymax.cdouble,
              a1.cdouble, a2.cdouble )


proc fillArc*[F:SomeFloat](xmin,xmax,ymin,ymax,a1,a2:F) =
  ##[
  Fill a circular or elliptical arc covering the specified rectangle.

  The resulting arc begins at a1 and ends at a2 degrees. Angles are interpreted such that 0 degrees is at the 3 o’clock position. The center of the arc is the center of the given rectangle.

  Parameters:

  - `xmin`: Left edge of the rectangle
  - `xmax`: Right edge of the rectangle
  - `ymin`: Bottom edge of the rectangle
  - `ymax`: Upper edge of the rectangle
  - `a1`: The start angle
  - `a2`: The end angle
  ]##
  gr_fillarc( xmin.cdouble,xmax.cdouble,ymin.cdouble,ymax.cdouble,
              a1.cdouble, a2.cdouble )


#[
  vertex_t* {.bycopy.} = object
    x*: cdouble
    y*: cdouble  
]#

proc drawPath*(x,y:seq[float], codes:string, fill:int) =
  ##[
  Draw simple and compound outlines consisting of line segments and bezier curves.

  The following path codes are recognized:

  STOP	end the entire path
  MOVETO	move to the given vertex
  LINETO	draw a line from the current position to the given vertex
  CURVE3	draw a quadratic Bezier curve
  CURVE4	draw a cubic Bezier curve
  CLOSEPOLY	draw a line segment to the start point of the current path
  
  Parameters
  
  - `n`: The number of vertices
  - `vertices`: A pointer to the vertices
  - `codes`: A pointer to the path codes
  - `fill`: A flag indication whether resulting path is to be filled or not
  ]##
  var tmp = newSeq[vertex_t](x.len)
  for i in 0..<x.len:
    var v:vertex_t
    v.x = x[i].cdouble
    v.y = y[i].cdouble
    tmp &= v

  gr_drawpath( x.len.cint, cast[ptr vertex_t](tmp[0].unsafeAddr), 
               cast[ptr cuchar](codes.unsafeAddr), fill.cint )



type
  ArrowStyle* = enum
    asSimple               = 1 , ##	simple           , single-ended
    asAcute                = 2 , ##	simple           , single-ended, acute head
    asHollow               = 3 , ## hollow           , single-ended
    asFilled               = 4 , ## filled           , single-ended
    asTriangle             = 5   ## triangle         , single-ended
    asTriangleFilled       = 6 , ## filled   triangle, single-ended
    asKite                 = 7 , ## kite             , single-ended
    asKiteFilled           = 8 , ## filled   kite    , single-ended
    asDouble               = 9 , ## simple           , double-ended
    asDoubleAcute          = 10, ## simple           , double-ended, acute head
    asDoubleHollow         = 11, ## hollow           , double-ended
    asDoubleFilled         = 12, ## filled           , double-ended
    asDoubleTriangle       = 13, ## triangle         , double-ended
    asDoubleTriangleFilled = 14  ## filled   triangle, double-ended
    asDoubleKite           = 15, ## kite             , double-ended
    asDoubleKiteFilled     = 16, ## filled   kite    , double-ended
    asDoubleLine           = 17, ## double   line    , single-ended
    asDoubleLineDouble     = 18  ## double   line    , double-ended

proc setArrowStyle*(style:ArrowStyle) =
  ##[
  Set the arrow style to be used for subsequent arrow commands.

  This function defines the arrow style for subsequent arrow primitives. The default arrow style is 1.

  Parameters
  
  - `style`: The arrow style to be used

  ]##
  gr_setarrowstyle( style.cint )


proc setArrowSize*[F:SomeFloat](size:F) =
  ##[
  Set the arrow size to be used for subsequent arrow commands.

  This function defines the arrow size for subsequent arrow primitives. The default arrow size is 1.

  Parameters:

  - `size`: The arrow size to be used
  ]##
  gr_setarrowsize( size.cdouble )

proc drawArrow*[F:SomeFloat](x1,y1,x2,y2:F) =
  ##[
  Draw an arrow between two points.

  Different arrow styles (angles between arrow tail and wing, optionally filled heads, double headed arrows) are available and can be set with the gr_setarrowstyle function.

  Parameters:

  - `x1`: The X coordinate of the arrow start point (tail)
  - `y1`: The Y coordinate of the arrow start point (tail)
  - `x2`: The X coordinate of the arrow end point (head)
  - `y2`: The Y coordinate of the arrow end point (head)
  ]##
  gr_drawarrow(x1.cdouble, y1.cdouble, x2.cdouble, y2.cdouble )


type
  Image* = object
    width:int
    height:int
    data:pointer

proc readImage*(pathname:string):Image = 
  var width, height: cint
  var pimage:pointer
  let tmp = gr_readimage( pathname.cstring, 
                width.unsafeAddr, 
                height.unsafeAddr, 
                cast[ptr ptr cint](pimage) )
  return Image(width:width.int, height:height.int, data:pimage)


type
  ImageModel = enum
    imRGB = 0,
    imHSV = 1


proc drawImage(im:Image, xmin,xmax,ymin,ymax:float, model:ImageModel) =
  ##[
  Draw an image into a given rectangular area.

  The points (xmin, ymin) and (xmax, ymax) are world coordinates defining diagonally opposite corner points of a rectangle. This rectangle is divided into width by height cells. The two-dimensional array data specifies colors for each cell.
 
  Parameters:

  - `xmin`: X coordinate of the lower left point of the rectangle
  - `ymin`: Y coordinate of the lower left point of the rectangle
  - `xmax`: X coordinate of the upper right point of the rectangle
  - `ymax`: Y coordinate of the upper right point of the rectangle
  - `width`: X dimension of the color index array
  - `height`: Y dimension of the color index array
  - `data`: color array
  - `model`: color model
  ]##
  gr_drawimage( xmin.cdouble, xmax.cdouble, ymin.cdouble, ymax.cdouble, 
                im.width.cint, im.height.cint, cast[ptr cint](im.data.unsafeAddr), 
                model.cint )


#[


]#

proc setShadow*[F:SomeFloat](offsetx, offsety, blur:F) =
  ##[
  Allows drawing of shadows, realized by images painted underneath, and offset from, graphics objects such that the shadow mimics the effect of a light source cast on the graphics objects.

  Parameters:

  - `offsetx`: An x-offset, which specifies how far in the horizontal direction the shadow is offset from the object
  - `offsety`: A y-offset, which specifies how far in the vertical direction the shadow is offset from the object
  - `blur`: A blur value, which specifies whether the object has a hard or a diffuse edge
  ]##
  gr_setshadow( offsetx.cdouble, offsety.cdouble, blur.cdouble )


proc setTransparency*[F:SomeFloat](alpha:F) =
  ##[
  Set the value of the alpha component associated with GR colors.

  Parameters:

  - `alpha`: An alpha value (0.0 - 1.0)
  ]##
  gr_settransparency( alpha.cdouble)


proc beginGraphics*(path:string) =
  #[
  Open a file for graphics output.

  gr_begingraphics allows to write all graphics output into a XML-formatted file until the gr_endgraphics functions is called. The resulting file may later be imported with the gr_importgraphics function.

  Parameters:

  - `path`: Filename for the graphics file.    
  ]#
  gr_begingraphics(path.cstring)


proc importGraphics*(a:string) =
  #[
  TBD   
  ]#
  let tmp = gr_importgraphics(a.cstring)


proc endGraphics*() =
  #[
  TBD   
  ]#
  gr_endgraphics()

proc getGraphics*():string =
  #[
  TBD   
  ]#
  let tmp = gr_getgraphics()
  return $tmp

proc drawGraphics*(a:string) =
  #[
  TBD   
  ]#
  let tmp = gr_drawgraphics(a.cstring)


proc mathTex*(x,y:float, str:string) =
  ##[
  Generate a character string starting at the given location. Strings can be defined to create mathematical symbols and Greek letters using LaTeX syntax.

  Parameters:

  - `x`: The X coordinate of the starting position of the text string
  - `y`: The Y coordinate of the starting position of the text string
  - `string`: The text string to be drawn
  ]##
  gr_mathtex(x.cdouble, y.cdouble, str.cstring)


proc getMathTex*(x,y:float, str:string):tuple[xx:float,yy:float] =
  ##[

  ]##
  var xx,yy:cdouble
  gr_inqmathtex(x.cdouble, y.cdouble, str.cstring, 
                cast[ptr cdouble](xx.unsafeAddr), 
                cast[ptr cdouble](yy.unsafeAddr) )
  return (xx.float, yy.float)
        

proc beginSelection*(a,b:int) =
  gr_beginselection( a.cint, b.cint )


proc endSelection*() =
  gr_endselection( )


proc moveSelection*(a,b:float) =
  gr_moveselection( a.cdouble, b.cdouble )


proc resizeSelection*(a:int, b,c:float) =
  gr_resizeselection( a.cint, b.cdouble, c.cdouble )


proc getBbox*():tuple[a:float, b:float, c:float, d:float] =
  var a,b,c,d:cdouble
  gr_inqbbox( cast[ptr cdouble](a.unsafeAddr),
              cast[ptr cdouble](b.unsafeAddr),
              cast[ptr cdouble](c.unsafeAddr),
              cast[ptr cdouble](d.unsafeAddr)
              )
  return (a.float, b.float, c.float, d.float)

proc precision*():float =
  let tmp = gr_precision()
  return tmp.float
  

proc setRegenFlags*(a:int) =
  gr_setregenflags(a.cint)


proc getRegenFlags*():int =
  let tmp = gr_inqregenflags()
  return tmp.int


proc saveState*() =
  gr_savestate()

proc restoreState*() =
  gr_restorestate()


proc selectContext*(a:int) =
  gr_selectcontext(a.cint) 


proc destroyContext*(a:int) =
  gr_destroycontext(a.cint)


proc useLineSpec(a:string):int =
  gr_uselinespec(a.cstring).cint


#proc delaunay*(x,y:seq[float], )
#  gr_delaunay(a1: cint, a2: ptr cdouble, a3: ptr cdouble, a4: ptr cint, a5: ptr ptr cint)

proc reducePoints(x,y:seq[float], points:int):tuple[xx:seq[float], yy:seq[float]] =
  ##[
  Reduces the number of points of the x and y array.

  Parameters:

  - `n`: the number of points of the x and y arrays
  - `x`: the x value array
  - `y`: the y value array
  - `points`: the requested number of points
  - `x_array`: the return array for the x values
  - `y_array`: the return array for the y values    
  ]##
  var xx,yy:seq[float]
  gr_reducepoints( x.len.cint, 
                   cast[ptr cdouble](x[0].unsafeAddr), 
                   cast[ptr cdouble](y[0].unsafeAddr), 
                   points.cint, 
                   cast[ptr cdouble](xx[0].unsafeAddr), 
                   cast[ptr cdouble](yy[0].unsafeAddr) ) 
  return (xx, yy)



proc trisurface*(x,y,z:seq[float]) = 
  ##[
  Draw a triangular surface plot for the given data points.

  Parameters:

  - `n`: The number of points
  - `px`: A pointer to the X coordinates
  - `py`: A pointer to the Y coordinates
  - `pz`: A pointer to the Z coordinates
  ]##
  gr_trisurface( x.len.cint, 
                 cast[ptr cdouble](x[0].unsafeAddr), 
                 cast[ptr cdouble](y[0].unsafeAddr), 
                 cast[ptr cdouble](z[0].unsafeAddr) ) 
 

proc gradient*( n,m:int, a,b,c,d,e:float ) =
  gr_gradient( n.cint, m.cint, 
               a.unsafeAddr, b.unsafeAddr, c.unsafeAddr, d.unsafeAddr, e.unsafeAddr )                                  



proc quiver*( n,m:int, a,b,c,d:float, e:int ) =
  gr_quiver( n.cint, m.cint, 
             a.unsafeAddr, b.unsafeAddr, c.unsafeAddr, d.unsafeAddr,  
             e.cint )

type
  InterpMethod = enum
    imNearest = 0,  ## Nearest neighbour interpolation
    imLinear = 1,   ## Linear interpolation
    imSpline = 2,   ## Interpolation using natural cubic splines
    imCubic = 3     ## Cubic interpolation



proc interp2*( x, y, z: seq[float], nxq,nyq:int, `method`:InterpMethod, extrapval:float) =
  ##[
  Interpolation in two dimensions using one of four different methods. The input points are located on a grid, described by nx, ny, x, y and z. The target grid ist described by nxq, nyq, xq and yq and the output is written to zq as a field of nxq * nyq values.

  The available methods for interpolation are the following:

  INTERP2_NEAREST	0	Nearest neighbour interpolation
  INTERP2_LINEAR	1	Linear interpolation
  INTERP_2_SPLINE	2	Interpolation using natural cubic splines
  INTERP2_CUBIC	3	Cubic interpolation

  Parameters

  - `nx`: The number of the input grid’s x-values
  - `ny`: The number of the input grid’s y-values
  - `x`: Pointer to the input grid’s x-values
  - `y`: Pointer to the input grid’s y-values
  - `z`: Pointer to the input grid’s z-values (num. of values: nx * ny)
  - `nxq`: The number of the target grid’s x-values
  - `nyq`: The number of the target grid’s y-values
  - `xq`: Pointer to the target grid’s x-values
  - `yq`: Pointer to the target grid’s y-values
  - `zq`: Pointer to the target grids’s z-values, used for output
  - `method`: Used method for interpolation
  - `extrapval`: The extrapolation value
  ]##
  var xq = newSeq[float](nxq)
  var yq = newSeq[float](nyq)
  var zq = newSeq[float](nxq * nyq)

  gr_interp2( x.len.cint, y.len.cint, 
              cast[ptr cdouble](x[0].unsafeAddr), 
              cast[ptr cdouble](y[0].unsafeAddr),
              cast[ptr cdouble](z[0].unsafeAddr), 
              nxq.cint, nyq.cint, 
              cast[ptr cdouble](xq[0].unsafeAddr), 
              cast[ptr cdouble](yq[0].unsafeAddr),
              cast[ptr cdouble](zq[0].unsafeAddr),
              `method`.cint, extrapval.cdouble )


proc version*():string = 
  ##[
  Returns the version string of the GR runtime.

  Return:

  A pointer to the GR runtime version string.
  ]##
  let tmp = gr_version()
  return $tmp


#[




]#

#proc shade*() =
#  gr_shade(a1: cint, a2: ptr cdouble, a3: ptr cdouble, a4: cint, a5: cint, a6: ptr cdouble, a7: cint, a8: cint, a9: ptr cint)

type
  Xform* = enum
    ## The available transformation types are:
    xBoolean   = 0, ## boolean
    xLinear    = 1, ## linear
    xLog       = 2, ## logarithmic
    xLogLog    = 3, ## double logarithmic
    xCubic     = 4, ## cubic
    xEqualized = 5  ## histogram equalized



proc shadePoints( x,y:seq[float], xform:Xform, width,height:int) =
  ##[
  Display a point set as a aggregated and rasterized image.

  The values for x and y are in world coordinates.

  Parameters:

  - `n`: The number of points
  - `x`: A pointer to the X coordinates
  - `y`: A pointer to the Y coordinates
  - `xform`: The transformation type used for color mapping
  - `w`: The width of the grid used for rasterization
  - `h`: The height of the grid used for rasterization

  ]##
  gr_shadepoints(x.len.cint, 
                 cast[ptr cdouble](x[0].unsafeAddr), 
                 cast[ptr cdouble](y[0].unsafeAddr), 
                 xform.cint, width.cint, height.cint )


proc shadeLines( x,y:seq[float], xform:Xform, width,height:int) =
  ##[
  Display a line set as a aggregated and rasterized image.

  The values for x and y are in world coordinates. NaN values can be used to separate the point set into line segments.

  Parameters:

  - `n`: The number of points
  - `x`: A pointer to the X coordinates
  - `y`: A pointer to the Y coordinates
  - `xform`: The transformation type used for color mapping
  - `w`: The width of the grid used for rasterization
  - `h`: The height of the grid used for rasterization

  ]##
  gr_shadelines(x.len.cint, 
                 cast[ptr cdouble](x[0].unsafeAddr), 
                 cast[ptr cdouble](y[0].unsafeAddr), 
                 xform.cint, width.cint, height.cint )


#proc panZoom(a1,a2,a3,a4) =
#  gr_panzoom(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble, a5: ptr cdouble, a6: ptr cdouble, a7: ptr cdouble, a8: ptr cdouble)


type
  ResampleMethod = enum
    rmDefault = 0x00000000, ## default
    rmNearest = 0x01010101, ## nearest neighbour
    rmLinear  = 0x02020202, ## Linear
    rmLanczos = 0x03030303 ## Lanczos
#[ TODO: more intelligent management of flags
Alternatively, combinations of these methods can be selected for horizontal or vertical upsampling or downsampling:

GKS_K_UPSAMPLE_VERTICAL_DEFAULT	0x00000000	default for vertical upsampling
GKS_K_UPSAMPLE_HORIZONTAL_DEFAULT	0x00000000	default for horizontal upsampling
GKS_K_DOWNSAMPLE_VERTICAL_DEFAULT	0x00000000	default for vertical downsampling
GKS_K_DOWNSAMPLE_HORIZONTAL_DEFAULT	0x00000000	default for horizontal downsampling
GKS_K_UPSAMPLE_VERTICAL_NEAREST	0x00000001	nearest neighbor for vertical upsampling
GKS_K_UPSAMPLE_HORIZONTAL_NEAREST	0x00000100	nearest neighbor for horizontal upsampling
GKS_K_DOWNSAMPLE_VERTICAL_NEAREST	0x00010000	nearest neighbor for vertical downsampling
GKS_K_DOWNSAMPLE_HORIZONTAL_NEAREST	0x01000000	nearest neighbor for horizontal downsampling
GKS_K_UPSAMPLE_VERTICAL_LINEAR	0x00000002	linear for vertical upsampling
GKS_K_UPSAMPLE_HORIZONTAL_LINEAR	0x00000200	linear for horizontal upsampling
GKS_K_DOWNSAMPLE_VERTICAL_LINEAR	0x00020000	linear for vertical downsampling
GKS_K_DOWNSAMPLE_HORIZONTAL_LINEAR	0x02000000	linear for horizontal downsampling
GKS_K_UPSAMPLE_VERTICAL_LANCZOS	0x00000003	lanczos for vertical upsampling
GKS_K_UPSAMPLE_HORIZONTAL_LANCZOS	0x00000300	lanczos for horizontal upsampling
GKS_K_DOWNSAMPLE_VERTICAL_LANCZOS	0x00030000	lanczos for vertical downsampling
GKS_K_DOWNSAMPLE_HORIZONTAL_LANCZOS	0x03000000	lanczos for horizontal downsampling  
]#

proc setResampleMethod*( flag:ResampleMethod ) =
  ##[
  Set the resample method for resampling.

  The available options are:

  Parameters:
  
  - `flag`: Resample method
  ]##
  gr_setresamplemethod(flag.cuint)

proc getResampleMethod*():ResampleMethod =
  ##[
  Inquire the resample flag status.

  Return
  
  Resample flag    
  ]##
  var flag:cuint
  gr_inqresamplemethod(flag.unsafeAddr)
  return flag.ResampleMethod





proc path*(x,y:seq[float],code:string) =
  ##[
  Draw paths using given vertices and path codes.

  The values for x and y are in world coordinates. n is the number of vertices to use. The codes describe several patch primitives that can be used to create compound paths.

  Parameters:

  - `n`: The number of points
  - `x`: A pointer to the X coordinates
  - `y`: A pointer to the Y coordinates
  - `codes`: Path codes as a null-terminated string

  https://gr-framework.org/c-gr.html#_CPPv47gr_pathiPdPdPKc
  ]##

  gr_path(x.len.cint, 
          cast[ptr cdouble](x[0].unsafeAddr), 
          cast[ptr cdouble](y[0].unsafeAddr),
          code.cstring)


#[



(a1: cint)
gr_inqbordercolorind(a1: ptr cint)  
]#
proc serBorderWidth*[F:SomeFloat](width:float) =
  ##[
  Define the border width of subsequent path output primitives.

  Parameters:
  
  - `width`: The border width scale factor
  ]##
  gr_setborderwidth(width.cdouble)


proc getBorderWidth():float =
  ##[

  ]##
  var tmp:cdouble
  gr_inqborderwidth(tmp.unsafeAddr)
  return tmp.float

proc serBorderColor*[F:SomeFloat](color:Color) =
  ##[
  Define the border color of subsequent path output primitives.

  Parameters:

  - `color`: The border color index (COLOR < 1256)
  ]##
  gr_setbordercolorind(color.cint)


proc getBorderColor():Color =
  ##[
  TBC
  ]##
  var tmp:cint
  gr_inqbordercolorind(tmp.unsafeAddr)
  return tmp.Color



type
  ProjectionType = enum
    ptDefault     = 0, ## default
    ptOrtographic = 1, ## orthographic
    ptPerspective = 2  ## perspective


proc setProjectionType*(flag:ProjectionType) =
  ##[
  Set the projection type with this flag.

  The available options are:

  Parameters:

  - `flag`: projection type
  ]##
  gr_setprojectiontype( flag.cint )

proc getProjectionType*():ProjectionType =
  var tmp:cint
  gr_inqprojectiontype( tmp.unsafeAddr)
  return tmp.ProjectionType



proc setPerspectiveProjection*[F:SomeFloat]( near_plane, far_plane, fov:F) =
  ##[
  Set the far and near clipping plane for perspective projection and the vertical field ov view

  Switches projection type to perspective

  Parameters:

  - `near_plane`: distance to near clipping plane
  - `far_plane`: distance to far clipping plane
  - `fov`: vertical field of view, input must be between 0 and 180 degrees
  ]##
  gr_setperspectiveprojection(near_plane.cdouble, far_plane.cdouble, fov.cdouble)

proc getPerspectiveProjection*():tuple[near_plane:float, far_plane:float, fov:float] =
  var near_plane, far_plane, fov:cdouble
  gr_inqperspectiveprojection( near_plane.unsafeAddr, far_plane.unsafeAddr, fov.unsafeAddr )
  return (near_plane.float, far_plane.float, fov.float)

proc setTransformationParameters*[F:SomeFloat](camera_pos_x, camera_pos_y, camera_pos_z, 
                                  up_x, up_y, up_z, 
                                  focus_point_x, focus_point_y, focus_point_z:F) =
  ##[
  Method to set the camera position, the upward facing direction and the focus point of the shown volume

  Parameters:

  - `camera_pos_x`: x component of the cameraposition in world coordinates
  - `camera_pos_y`: y component of the cameraposition in world coordinates
  - `camera_pos_z`: z component of the cameraposition in world coordinates
  - `up_x`: x component of the up vector
  - `up_y`: y component of the up vector
  - `up_z`: z component of the up vector
  - `focus_point_x`: x component of focus-point inside volume
  - `focus_point_y`: y component of focus-point inside volume
  - `focus_point_z`: z component of focus-point inside volume
  ]##
  gr_settransformationparameters( camera_pos_x.cdouble, camera_pos_y.cdouble, camera_pos_z.cdouble, 
                                  up_x.cdouble, up_y.cdouble, up_z.cdouble, 
                                  focus_point_x.cdouble, focus_point_y.cdouble, focus_point_z.cdouble )
                          
 
proc getTransformationParameters*():tuple[camera_pos_x:float, camera_pos_y:float, camera_pos_z:float, 
                                  up_x:float, up_y:float, up_z:float, 
                                  focus_point_x:float, focus_point_y:float, focus_point_z:float] =
  var camera_pos_x, camera_pos_y, camera_pos_z, up_x, up_y, up_z, focus_point_x, focus_point_y, focus_point_z:cdouble
  gr_inqtransformationparameters( camera_pos_x.unsafeAddr, camera_pos_y.unsafeAddr, camera_pos_z.unsafeAddr,
                                  up_x.unsafeAddr, up_y.unsafeAddr, up_z.unsafeAddr, 
                                  focus_point_x.unsafeAddr, focus_point_y.unsafeAddr, focus_point_z.unsafeAddr )
  return ( camera_pos_x.float, camera_pos_y.float, camera_pos_z.float,
           up_x.float, up_y.float, up_z.float, 
           focus_point_x.float, focus_point_y.float, focus_point_z.float )



proc setOrthographicProjection*[F:SomeFloat](left, right, bottom, top, near_plane, far_plane:F) =
  ##[
  Set parameters for orthographic transformation

  Switches projection type to orthographic

  Parameters:

  - `left: xmin of the volume in worldcoordinates
  - `right: xmax of volume in worldcoordinates
  - `bottom: ymin of volume in worldcoordinates
  - `top: ymax of volume in worldcoordinates
  - `near_plane: distance to near clipping plane
  - `far_plane: distance to far clipping plane
  ]##
  gr_setorthographicprojection( left.cdouble, right.cdouble, bottom,cdouble, top.cdouble,
                                near_plane.cdouble, far_plane.cdouble )

proc getOrthographicProjection*():tuple[left:float, right:float, bottom:float, 
                                  top:float, near_plane:float, far_plane:float] =

  var left, right, bottom, top, near_plane, far_plane:cdouble
  gr_inqorthographicprojection( left.unsafeAddr, right.unsafeAddr, bottom.unsafeAddr,
                                  top.unsafeAddr, near_plane.unsafeAddr, far_plane.unsafeAddr)

  return (left.float, right.float, bottom.float, 
                                  top.float, near_plane.float, far_plane.float )



proc cameraInteraction*(start_mouse_pos_x, start_mouse_pos_y, end_mouse_pos_x, end_mouse_pos_y:float) =
  ##[
  Interface for interaction with the rotation of the model. For this a virtual Arcball is used.

  Parameters:

  - `start_mouse_pos_x`: x component of the start mouse position
  - `start_mouse_pos_y`: y component of the start mouse position
  - `end_mouse_pos_x`: x component of the end mouse position
  - `end_mouse_pos_y`: y component of the end mouse position
  ]##
  gr_camerainteraction(start_mouse_pos_x.cdouble, start_mouse_pos_y.cdouble, 
                       end_mouse_pos_x.cdouble, end_mouse_pos_y.cdouble )


proc getWindow3d():tuple[xmin:float, xmax:float, ymin:float, ymax:float, zmin:float, zmax:float] =
  var xmin, xmax, ymin, ymax, zmin, zmax:cdouble
  gr_inqwindow3d(xmin.unsafeAddr, xmax.unsafeAddr, ymin.unsafeAddr, ymax.unsafeAddr, zmin.unsafeAddr, zmax.unsafeAddr)
  return (xmin.float, xmax.float, ymin.float, ymax.float, zmin.float, zmax.float)

proc setScaleFactors3d*[F:SomeFloat](x_axis_scale, y_axis_scale, z_axis_scale:F) =
  ##[
  Set the scale factor for each axis. A one means no scale.

  All factor have to be != 0.

  Parameters:
  - `x_axis_scale`: factor for scaling the x-axis
  - `y_axis_scale`: factor for scaling the y-axis
  - `z_axis_scale`: factor for scaling the z-axis
  ]##
  
  gr_setscalefactors3d(x_axis_scale.cdouble, y_axis_scale.cdouble, z_axis_scale.cdouble)

proc getScaleFactors3d():tuple[x_axis_scale:float, y_axis_scale:float, z_axis_scale:float] =
  var x_axis_scale, y_axis_scale, z_axis_scale:cdouble
  gr_inqscalefactors3d(x_axis_scale.unsafeAddr, y_axis_scale.unsafeAddr, z_axis_scale.unsafeAddr)
  return (x_axis_scale.float, y_axis_scale.float, z_axis_scale.float)


proc transformationInterfaceForRepl*[F:SomeFloat](phi, theta, fov, radius:F) = 
  ##[
  This is an interface for REPL based languages to enable an easier way to rotate around an object. It can also be used, if the user prefers angles instead of the direct camera position, but just to mention, the sideeffect is that the functionality gets reduced.

  fov = 0 or fov = nan means orthographic projection radius = 0 or radius = nan uses the ball radius for the camera distance

  Parameters:

  - `phi`: phi angle of the spherical coordinates
  - `theta`: theta angle of the spherical coordinates
  - `fov`: vertical field of view
  - `radius`: camera distance to the focus middle point of the drawn objekt
  ]## 
  gr_transformationinterfaceforrepl(phi.cdouble, theta.cdouble, fov.cdouble, radius.cdouble)  
