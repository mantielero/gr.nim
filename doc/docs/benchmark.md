# Long story short
The performance is really good. In my laptop with an Intel(R) Core(TM) i7-4770HQ, I get:

- Nim+GR: 1088fps
- Python+GR: 387fps
- Python + Matplotlib: 46fps

# Code
## Nim+Gr
```nim
import gr
import times, math, sugar, sequtils  # os

let tstart = cpuTime()
let x = linRange(0.0, 2.0 * PI, 629)
for i in 1..2000:
    let y = x.map(x => sin(x + i.float / 10.0)) 
    gr_clearws()
    plot(x, y)
    #sleep(1)

let fps_gr = int(200.0 / (cpuTime() - tstart))
echo "fps  (GR): ", fps_gr
```

and compiled like:
```
$ nim c -d:release -d:danger bench.nim
```

# Python + GR and Python + Matplotlib

```python
from numpy import arange, sin, pi
from time import time, sleep
import os

os.environ["GKS_WSTYPE"] = "gksqt"

num_frames = 2000

x = arange(0, 2 * pi, 0.01)

# create an animation using GR

from gr.pygr import plot

tstart = time()
for i in range(num_frames):
    plot(x, sin(x + i / 10.0))
    sleep(0.0001)

fps_gr = int(num_frames / (time() - tstart))
print('fps  (GR): %4d' % fps_gr)

# create the same animation using matplotlib

from matplotlib.pyplot import plot, draw, pause

tstart = time()
line, = plot(x, sin(x))
for i in range(num_frames):
    line.set_ydata(sin(x + i / 10.0))
    draw()
    pause(0.0001)

fps_mpl = int(num_frames / (time() - tstart))
print('fps (mpl): %4d' % fps_mpl)

print('  speedup: %6.1f' % (float(fps_gr) / fps_mpl))
```
