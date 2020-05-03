# Contourf

The following code:
```nim
import gr
import math, random

# Create x, y, z sequences with 100 items
let n = 100
var x = newSeq[float](n)
var y = newSeq[float](n)
var z = newSeq[float](n)
for i in 0..<n:
  x[i] = 8.0 * rand(1.0) - 4.0
  y[i] = 8.0 * rand(1.0) - 4.0
  z[i] = sin(x[i]) + cos(y[i])

# Create the plot (a 1 liner)
contourf(x, y, z)

# Wait for a key press
discard readLine(stdin)   

# Cleaning
grm_finalize()
```

creates the following window:

![Contour](imgs/contourf.png)


!!! note

    Just by replacing `contour` into `contourf`