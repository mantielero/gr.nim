#import common, polyline, axes, grid, gr_wrapper
import math


proc calcLimit*(val:float;upper=true):float =
  ## Find the order of a number. This means, it checks if 
  ## a number is between 0.001 and 0.01 or
  ## between 1000.0 and 10000.0, for example.  
  let sign = val / abs(val)     # Get the sign
  let om = log10(abs(val)).int  # Get order of magnitude (smaller abs)
  var step = pow(10.0,om.float) * sign
  var tmp = step  
  if val == 0.0:
    return 0.0

  elif abs(val) mod step == 0.0:    
    return val
  
  elif val > 0.0:
    while val > tmp:
      tmp += step
    if upper:
      return tmp          #Upper
    else:
      return tmp - step   # Lower

  elif val < 0.0:     
    while val < tmp:
      tmp += step
    if upper:
      return tmp - step  # We get the previous one
    else:
      return tmp 


proc calcLimits( datasets:seq[Dataset]; limits:array[4,float]=[0.0,0.0,0.0,0.0] ):tuple[x1,x2,x3,x4:float] =
  var xmin = high(float)
  var xmax = low(float)
  var ymin = high(float)
  var ymax = low(float)  
  
  if limits == [0.0,0.0,0.0,0.0]:
    for ds in datasets:
      xmin = min(ds.x.min, xmin)
      xmax = max(ds.x.max, xmax)
      ymin = min(ds.y.min, ymin)
      ymax = max(ds.y.max, ymax)
    # Once we have min and max values, we find "beautiful" close numbers
    #echo (xmin, xmax, ymin, ymax) # (-2.0, 2.000000000000001, 0.0, 8.000000000000004)
    #let (m,M) = findLimits(xmin)
    xmin = calcLimit(xmin, upper=false)#findLimits(xmin)[0]
    xmax = calcLimit(xmax, upper=true)#findLimits(xmax)[1]
    ymin = calcLimit(ymin, upper=false)#findLimits(ymin)[0]
    ymax = calcLimit(ymax, upper=true)#findLimits(ymax)[1]
  else:
    xmin = limits[0]
    xmax = limits[1]    
    ymin = limits[2]
    ymax = limits[3]

  return (xmin, xmax, ymin, ymax)    


proc chooseOrigin( xmin, xmax, ymin, ymax: float ):array[2, float] =
  # Look for a more sensible closer number
  var origin = [0.0,0.0]
  if xmin > 0.0 and xmax > 0.0:
    origin[0] = xmin
  elif xmin < 0.0 and xmax < 0.0:
    origin[0] = xmax
  if ymin > 0.0 and ymax > 0.0:
    origin[1] = ymin
  elif ymin < 0.0 and ymax < 0.0:
    origin[1] = ymax  
  return origin

proc plot*( x, y:seq[float]; limits:array[4,float]=[0.0,0.0,0.0,0.0] ) =
  setLineColor(1)
  let datasets = @[ Dataset(name:"", x:x, y:y) ]
  let (xmin, xmax, ymin, ymax) = calcLimits(datasets, limits)

  # We cover the whole space in real world
  setWindow(xmin,xmax, ymin,ymax)
  let origin = chooseOrigin( xmin, xmax, ymin, ymax )

  let xtick = tick(origin[0], xmax)
  let ytick = tick(origin[1], ymax)
  grid([xtick,ytick],origin,[0,0])  
  axes(origin, [xtick, ytick], [1,1], -0.01) 
  #setLineColor(i+1)
  setLineColor(2)
  polyline(x, y)  
  gr_updatews()

#proc plot*(x,y,z:seq[float]) =
  

proc plot*(datasets:seq[Dataset], filename:string; limits:array[4,float]=[0.0,0.0,0.0,0.0]) =
  ## Performs a quick plot with sensible defaults
  setLineColor(1)
  var xmin = high(float)
  var xmax = low(float)
  var ymin = high(float)
  var ymax = low(float)  
  if limits == [0.0,0.0,0.0,0.0]:
    for ds in datasets:
      xmin = min(ds.x.min, xmin)
      xmax = max(ds.x.max, xmax)
      ymin = min(ds.y.min, ymin)
      ymax = max(ds.y.max, ymax)
    xmin = calcLimit(xmin, upper=false) 
    xmax = calcLimit(xmax, upper=true)  
    ymin = calcLimit(ymin, upper=false)  
    ymax = calcLimit(ymax, upper=true) 
  else:
    xmin = limits[0]
    xmax = limits[1]    
    ymin = limits[2]
    ymax = limits[3]  
  
  setWindow(xmin,xmax, ymin,ymax)
 
  # Look for a more sensible closer number
  var origin = [0.0,0.0]
  if xmin > 0.0 and xmax > 0.0:
    origin[0] = xmin
  elif xmin < 0.0 and xmax < 0.0:
    origin[0] = xmax
  
  if ymin > 0.0 and ymax > 0.0:
    origin[1] = ymin
  elif ymin < 0.0 and ymax < 0.0:
    origin[1] = ymax

  let xtick = tick(origin[0],xmax)
  let ytick = tick(origin[1],ymax)
  #[
  on(filename):
    #grid(xtick,ytick, origin[0], origin[1], 0, 0)
    grid([xtick,ytick],origin,[0,0])  
    axes(origin, [xtick, ytick], [1,1], -0.01)  
    for i, ds in datasets:
      setLineColor(i+1)
      polyline(ds)
  ]#
  gr_beginprint(filename.cstring)  
  grid([xtick,ytick],origin,[0,0])  
  axes(origin, [xtick, ytick], [1,1], -0.01)  
  for i, ds in datasets:
    setLineColor(i+1)
    polyline(ds)  
  gr_endprint()