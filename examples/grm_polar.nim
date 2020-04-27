import ../src/gr
import sequtils, sugar, math

let angles = linRange(0.0, 2.0 * PI, 40)
let radii = linRange(0.0, 2.0, 40)

#var args:grm_args_t
var args = grm_args_new()
discard grm_args_push(args, "kind".cstring, "s".cstring, "polar".cstring) 
discard grm_args_push(args, "x".cstring, "nD".cstring, angles.len.cint, cast[ptr cdouble](angles[0].unsafeAddr) )
discard grm_args_push(args, "y".cstring, "nD".cstring, angles.len.cint, cast[ptr cdouble](radii[0].unsafeAddr) )
#discard grm_args_push(args, "z".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](z[0].unsafeAddr) )

discard grm_plot(args)

discard readLine(stdin)
grm_args_delete(args)
grm_finalize()