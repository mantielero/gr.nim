# nim c -d:release -d:danger b2
import ../src/gr
import times, math, sugar, sequtils#, os

let tstart = cpuTime()
let x = linRange(0.0, 2.0 * PI, 629)
for i in 1..2000:
    let y = x.map(x => sin(x + i.float / 10.0)) 
    gr_clearws()
    plot(x, y)
    #sleep(1)

let fps_gr = int(200.0 / (cpuTime() - tstart))
echo "fps  (GR): ", fps_gr
