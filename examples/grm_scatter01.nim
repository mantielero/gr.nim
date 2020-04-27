import ../src/gr
import sequtils, sugar, math

let x = linRange(-2.0, 2.0, 40)
let y = x.map(x => 0.2 * x + 0.4 )     

var args = grm_args_new()
discard grm_args_push(args, "kind".cstring, "s".cstring, "scatter".cstring) 
discard grm_args_push(args, "x".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](x[0].unsafeAddr) )
discard grm_args_push(args, "y".cstring, "nD".cstring, x.len.cint, cast[ptr cdouble](y[0].unsafeAddr) )

discard grm_plot(args)

discard readLine(stdin)
grm_args_delete(args)
grm_finalize()