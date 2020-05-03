import ../src/gr
import sequtils, sugar, math

let x = linRange(-2.0, 2.0, 40)
let y = x.map(x => x^3 + x^2 + x)#cos(x) * x)  
#let z = x.map(x => sin(x) * x) 

plot2(x,y)

discard readLine(stdin)
grm_finalize()