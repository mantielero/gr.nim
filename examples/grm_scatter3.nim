import ../src/gr
import sequtils, sugar, math
import random


let n = 100
var x = newSeq[float](n)
var y = newSeq[float](n)
var z = newSeq[float](n)
var c = newSeq[float](n)
for i in 0..<n:
  x[i] = rand(1.0) * 2.0 - 1.0 
  y[i] = rand(1.0) * 2.0 - 1.0
  z[i] = rand(1.0) * 2.0 - 1.0
  c[i] = rand(1.0) * 999.0 + 1.0


var args = grm_args_new()
discard grm_args_push(args, "kind".cstring, "s".cstring, "scatter3".cstring) 
discard grm_args_push(args, "x".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](x[0].unsafeAddr) )
discard grm_args_push(args, "y".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](y[0].unsafeAddr) )
discard grm_args_push(args, "z".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](z[0].unsafeAddr) )
discard grm_args_push(args, "c".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](c[0].unsafeAddr) )

discard grm_plot(args)

discard readLine(stdin)
grm_args_delete(args)
grm_finalize()