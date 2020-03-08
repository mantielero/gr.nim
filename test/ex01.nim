import ../src/gr_wrapper

when isMainModule:
  let x = @[0.0, 0.2, 0.4, 0.6, 0.8, 1.0]
  let y = @[0.3, 0.5, 0.4, 0.2, 0.6, 0.7]
  let px = cast[ptr cdouble](unsafeAddr(x[0]))
  let py = cast[ptr cdouble](unsafeAddr(y[0]))
  gr_beginprint("salida.png".cstring)  
  gr_polyline(x.len.cint, px, py)
  gr_axes(gr_tick(0, 1), gr_tick(0, 1), 0, 0, 1, 1, -0.01)
  gr_endprint()
  #discard readChar(stdin)
