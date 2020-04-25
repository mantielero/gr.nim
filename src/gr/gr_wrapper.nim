# Resetting /home/jose/src/gr.nim/src/wrapper/build
# Importing /home/jose/src/gr.nim/src/wrapper/build/lib/gr/gr.h
# Generated at 2020-04-22T22:49:26+02:00
# Command line:
#   /home/jose/.nimble/pkgs/nimterop-#head/nimterop/toast --preprocess --pnim --dynlib=dynlibFile --nim:/home/jose/.choosenim/toolchains/nim-1.2.0/bin/nim /home/jose/src/gr.nim/src/wrapper/build/lib/gr/gr.h

{.hint[ConvFromXtoItselfNotNeeded]: off.}

import nimterop/types

when defined(windows):
  const dynlibFile = "libGR.dll"

elif defined(linux):
  const dynlibFile = "/usr/gr/lib/libGR.so"

const
  GR_PROJECTION_DEFAULT* = 0
  GR_PROJECTION_ORTHOGRAPHIC* = 1
  GR_PROJECTION_PERSPECTIVE* = 2

{.pragma: impgr, importc.}
{.pragma: impgrC, impgr, cdecl, dynlib: dynlibFile.}

type
  vertex_t* {.bycopy.} = object
    x*: cdouble
    y*: cdouble

# TODO
proc gr_initgr*() {.impgrC.}
proc gr_opengks*() {.impgrC.}
proc gr_closegks*() {.impgrC.}
proc gr_inqdspsize*(a1: ptr cdouble, a2: ptr cdouble, a3: ptr cint, a4: ptr cint) {.impgrC.}

# DONE
proc gr_openws*(a1: cint, a2: cstring, a3: cint) {.impgrC.}
proc gr_closews*(a1: cint) {.impgrC.}
proc gr_activatews*(a1: cint) {.impgrC.}
proc gr_deactivatews*(a1: cint) {.impgrC.}
proc gr_configurews*() {.impgrC.}
proc gr_clearws*() {.impgrC.}
proc gr_updatews*() {.impgrC.}
proc gr_polyline*(a1: cint, a2: ptr cdouble, a3: ptr cdouble) {.impgrC.}
proc gr_polymarker*(a1: cint, a2: ptr cdouble, a3: ptr cdouble) {.impgrC.}

proc gr_text*(a1: cdouble, a2: cdouble, a3: cstring) {.impgrC.}
proc gr_inqtext*(a1: cdouble, a2: cdouble, a3: cstring, a4: ptr cdouble, a5: ptr cdouble) {.impgrC.}
proc gr_settextfontprec*(a1: cint, a2: cint) {.impgrC.}
proc gr_setcharexpan*(a1: cdouble) {.impgrC.}
proc gr_setcharspace*(a1: cdouble) {.impgrC.}
proc gr_setcharheight*(a1: cdouble) {.impgrC.}
proc gr_setcharup*(a1: cdouble, a2: cdouble) {.impgrC.}
proc gr_settextpath*(a1: cint) {.impgrC.}
proc gr_settextalign*(a1: cint, a2: cint) {.impgrC.}

# TODO
proc gr_settextcolorind*(a1: cint) {.impgrC.}

# TODO
proc gr_cellarray*(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble, a5: cint, a6: cint, a7: cint, a8: cint, a9: cint, a10: cint, a11: ptr cint) {.impgrC.}
proc gr_nonuniformcellarray*(a1: ptr cdouble, a2: ptr cdouble, a3: cint, a4: cint, a5: cint, a6: cint, a7: cint, a8: cint, a9: ptr cint) {.impgrC.}
proc gr_polarcellarray*(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble, a5: cdouble, a6: cdouble, a7: cint, a8: cint, a9: cint, a10: cint, a11: cint, a12: cint, a13: ptr cint) {.impgrC.}
proc gr_gdp*(a1: cint, a2: ptr cdouble, a3: ptr cdouble, a4: cint, a5: cint, a6: ptr cint) {.impgrC.}
proc gr_spline*(a1: cint, a2: ptr cdouble, a3: ptr cdouble, a4: cint, a5: cint) {.impgrC.}


proc gr_inqtextcolorind*(a1: ptr cint) {.impgrC.}

# DONE
proc gr_gridit*(a1: cint, a2: ptr cdouble, a3: ptr cdouble, a4: ptr cdouble, a5: cint, a6: cint, a7: ptr cdouble, a8: ptr cdouble, a9: ptr cdouble) {.impgrC.}
proc gr_setlinetype*(a1: cint) {.impgrC.}
proc gr_inqlinetype*(a1: ptr cint) {.impgrC.}
proc gr_setlinewidth*(a1: cdouble) {.impgrC.}
proc gr_inqlinewidth*(a1: ptr cdouble) {.impgrC.}
proc gr_setlinecolorind*(a1: cint) {.impgrC.}
proc gr_inqlinecolorind*(a1: ptr cint) {.impgrC.}

proc gr_setmarkertype*(a1: cint) {.impgrC.}
proc gr_inqmarkertype*(a1: ptr cint) {.impgrC.}
proc gr_setmarkersize*(a1: cdouble) {.impgrC.}
proc gr_inqmarkersize*(a1: ptr cdouble) {.impgrC.}
proc gr_setmarkercolorind*(a1: cint) {.impgrC.}
proc gr_inqmarkercolorind*(a1: ptr cint) {.impgrC.}

proc gr_fillarea*(a1: cint, a2: ptr cdouble, a3: ptr cdouble) {.impgrC.}
proc gr_setfillintstyle*(a1: cint) {.impgrC.}
proc gr_inqfillintstyle*(a1: ptr cint) {.impgrC.}
proc gr_setfillstyle*(a1: cint) {.impgrC.}
proc gr_inqfillstyle*(a1: ptr cint) {.impgrC.}
proc gr_setfillcolorind*(a1: cint) {.impgrC.}
proc gr_inqfillcolorind*(a1: ptr cint) {.impgrC.}

proc gr_setwindow*(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble) {.impgrC.}
proc gr_setwindow3d*(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble, a5: cdouble, a6: cdouble) {.impgrC.}

# TODO
proc gr_setcolorrep*(a1: cint, a2: cdouble, a3: cdouble, a4: cdouble) {.impgrC.}

proc gr_inqwindow*(a1: ptr cdouble, a2: ptr cdouble, a3: ptr cdouble, a4: ptr cdouble) {.impgrC.}
proc gr_setviewport*(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble) {.impgrC.}
proc gr_inqviewport*(a1: ptr cdouble, a2: ptr cdouble, a3: ptr cdouble, a4: ptr cdouble) {.impgrC.}

proc gr_selntran*(a1: cint) {.impgrC.}
proc gr_setclip*(a1: cint) {.impgrC.}

proc gr_setwswindow*(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble) {.impgrC.}
proc gr_setwsviewport*(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble) {.impgrC.}

proc gr_createseg*(a1: cint) {.impgrC.}
proc gr_copysegws*(a1: cint) {.impgrC.}
proc gr_redrawsegws*() {.impgrC.}
proc gr_setsegtran*(a1: cint, a2: cdouble, a3: cdouble, a4: cdouble, a5: cdouble, a6: cdouble, a7: cdouble, a8: cdouble) {.impgrC.}
proc gr_closeseg*() {.impgrC.}
proc gr_emergencyclosegks*() {.impgrC.}
proc gr_updategks*() {.impgrC.}
proc gr_setspace*(a1: cdouble, a2: cdouble, a3: cint, a4: cint): cint {.impgrC.}
proc gr_inqspace*(a1: ptr cdouble, a2: ptr cdouble, a3: ptr cint, a4: ptr cint) {.impgrC.}

proc gr_inqscale*(a1: ptr cint) {.impgrC.}
proc gr_textext*(a1: cdouble, a2: cdouble, a3: cstring): cint {.impgrC.}
proc gr_inqtextext*(a1: cdouble, a2: cdouble, a3: cstring, a4: ptr cdouble, a5: ptr cdouble) {.impgrC.}

# DONE
proc gr_axes*(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble, a5: cint, a6: cint, a7: cdouble) {.impgrC.}
proc gr_setscale*(a1: cint): cint {.impgrC.}

# TODO
type
  callback = proc(a1: cdouble, a2: cdouble, a3:var cstring, a4:cdouble) {.cdecl.}

proc gr_axeslbl*(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble, a5: cint, a6: cint, a7: cdouble, a8,a9:callback) {.impgrC.}

# DONE
proc gr_grid*(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble, a5: cint, a6: cint) {.impgrC.}
proc gr_grid3d*(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble, a5: cdouble, a6: cdouble, a7: cint, a8: cint, a9: cint) {.impgrC.}

# TODO
proc gr_verrorbars*(a1: cint, a2: ptr cdouble, a3: ptr cdouble, a4: ptr cdouble, a5: ptr cdouble) {.impgrC.}
proc gr_herrorbars*(a1: cint, a2: ptr cdouble, a3: ptr cdouble, a4: ptr cdouble, a5: ptr cdouble) {.impgrC.}

# DONE
proc gr_polyline3d*(a1: cint, a2: ptr cdouble, a3: ptr cdouble, a4: ptr cdouble) {.impgrC.}

# TODO
proc gr_polymarker3d*(a1: cint, a2: ptr cdouble, a3: ptr cdouble, a4: ptr cdouble) {.impgrC.}
proc gr_axes3d*(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble, a5: cdouble, a6: cdouble, a7: cint, a8: cint, a9: cint, a10: cdouble) {.impgrC.}
proc gr_titles3d*(a1: cstring, a2: cstring, a3: cstring) {.impgrC.}
proc gr_surface*(a1: cint, a2: cint, a3: ptr cdouble, a4: ptr cdouble, a5: ptr cdouble, a6: cint) {.impgrC.}
proc gr_contour*(a1: cint, a2: cint, a3: cint, a4: ptr cdouble, a5: ptr cdouble, a6: ptr cdouble, a7: ptr cdouble, a8: cint) {.impgrC.}
proc gr_contourf*(a1: cint, a2: cint, a3: cint, a4: ptr cdouble, a5: ptr cdouble, a6: ptr cdouble, a7: ptr cdouble, a8: cint) {.impgrC.}
proc gr_tricontour*(a1: cint, a2: ptr cdouble, a3: ptr cdouble, a4: ptr cdouble, a5: cint, a6: ptr cdouble) {.impgrC.}
proc gr_hexbin*(a1: cint, a2: ptr cdouble, a3: ptr cdouble, a4: cint): cint {.impgrC.}

proc gr_setcolormap*(a1: cint) {.impgrC.}
proc gr_inqcolormap*(a1: ptr cint) {.impgrC.}
proc gr_setcolormapfromrgb*(n: cint, r: ptr cdouble, g: ptr cdouble, b: ptr cdouble, x: ptr cdouble) {.impgrC.}

proc gr_colorbar*() {.impgrC.}
proc gr_inqcolor*(a1: cint, a2: ptr cint) {.impgrC.}
proc gr_inqcolorfromrgb*(a1: cdouble, a2: cdouble, a3: cdouble): cint {.impgrC.}
proc gr_hsvtorgb*(h: cdouble, s: cdouble, v: cdouble, r: ptr cdouble, g: ptr cdouble, b: ptr cdouble) {.impgrC.}

proc gr_tick*(a1: cdouble, a2: cdouble): cdouble {.impgrC.}

proc gr_validaterange*(a1: cdouble, a2: cdouble): cint {.impgrC.}
proc gr_adjustlimits*(a1: ptr cdouble, a2: ptr cdouble) {.impgrC.}
proc gr_adjustrange*(a1: ptr cdouble, a2: ptr cdouble) {.impgrC.}

proc gr_beginprint*(a1: cstring) {.impgrC.}
proc gr_beginprintext*(a1: cstring, a2: cstring, a3: cstring, a4: cstring) {.impgrC.}
proc gr_endprint*() {.impgrC.}

proc gr_ndctowc*(a1: ptr cdouble, a2: ptr cdouble) {.impgrC.}
proc gr_wctondc*(a1: ptr cdouble, a2: ptr cdouble) {.impgrC.}
proc gr_wc3towc*(a1: ptr cdouble, a2: ptr cdouble, a3: ptr cdouble) {.impgrC.}

proc gr_drawrect*(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble) {.impgrC.}
proc gr_fillrect*(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble) {.impgrC.}
proc gr_drawarc*(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble, a5: cdouble, a6: cdouble) {.impgrC.}
proc gr_fillarc*(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble, a5: cdouble, a6: cdouble) {.impgrC.}

proc gr_drawpath*(a1: cint, a2: ptr vertex_t, a3: ptr cuchar, a4: cint) {.impgrC.}

proc gr_setarrowstyle*(a1: cint) {.impgrC.}
proc gr_setarrowsize*(a1: cdouble) {.impgrC.}
proc gr_drawarrow*(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble) {.impgrC.}

proc gr_readimage*(a1: cstring, a2: ptr cint, a3: ptr cint, a4: ptr ptr cint): cint {.impgrC.}
proc gr_drawimage*(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble, a5: cint, a6: cint, a7: ptr cint, a8: cint) {.impgrC.}

proc gr_setshadow*(a1: cdouble, a2: cdouble, a3: cdouble) {.impgrC.}
proc gr_settransparency*(a1: cdouble) {.impgrC.}
# Declaration 'gr_setcoordxform' skipped
# Declaration 'gr_setcoordxform' skipped
proc gr_begingraphics*(a1: cstring) {.impgrC.}
proc gr_importgraphics*(a1: cstring): cint {.impgrC.}
proc gr_endgraphics*() {.impgrC.}
proc gr_getgraphics*(): cstring {.impgrC.}
proc gr_drawgraphics*(a1: cstring): cint {.impgrC.}

proc gr_mathtex*(a1: cdouble, a2: cdouble, a3: cstring) {.impgrC.}
proc gr_inqmathtex*(a1: cdouble, a2: cdouble, a3: cstring, a4: ptr cdouble, a5: ptr cdouble) {.impgrC.}
proc gr_beginselection*(a1: cint, a2: cint) {.impgrC.}
proc gr_endselection*() {.impgrC.}
proc gr_moveselection*(a1: cdouble, a2: cdouble) {.impgrC.}
proc gr_resizeselection*(a1: cint, a2: cdouble, a3: cdouble) {.impgrC.}
proc gr_inqbbox*(a1: ptr cdouble, a2: ptr cdouble, a3: ptr cdouble, a4: ptr cdouble) {.impgrC.}
proc gr_precision*(): cdouble {.impgrC.}
proc gr_setregenflags*(a1: cint) {.impgrC.}
proc gr_inqregenflags*(): cint {.impgrC.}
proc gr_savestate*() {.impgrC.}
proc gr_restorestate*() {.impgrC.}
proc gr_selectcontext*(a1: cint) {.impgrC.}
proc gr_destroycontext*(a1: cint) {.impgrC.}
proc gr_uselinespec*(a1: cstring): cint {.impgrC.}
proc gr_delaunay*(a1: cint, a2: ptr cdouble, a3: ptr cdouble, a4: ptr cint, a5: ptr ptr cint) {.impgrC.}
proc gr_reducepoints*(a1: cint, a2: ptr cdouble, a3: ptr cdouble, a4: cint, a5: ptr cdouble, a6: ptr cdouble) {.impgrC.}
proc gr_trisurface*(a1: cint, a2: ptr cdouble, a3: ptr cdouble, a4: ptr cdouble) {.impgrC.}
proc gr_gradient*(a1: cint, a2: cint, a3: ptr cdouble, a4: ptr cdouble, a5: ptr cdouble, a6: ptr cdouble, a7: ptr cdouble) {.impgrC.}
proc gr_quiver*(a1: cint, a2: cint, a3: ptr cdouble, a4: ptr cdouble, a5: ptr cdouble, a6: ptr cdouble, a7: cint) {.impgrC.}
proc gr_interp2*(nx: cint, ny: cint, x: ptr cdouble, y: ptr cdouble, z: ptr cdouble, nxq: cint, nyq: cint, xq: ptr cdouble, yq: ptr cdouble, zq: ptr cdouble, `method`: cint, extrapval: cdouble) {.impgrC.}
proc gr_version*(): cstring {.impgrC.}
proc gr_shade*(a1: cint, a2: ptr cdouble, a3: ptr cdouble, a4: cint, a5: cint, a6: ptr cdouble, a7: cint, a8: cint, a9: ptr cint) {.impgrC.}
proc gr_shadepoints*(a1: cint, a2: ptr cdouble, a3: ptr cdouble, a4: cint, a5: cint, a6: cint) {.impgrC.}
proc gr_shadelines*(a1: cint, a2: ptr cdouble, a3: ptr cdouble, a4: cint, a5: cint, a6: cint) {.impgrC.}
proc gr_panzoom*(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble, a5: ptr cdouble, a6: ptr cdouble, a7: ptr cdouble, a8: ptr cdouble) {.impgrC.}
# Declaration 'gr_findboundary' skipped
# Declaration 'gr_findboundary' skipped
proc gr_setresamplemethod*(a1: cuint) {.impgrC.}
proc gr_inqresamplemethod*(a1: ptr cuint) {.impgrC.}
proc gr_path*(a1: cint, a2: ptr cdouble, a3: ptr cdouble, a4: cstring) {.impgrC.}
proc gr_setborderwidth*(a1: cdouble) {.impgrC.}
proc gr_inqborderwidth*(a1: ptr cdouble) {.impgrC.}
proc gr_setbordercolorind*(a1: cint) {.impgrC.}
proc gr_inqbordercolorind*(a1: ptr cint) {.impgrC.}

proc gr_setprojectiontype*(a1: cint) {.impgrC.}
proc gr_inqprojectiontype*(a1: ptr cint) {.impgrC.}
proc gr_setperspectiveprojection*(a1: cdouble, a2: cdouble, a3: cdouble) {.impgrC.}
proc gr_inqperspectiveprojection*(a1: ptr cdouble, a2: ptr cdouble, a3: ptr cdouble) {.impgrC.}
proc gr_settransformationparameters*(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble, a5: cdouble, a6: cdouble, a7: cdouble, a8: cdouble, a9: cdouble) {.impgrC.}
proc gr_inqtransformationparameters*(a1: ptr cdouble, a2: ptr cdouble, a3: ptr cdouble, a4: ptr cdouble, a5: ptr cdouble, a6: ptr cdouble, a7: ptr cdouble, a8: ptr cdouble, a9: ptr cdouble) {.impgrC.}
proc gr_setorthographicprojection*(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble, a5: cdouble, a6: cdouble) {.impgrC.}
proc gr_inqorthographicprojection*(a1: ptr cdouble, a2: ptr cdouble, a3: ptr cdouble, a4: ptr cdouble, a5: ptr cdouble, a6: ptr cdouble) {.impgrC.}
proc gr_camerainteraction*(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble) {.impgrC.}

proc gr_inqwindow3d*(a1: ptr cdouble, a2: ptr cdouble, a3: ptr cdouble, a4: ptr cdouble, a5: ptr cdouble, a6: ptr cdouble) {.impgrC.}
proc gr_setscalefactors3d*(a1: cdouble, a2: cdouble, a3: cdouble) {.impgrC.}
proc gr_inqscalefactors3d*(a1: ptr cdouble, a2: ptr cdouble, a3: ptr cdouble) {.impgrC.}
proc gr_transformationinterfaceforrepl*(a1: cdouble, a2: cdouble, a3: cdouble, a4: cdouble) {.impgrC.}

