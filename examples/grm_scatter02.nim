import ../src/gr
import sequtils, sugar, math

let x = linRange(0.0, 1.0, 11)
let y = linRange(0.0, 1.0, 11)
let s = linRange(50.0, 400.0, 11)
let c = linRange(0.0, 255.0, 11)

var args = grm_args_new()
discard grm_args_push(args, "kind".cstring, "s".cstring, "scatter".cstring) 
discard grm_args_push(args, "x".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](x[0].unsafeAddr) )
discard grm_args_push(args, "y".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](y[0].unsafeAddr) )
discard grm_args_push(args, "s".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](s[0].unsafeAddr) )
discard grm_args_push(args, "c".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](c[0].unsafeAddr) )


discard grm_plot(args)

discard readLine(stdin)
grm_args_delete(args)
grm_finalize()