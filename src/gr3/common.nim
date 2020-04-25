
proc convert(orig:seq[float]):array[3,cfloat] =
  var tmp:array[3,cfloat]
  for i in 0..2:
    tmp[i] = orig[i].cfloat
  return tmp

proc convert(orig:array[3,float]):array[3,cfloat] =
  var tmp:array[3,cfloat]
  for i in 0..2:
    tmp[i] = orig[i].cfloat
  return tmp


proc drawCylinderMesh*( position, direction, color:array[3,float], radii,length:float) =
  let pos = convert(position)
  let dir = convert(direction)
  let col = convert(color)
  let rad = radii.cfloat
  let leng = length.cfloat
  gr3_drawcylindermesh( 1.cint, 
                        pos[0].unsafeAddr, 
                        dir[0].unsafeAddr, 
                        col[0].unsafeAddr, 
                        rad.unsafeAddr, 
                        leng.unsafeAddr )

proc drawCylinderMesh*( positions, directions, colors:seq[array[3,float]], radii,length:seq[float]) =
  for i in 0..<positions.len:
    drawCylinderMesh( positions[i], directions[i], colors[i], radii[i], length[i])

proc drawCylinderMesh*( n:int, 
                        positions, directions, colors:seq[float], radii,length:float) =
  let pos = convert(positions)
  let dir = convert(directions)
  let col = convert(colors)
  let rad = radii.cfloat
  let leng = length.cfloat
  gr3_drawcylindermesh( n.cint, 
                        pos[0].unsafeAddr, 
                        dir[0].unsafeAddr, 
                        col[0].unsafeAddr, 
                        rad.unsafeAddr, 
                        leng.unsafeAddr ) 


proc drawSphereMesh*(positions, colors:array[3,float], radii:float) = 
  let pos = convert(positions)
  #let dir = convert(directions)
  let col = convert(colors)
  let rad = radii.cfloat
  gr3_drawspheremesh( 1.cint, 
                        pos[0].unsafeAddr,
                        col[0].unsafeAddr, 
                        rad.unsafeAddr ) 


proc drawSphereMesh*(positions, colors:seq[array[3,float]], radii:seq[float]) = 
  for i in 0..<positions.len:
    drawSphereMesh(positions[i], colors[i], radii[i])


proc drawImage*(xmin, xmax, ymin, ymax:float, width, height:int, drawable_type:int) =
  let tmp = gr3_drawimage( xmin.cfloat, xmax.cfloat, ymin.cfloat, ymax.cfloat, 
                           width.cint, height.cint, 
                           drawable_type.cint)
