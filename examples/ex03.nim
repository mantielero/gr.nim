import ../src/gr
import sequtils, sugar, math

let x = linRange(-2.0, 2.0, 40)
let y = x.map(x => pow(x, 3) + pow(x, 2) + x)#2.0 * x + 4.0)

plot(x, y) #, [-2.0,2.0, -10.0,20.0])

discard readLine(stdin)