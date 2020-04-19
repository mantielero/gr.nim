#import common, polyline, axes, grid, gr_wrapper
import math

proc findLimits(number:float):array[2,float] =
  ## Find the order of a number. This means, it checks if 
  ## a number is between 0.001 and 0.01 or
  ## between 1000.0 and 10000.0, for example.
  let n = abs(number)
  if n == 0.0:
     result = [0.0,0.0]
  elif n > 0.1 and n <= 1.0:
     result = [0.0,1.0] 
  else:
     let val = log10(n)
     let min = val.int
     result = [10.0^min, 10.0^(min+1)]

     if val == min.float:
        result[1] = result[0]
  if n == -number and n != 0.0:
    result = [-1.0 * result[1], -1.0 * result[0]]

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
    xmin = findLimits(xmin)[0]
    xmax = findLimits(xmax)[1]
    ymin = findLimits(ymin)[0]
    ymax = findLimits(ymax)[1]
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
    xmin = findLimits(xmin)[0]
    xmax = findLimits(xmax)[1]
    ymin = findLimits(ymin)[0]
    ymax = findLimits(ymax)[1]
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