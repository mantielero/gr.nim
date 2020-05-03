import ../src/gr
import sequtils, sugar, math

let x = linRange(0.0, 30.0, 1000)
let y = x.map(x => cos(x) * x) 
let z = x.map(x => sin(x) * x) 

#var args:grm_args_t
plot3(x,y,z)

discard readLine(stdin)
#grm_args_delete(args)
grm_finalize()