##[
This are a few functions to take advance of GRM
]##

proc contour*(x,y,z:seq[float]) =
  ##[
  Contour
  ]##
  assert( x.len == y.len)
  assert( y.len == z.len)
  var args = grm_args_new()
  discard grm_args_push(args, "kind".cstring, "s".cstring, "contour".cstring) 
  discard grm_args_push(args, "x".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](x[0].unsafeAddr) )
  discard grm_args_push(args, "y".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](y[0].unsafeAddr) )
  discard grm_args_push(args, "z".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](z[0].unsafeAddr) )

  discard grm_plot(args)
  grm_args_delete(args)

proc contourf*(x,y,z:seq[float]) =
  ##[
  Contour
  ]##
  assert( x.len == y.len)
  assert( y.len == z.len)
  var args = grm_args_new()
  discard grm_args_push(args, "kind".cstring, "s".cstring, "contourf".cstring) 
  discard grm_args_push(args, "x".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](x[0].unsafeAddr) )
  discard grm_args_push(args, "y".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](y[0].unsafeAddr) )
  discard grm_args_push(args, "z".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](z[0].unsafeAddr) )

  discard grm_plot(args)
  grm_args_delete(args)

proc heatmap*(x,y,z:seq[float]) =
  ##[
  Heatmap
  ]##
  assert( x.len == y.len)
  assert( y.len == z.len)
  var args = grm_args_new()
  discard grm_args_push(args, "kind".cstring, "s".cstring, "heatmap".cstring) 
  discard grm_args_push(args, "x".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](x[0].unsafeAddr) )
  discard grm_args_push(args, "y".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](y[0].unsafeAddr) )
  discard grm_args_push(args, "z".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](z[0].unsafeAddr) )

  discard grm_plot(args)
  grm_args_delete(args)


proc hexbin*(x,y:seq[float]) =
  ##[
  Hexbin
  ]##
  assert( x.len == y.len)

  var args = grm_args_new()
  discard grm_args_push(args, "kind".cstring, "s".cstring, "hexbin".cstring) 
  discard grm_args_push(args, "x".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](x[0].unsafeAddr) )
  discard grm_args_push(args, "y".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](y[0].unsafeAddr) )
  #discard grm_args_push(args, "z".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](z[0].unsafeAddr) )

  discard grm_plot(args)
  grm_args_delete(args)


proc histogram*(x:seq[float]; nbins:int = 10) =
  ##[
  Histogram
  ]##
  var args = grm_args_new()
  discard grm_args_push(args, "kind".cstring, "s".cstring, "hist".cstring) 
  discard grm_args_push(args, "x".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](x[0].unsafeAddr) )
  discard grm_args_push(args, "nbins".cstring, "i".cstring, nbins.cint )

  discard grm_plot(args)
  grm_args_delete(args)


proc plot2*(x,y:seq[float]) =
  ##[
  Plot2
  ]##
  assert( x.len == y.len)

  var args = grm_args_new()
  discard grm_args_push(args, "kind".cstring, "s".cstring, "line".cstring) 
  discard grm_args_push(args, "x".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](x[0].unsafeAddr) )
  discard grm_args_push(args, "y".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](y[0].unsafeAddr) )
  #discard grm_args_push(args, "z".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](z[0].unsafeAddr) )

  discard grm_plot(args)
  grm_args_delete(args)

proc plot3*(x,y,z:seq[float]) =
  ##[
  Plot3
  ]##
  assert( x.len == y.len)
  assert( y.len == z.len)
  var args = grm_args_new()
  discard grm_args_push(args, "kind".cstring, "s".cstring, "plot3".cstring) 
  discard grm_args_push(args, "x".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](x[0].unsafeAddr) )
  discard grm_args_push(args, "y".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](y[0].unsafeAddr) )
  discard grm_args_push(args, "z".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](z[0].unsafeAddr) )

  discard grm_plot(args)
  grm_args_delete(args)  


proc scatter*(x,y:seq[float]) =
  ##[
  Scatter
  ]##
  assert( x.len == y.len)

  var args = grm_args_new()
  discard grm_args_push(args, "kind".cstring, "s".cstring, "scatter".cstring) 
  discard grm_args_push(args, "x".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](x[0].unsafeAddr) )
  discard grm_args_push(args, "y".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](y[0].unsafeAddr) )
  #discard grm_args_push(args, "z".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](z[0].unsafeAddr) )

  discard grm_plot(args)
  grm_args_delete(args)

proc scatter*(x,y,s,c:seq[float]) =
  ##[
  Scatter: x, y, size and color
  ]##
  assert( x.len == y.len)

  var args = grm_args_new()
  discard grm_args_push(args, "kind".cstring, "s".cstring, "scatter".cstring) 
  discard grm_args_push(args, "x".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](x[0].unsafeAddr) )
  discard grm_args_push(args, "y".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](y[0].unsafeAddr) )
  discard grm_args_push(args, "s".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](s[0].unsafeAddr) )
  discard grm_args_push(args, "c".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](c[0].unsafeAddr) )

  discard grm_plot(args)
  grm_args_delete(args)


proc stem*(x,y:seq[float]) =
  ##[
  Stem
  ]##
  assert( x.len == y.len)

  var args = grm_args_new()
  discard grm_args_push(args, "kind".cstring, "s".cstring, "stem".cstring) 
  discard grm_args_push(args, "x".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](x[0].unsafeAddr) )
  discard grm_args_push(args, "y".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](y[0].unsafeAddr) )

  discard grm_plot(args)
  grm_args_delete(args)


proc surface*(x,y,z:seq[float]) =
  ##[
  Surface
  ]##
  assert( x.len == y.len)
  assert( y.len == z.len)
  var args = grm_args_new()
  discard grm_args_push(args, "kind".cstring, "s".cstring, "surface".cstring) 
  discard grm_args_push(args, "x".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](x[0].unsafeAddr) )
  discard grm_args_push(args, "y".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](y[0].unsafeAddr) )
  discard grm_args_push(args, "z".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](z[0].unsafeAddr) )

  discard grm_plot(args)
  grm_args_delete(args) 

proc tricont*(x,y,z:seq[float]) =
  ##[
  tricont
  ]##
  assert( x.len == y.len)
  assert( y.len == z.len)
  var args = grm_args_new()
  discard grm_args_push(args, "kind".cstring, "s".cstring, "tricont".cstring) 
  discard grm_args_push(args, "x".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](x[0].unsafeAddr) )
  discard grm_args_push(args, "y".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](y[0].unsafeAddr) )
  discard grm_args_push(args, "z".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](z[0].unsafeAddr) )

  discard grm_plot(args)
  grm_args_delete(args) 

proc trisurf*(x,y,z:seq[float]) =
  ##[
  trisurf
  ]##
  assert( x.len == y.len)
  assert( y.len == z.len)
  var args = grm_args_new()
  discard grm_args_push(args, "kind".cstring, "s".cstring, "trisurf".cstring) 
  discard grm_args_push(args, "x".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](x[0].unsafeAddr) )
  discard grm_args_push(args, "y".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](y[0].unsafeAddr) )
  discard grm_args_push(args, "z".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](z[0].unsafeAddr) )

  discard grm_plot(args)
  grm_args_delete(args) 

proc wireframe*(x,y,z:seq[float]) =
  ##[
  Wireframe
  ]##
  assert( x.len == y.len)
  assert( y.len == z.len)
  var args = grm_args_new()
  discard grm_args_push(args, "kind".cstring, "s".cstring, "wireframe".cstring) 
  discard grm_args_push(args, "x".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](x[0].unsafeAddr) )
  discard grm_args_push(args, "y".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](y[0].unsafeAddr) )
  discard grm_args_push(args, "z".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](z[0].unsafeAddr) )

  discard grm_plot(args)
  grm_args_delete(args)   