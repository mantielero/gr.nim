# NOT WORKING
import ../src/gr
import sequtils, sugar, math, random

let n = 100
var x = newSeq[float](n)

for i in 0..<n:
  x[i] = rand(1.0) * 2.0 - 1.0 

histogram(x, nbins=19)

discard readLine(stdin)
grm_finalize()