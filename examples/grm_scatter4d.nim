import ../src/gr
import sequtils, sugar, math

let x = linRange(0.0, 1.0, 11)
let y = linRange(0.0, 1.0, 11)
let s = linRange(50.0, 400.0, 11)
let c = linRange(0.0, 255.0, 11)

scatter(x,y,s,c)

discard readLine(stdin)
grm_finalize()