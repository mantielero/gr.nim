# Histogram

!!! danger

    Not working:
    ```
    invalid range
    GKS: Possible loss of precision in routine SET_WINDOW
    GKS: Rectangle definition is invalid in routine SET_WINDOW
    origin outside current window

    ```

The following code:
```nim
import gr
import math, random

let n = 100000
var x = newSeq[float](n)
var y = newSeq[float](n)
for i in 0..<n:
  x[i] = rand(1.0)
  y[i] = rand(1.0)  

hexbin(x,y)

discard readLine(stdin)
grm_finalize()
```

creates the following window:

![Histogram](imgs/histogram.png)
