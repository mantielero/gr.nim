# Plot3

The following code:
```nim
import gr
import sequtils, sugar, math

let x = linRange(0.0, 30.0, 1000)
let y = x.map(x => cos(x) * x) 
let z = x.map(x => sin(x) * x) 

plot3(x,y,z)

discard readLine(stdin)
grm_finalize()
```

creates the following window:

![Plot3](imgs/plot3.png)


