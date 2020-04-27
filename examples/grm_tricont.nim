# NOT WORKING
import ../src/gr
import sequtils, sugar, math, random

let n = 100
var x = newSeq[float](n)
var y = newSeq[float](n)
var z = newSeq[float](n)
for i in 0..<n:
  x[i] = 8.0 * rand(1.0) - 4.0
  y[i] = 8.0 * rand(1.0) - 4.0
  z[i] = sin(x[i]) + cos(y[i])

#var args:grm_args_t
var args = grm_args_new()
discard grm_args_push(args, "kind".cstring, "s".cstring, "tricont".cstring) 
discard grm_args_push(args, "x".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](x[0].unsafeAddr) )
discard grm_args_push(args, "y".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](y[0].unsafeAddr) )
discard grm_args_push(args, "z".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](z[0].unsafeAddr) )

discard grm_plot(args)

discard readLine(stdin)
grm_args_delete(args)
grm_finalize()