# NOT WORKING
import ../src/gr
import sequtils, sugar, math, random

let n = 100000
var x = newSeq[float](n)
var y = newSeq[float](n)
for i in 0..<n:
  x[i] = rand(1.0)
  y[i] = rand(1.0)  

#var args:grm_args_t
var args = grm_args_new()
discard grm_args_push(args, "kind".cstring, "s".cstring, "hexbin".cstring) 
discard grm_args_push(args, "x".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](x[0].unsafeAddr) )
discard grm_args_push(args, "y".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](y[0].unsafeAddr) )

discard grm_plot(args)

discard readLine(stdin)
grm_args_delete(args)
grm_finalize()