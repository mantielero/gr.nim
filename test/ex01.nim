#from ../src/gr import polyline
import ../src/gr
#include "../src/gr_wrapper.nim"

#type
#  Dataset* = object
#      x*, y*, z*:seq[float]

#[
proc polyline*(ds:Dataset) =
  ## Draws 2D polyline given a dataset
  let n = ds.x.len.cint
  let px = cast[ptr cdouble](unsafeAddr(ds.x[0]))
  let py = cast[ptr cdouble](unsafeAddr(ds.y[0]))
  gr_polyline(n, px, py)
]#
#[
template on*(filename: string, body: untyped) =
  gr_beginprint(filename.cstring)
  body
  gr_endprint()
]#

when isMainModule:
  let pline = Dataset( x: @[0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
                       y: @[0.3, 0.5, 0.4, 0.2, 0.6, 0.7] )
  on("salida.png"):
    polyline( pline )
