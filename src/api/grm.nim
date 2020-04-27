##[
This are a few functions to take advance of GRM
]##

proc contour*(x,y,z:seq[float]) =
  ##[
  Contout
  ]##
  assert( x.len == y.len)
  assert( y.len == z.len)
  var args = grm_args_new()
  discard grm_args_push(args, "kind".cstring, "s".cstring, "contour".cstring) 
  discard grm_args_push(args, "x".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](x[0].unsafeAddr) )
  discard grm_args_push(args, "y".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](y[0].unsafeAddr) )
  discard grm_args_push(args, "z".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](z[0].unsafeAddr) )

  discard grm_plot(args)

proc contourf*(x,y,z:seq[float]) =
  ##[
  Contout
  ]##
  assert( x.len == y.len)
  assert( y.len == z.len)
  var args = grm_args_new()
  discard grm_args_push(args, "kind".cstring, "s".cstring, "contourf".cstring) 
  discard grm_args_push(args, "x".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](x[0].unsafeAddr) )
  discard grm_args_push(args, "y".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](y[0].unsafeAddr) )
  discard grm_args_push(args, "z".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](z[0].unsafeAddr) )

  discard grm_plot(args)