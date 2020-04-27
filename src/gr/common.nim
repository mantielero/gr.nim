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



proc setWindow*[F:SomeFloat](xmin, xmax,ymin,ymax:F) =
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

proc setWindow*[F:SomeFloat](xmin, xmax, ymin, ymax, zmin, zmax:F) =
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

proc linRange*[F:SomeFloat](i, j:F, n:Natural ):seq[float] =
  let step = (j - i).float / (n ).float
  var tmp:seq[float]
  var val = i
  for k in 0..n:
    tmp &= val
    val += step
  return tmp


proc setViewport*[F:SomeFloat](xmin, xmax, ymin, ymax:F) =
  ##[
  Define the size of the workstation graphics window in meters. So `setWorkStationViewport(0.0,0.1,0.0,0.1)` will be a 10cm x 10cm window in both paper an the screen.

  Parameters:

  - `xmin`: The left horizontal coordinate of the workstation viewport.
  - `xmax`: The right horizontal coordinate of the workstation viewport.
  - `ymin`: The bottom vertical coordinate of the workstation viewport.
  - `ymax`: The top vertical coordinate of the workstation viewport.

  `setWorkStationViewport` places a workstation window on the display of the specified size in meters. This command allows the workstation window to be accurately sized for a display or hardcopy device, and is often useful for sizing graphs for desktop publishing applications.
  ]##
  gr_setviewport(xmin.cdouble, xmax.cdouble, ymin.cdouble, ymax.cdouble)

proc setWorkStationViewport*[F:SomeFloat](xmin, xmax, ymin, ymax:F) =
  ##[
  Define the size of the workstation graphics window in meters. So `setWorkStationViewport(0.0,0.1,0.0,0.1)` will be a 10cm x 10cm window in both paper an the screen.

  Parameters:

  - `xmin`: The left horizontal coordinate of the workstation viewport.
  - `xmax`: The right horizontal coordinate of the workstation viewport.
  - `ymin`: The bottom vertical coordinate of the workstation viewport.
  - `ymax`: The top vertical coordinate of the workstation viewport.

  `setWorkStationViewport` places a workstation window on the display of the specified size in meters. This command allows the workstation window to be accurately sized for a display or hardcopy device, and is often useful for sizing graphs for desktop publishing applications.
  ]##
  gr_setwsviewport(xmin.cdouble, xmax.cdouble, ymin.cdouble, ymax.cdouble)

proc getDSPsize*():tuple[mwidth:float, mheight:float, width:int, heigth:int] =
  ##[
  Returns the display size (in metric and pixel coordinates). For example::

     (0.5965, 0.3356, 2560, 1440) => 59.7 x 0.34 cm with a pixel resolution of 2560 x 1440
     
  - `mwidth`: display metric width
  - `mheight`: display metric height
  - `width`: display pixel width
  - `height`: display pixel height
  ]##
  var mwidth:cdouble
  var mheight:cdouble
  var width, height:cint
  gr_inqdspsize(mwidth.unsafeAddr, mheight.unsafeAddr, width.unsafeAddr, height.unsafeAddr)
  return (mwidth.float, mheight.float, width.int, height.int)

#proc setScreenSize

proc setWorkStationWindow*[F:SomeFloat](xmin, xmax,ymin,ymax:F) =
  ##[
  Set the area of the NDC viewport that is to be drawn in the workstation window.

  This function defines the rectangular area of the Normalized Device Coordinate space to be output to the device. By default, the workstation transformation will map the range [0,1] x [0,1] in NDC onto the largest square on the workstation’s display surface. The aspect ratio of the workstation window is maintained at 1 to 1.

  Parameters:

  - `xmin`: The left horizontal coordinate of the workstation window (0 <= xmin < xmax).
  - `xmax`: The right horizontal coordinate of the workstation window (xmin < xmax <= 1).
  - `ymin`: The bottom vertical coordinate of the workstation window (0 <= ymin < ymax).
  - `ymax`: The top vertical coordinate of the workstation window (ymin < ymax <= 1).
  ]##
  assert(0.0 <= xmin)
  assert(xmin < xmax)
  assert(xmax <= 1.0)  
  assert(0.0 <= ymin)
  assert(ymin < ymax)
  assert(ymax <= 1.0)    
  gr_setwswindow(xmin.cdouble, xmax.cdouble, ymin.cdouble, ymax.cdouble)

proc setViewport*() =
  #[ https://gr-framework.org/examples/pyside_ex.html?highlight=setwsviewport

          self.currentDevicePixelRatio = self.devicePixelRatioF()
        mwidth  = self.w * 2.54 / self.logicalDpiX() / 100 / self.currentDevicePixelRatio
        mheight = self.h * 2.54 / self.logicalDpiY() / 100 / self.currentDevicePixelRatio
  ]#

  #gr_setwsviewport(0, msize, 0, msize * ratio)
  let (mwidth, mheight, width, height) = getDSPsize()
  let ratio = width.float / height.float
  #echo "mwidth: ", mwidth, "   width: ", width
  let dpi = width.float / mwidth * 0.0254  # 0.0254 in/m
  #echo "dpi: ", dpi
  let w = 600
  let msize = 0.2   #mwidth * w.float / width.float
  setWorkStationViewport(0.0, 0.2, 0.0, 0.1)
  #setWindow(0, 1, 0, ratio)  
  echo ratio
  #setWorkStationWindow(0.0, 1.0, 0.0, 0.5) # Middle top
  setWorkStationWindow(0.0, 1.0, 0.0, 1.0) 

#[
jlgr
====

function set_viewport(kind, subplot)
    mwidth, mheight, width, height = GR.inqdspsize()
    if haskey(plt.kvs, :figsize)
        w = 0.0254 *  width * plt.kvs[:figsize][1] / mwidth
        h = 0.0254 * height * plt.kvs[:figsize][2] / mheight
    else
        dpi = width / mwidth * 0.0254
        if dpi > 200
            w, h = [x * dpi / 100 for x in plt.kvs[:size]]
        else
            w, h = plt.kvs[:size]
        end
    end
    viewport = zeros(4)
    vp = copy(float(subplot))
    if w > h
        ratio = float(h) / w
        msize = mwidth * w / width
        GR.setwsviewport(0, msize, 0, msize * ratio)
        GR.setwswindow(0, 1, 0, ratio)
        vp[3] *= ratio
        vp[4] *= ratio
    else
        ratio = float(w) / h
        msize = mheight * h / height
        GR.setwsviewport(0, msize * ratio, 0, msize)
        GR.setwswindow(0, ratio, 0, 1)
        vp[1] *= ratio
        vp[2] *= ratio
    end
    if kind in (:wireframe, :surface, :plot3, :scatter3, :trisurf, :volume)
        extent = min(vp[2] - vp[1], vp[4] - vp[3])
        vp1 = 0.5 * (vp[1] + vp[2] - extent)
        vp2 = 0.5 * (vp[1] + vp[2] + extent)
        vp3 = 0.5 * (vp[3] + vp[4] - extent)
        vp4 = 0.5 * (vp[3] + vp[4] + extent)
    else
        vp1, vp2, vp3, vp4 = vp
    end
    viewport[1] = vp1 + 0.125 * (vp2 - vp1)
    viewport[2] = vp1 + 0.925 * (vp2 - vp1)
    viewport[3] = vp3 + 0.125 * (vp4 - vp3)
    viewport[4] = vp3 + 0.925 * (vp4 - vp3)

    if kind in (:contour, :contourf, :hexbin, :heatmap, :nonuniformheatmap, :polarheatmap, :surface, :trisurf, :volume)
        viewport[2] -= 0.1
    end
    if kind in (:line, :step, :scatter, :stem) && haskey(plt.kvs, :labels)
        location = get(plt.kvs, :location, 1)
        if location in (11, 12, 13)
            w, h = legend_size()
            viewport[2] -= w + 0.1
        end
    end
    GR.setviewport(viewport[1], viewport[2], viewport[3], viewport[4])

    plt.kvs[:viewport] = viewport
    plt.kvs[:vp] = vp
    plt.kvs[:ratio] = ratio

    if haskey(plt.kvs, :backgroundcolor)
        GR.savestate()
        GR.selntran(0)
        GR.setfillintstyle(GR.INTSTYLE_SOLID)
        GR.setfillcolorind(plt.kvs[:backgroundcolor])
        if w > h
          GR.fillrect(subplot[1], subplot[2],
                      ratio * subplot[3], ratio * subplot[4])
        else
          GR.fillrect(ratio * subplot[1], ratio * subplot[2],
                      subplot[3], subplot[4])
        end
        GR.selntran(1)
        GR.restorestate()
    end

    if kind in (:polar, :polarhist, :polarheatmap)
        xmin, xmax, ymin, ymax = viewport
        xcenter = 0.5 * (xmin + xmax)
        ycenter = 0.5 * (ymin + ymax)
        r = 0.5 * min(xmax - xmin, ymax - ymin)
        GR.setviewport(xcenter - r, xcenter + r, ycenter - r, ycenter + r)
    end
end


]#

proc gridit*(x, y, z:seq[float], nx,ny:int):tuple[x:seq[float],y:seq[float],z:seq[float]] =
  ##[
  Interpolate data from arbitrary points at points on a rectangular grid.

  Parameters:

  - `nd`: The number of input points
  - `xd`: A pointer to the X coordinates of the input points
  - `yd`: A pointer to the Y coordinates of the input points
  - `zd`: A pointer to the values of the points
  - `nx`: The number of points in X direction for the output grid
  - `ny`: The number of points in Y direction for the output grid
  - `x`: A pointer to the points in X direction for the output grid
  - `y`: A pointer to the points in Y direction for the output grid
  - `z`: A pointer to the interpolated values on the nx x ny grid points
  ]##
  let n = x.len.cint
  let xptr = cast[ptr cdouble](x[0].unsafeAddr)
  let yptr = cast[ptr cdouble](y[0].unsafeAddr)
  let zptr = cast[ptr cdouble](z[0].unsafeAddr)
  var xx = newSeq[float](nx)
  var yy = newSeq[float](ny)
  var zz = newSeq[float](nx * ny)
  gr_gridit( n, xptr, yptr, zptr, nx.cint, ny.cint, 
             cast[ptr cdouble](xx[0].unsafeAddr),
             cast[ptr cdouble](yy[0].unsafeAddr),
             cast[ptr cdouble](zz[0].unsafeAddr)) 
  return (xx, yy, zz)


proc setSpace*(zmin, zmax:float, rotation, tilt:int):int =
  ##[
  Set the abstract Z-space used for mapping three-dimensional output primitives into the current world coordinate space.

  This function establishes the limits of an abstract Z-axis and defines the angles for rotation and for the viewing angle (tilt) of a simulated three-dimensional graph, used for mapping corresponding output primitives into the current window. These settings are used for all subsequent three-dimensional output primitives until other values are specified. Angles of rotation and viewing angle must be specified between 0 and 90 degrees.

  Parameters:

  - `zmin`: Minimum value for the Z-axis.
  - `zmax`: Maximum value for the Z-axis.
  - `rotation`: Angle for the rotation of the X axis, in degrees.
  - `tilt`: Viewing angle of the Z axis, in degrees.
  ]##
  let tmp = gr_setspace(zmin.cdouble, zmax.cdouble, rotation.cint, tilt.cint)
  return tmp.int


proc initgr*() =
  ##[
  TBD
  ]##
  gr_initgr()

proc openGKS*() =
  ##[
  TBD
  ]##
  gr_opengks()

proc closeGKS*() =
  ##[
  TBD
  ]##
  gr_closegks()  

