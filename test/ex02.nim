import ../src/gr

when isMainModule:
  let pline = Dataset( x: @[0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
                       y: @[0.3, 0.5, 0.4, 0.2, 0.6, 0.7] )
  on("salida.png"):
    #discard  ""
    polyline( pline )
    #gr_axes(tick(0, 0.2), tick(0, 1), 0, 0, 1, 1, -0.01)
    #let origin = Point(x:0.0,y:0.0)
    #let minor_ticks = (0.2,0.2)
    #let major_ticks = (5,5)
    #let tick_size = -0.01
    #axes(origin, minor_ticks, major_ticks, tick_size )
