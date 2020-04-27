# NOT WORKING
import ../src/gr
import sequtils, sugar, math, random

let n = 100
var x = newSeq[float](n)

for i in 0..<n:
  x[i] = rand(1.0) * 2.0 - 1.0 

#var args:grm_args_t
var args = grm_args_new()
discard grm_args_push(args, "kind".cstring, "s".cstring, "hist".cstring) 
discard grm_args_push(args, "x".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](x[0].unsafeAddr) )
discard grm_args_push(args, "nbins".cstring, "i".cstring, 19.cint )
#discard grm_args_push(args, "z".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](z[0].unsafeAddr) )

discard grm_plot(args)

discard readLine(stdin)
grm_args_delete(args)
grm_finalize()