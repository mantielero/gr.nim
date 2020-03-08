import nimterop/types   # Provides "defineEnum"




const
  headergr = "gr.h"
  libName = "/usr/gr/lib/libGR.so"
  #_GR_H_* = ""
  #DLLEXPORT* = ""
  GR_PROJECTION_DEFAULT* = 0
  GR_PROJECTION_ORTHOGRAPHIC* = 1
  GR_PROJECTION_PERSPECTIVE* = 2
  

#{.pragma: impgr, importc, header: headergr.}

 
type
  vertex_t*   = object #{.impgr.}
    x*: cdouble
    y*: cdouble
  
 

proc gr_initgr*()    {.importc,dynlib: libName.}
proc gr_opengks*()    {.importc,dynlib: libName.}
proc gr_closegks*()    {.importc,dynlib: libName.}
proc gr_inqdspsize*(a:ptr cdouble, b:ptr cdouble, c:ptr cint, d:ptr cint)    {.importc,dynlib: libName.}
proc gr_openws*(a:cint, b:cstring, c:cint)    {.importc,dynlib: libName.}
proc gr_closews*(a:cint)    {.importc,dynlib: libName.}
proc gr_activatews*(a:cint)    {.importc,dynlib: libName.}
proc gr_deactivatews*(a:cint)    {.importc,dynlib: libName.}
proc gr_configurews*()    {.importc,dynlib: libName.}
proc gr_clearws*()    {.importc,dynlib: libName.}
proc gr_updatews*()    {.importc,dynlib: libName.}
proc gr_polyline*(a:cint, b:ptr cdouble, c:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_polymarker*(a:cint, b:ptr cdouble, c:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_text*(a:cdouble, b:cdouble, c:cstring)    {.importc,dynlib: libName.}
proc gr_inqtext*(a:cdouble, b:cdouble, c:cstring, d:ptr cdouble, e:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_fillarea*(a:cint, b:ptr cdouble, c:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_cellarray*(a:cdouble, b:cdouble, c:cdouble, d:cdouble, e:cint, f:cint, g:cint, h:cint, i:cint, j:cint, k:ptr cint)    {.importc,dynlib: libName.}
proc gr_nonuniformcellarray*(a:ptr cdouble, b:ptr cdouble, c:cint, d:cint, e:cint, f:cint, g:cint, h:cint, i:ptr cint)    {.importc,dynlib: libName.}
proc gr_polarcellarray*(a:cdouble, b:cdouble, c:cdouble, d:cdouble, e:cdouble, f:cdouble, g:cint, h:cint, i:cint, j:cint, k:cint, l:cint, m:ptr cint)    {.importc,dynlib: libName.}
proc gr_gdp*(a:cint, b:ptr cdouble, c:ptr cdouble, d:cint, e:cint, f:ptr cint)    {.importc,dynlib: libName.}
proc gr_spline*(a:cint, b:ptr cdouble, c:ptr cdouble, d:cint, e:cint)    {.importc,dynlib: libName.}
proc gr_gridit*(a:cint, b:ptr cdouble, c:ptr cdouble, d:ptr cdouble, e:cint, f:cint, g:ptr cdouble, h:ptr cdouble, i:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_setlinetype*(a:cint)    {.importc,dynlib: libName.}
proc gr_inqlinetype*(a:ptr cint)    {.importc,dynlib: libName.}
proc gr_setlinewidth*(a:cdouble)    {.importc,dynlib: libName.}
proc gr_inqlinewidth*(a:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_setlinecolorind*(a:cint)    {.importc,dynlib: libName.}
proc gr_inqlinecolorind*(a:ptr cint)    {.importc,dynlib: libName.}
proc gr_setmarkertype*(a:cint)    {.importc,dynlib: libName.}
proc gr_inqmarkertype*(a:ptr cint)    {.importc,dynlib: libName.}
proc gr_setmarkersize*(a:cdouble)    {.importc,dynlib: libName.}
proc gr_inqmarkersize*(a:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_setmarkercolorind*(a:cint)    {.importc,dynlib: libName.}
proc gr_inqmarkercolorind*(a:ptr cint)    {.importc,dynlib: libName.}
proc gr_settextfontprec*(a:cint, b:cint)    {.importc,dynlib: libName.}
proc gr_setcharexpan*(a:cdouble)    {.importc,dynlib: libName.}
proc gr_setcharspace*(a:cdouble)    {.importc,dynlib: libName.}
proc gr_settextcolorind*(a:cint)    {.importc,dynlib: libName.}
proc gr_setcharheight*(a:cdouble)    {.importc,dynlib: libName.}
proc gr_setcharup*(a:cdouble, b:cdouble)    {.importc,dynlib: libName.}
proc gr_settextpath*(a:cint)    {.importc,dynlib: libName.}
proc gr_settextalign*(a:cint, b:cint)    {.importc,dynlib: libName.}
proc gr_setfillintstyle*(a:cint)    {.importc,dynlib: libName.}
proc gr_inqfillintstyle*(a:ptr cint)    {.importc,dynlib: libName.}
proc gr_setfillstyle*(a:cint)    {.importc,dynlib: libName.}
proc gr_inqfillstyle*(a:ptr cint)    {.importc,dynlib: libName.}
proc gr_setfillcolorind*(a:cint)    {.importc,dynlib: libName.}
proc gr_inqfillcolorind*(a:ptr cint)    {.importc,dynlib: libName.}
proc gr_setcolorrep*(a:cint, b:cdouble, c:cdouble, d:cdouble)    {.importc,dynlib: libName.}
proc gr_setwindow*(a:cdouble, b:cdouble, c:cdouble, d:cdouble)    {.importc,dynlib: libName.}
proc gr_inqwindow*(a:ptr cdouble, b:ptr cdouble, c:ptr cdouble, d:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_setviewport*(a:cdouble, b:cdouble, c:cdouble, d:cdouble)    {.importc,dynlib: libName.}
proc gr_inqviewport*(a:ptr cdouble, b:ptr cdouble, c:ptr cdouble, d:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_selntran*(a:cint)    {.importc,dynlib: libName.}
proc gr_setclip*(a:cint)    {.importc,dynlib: libName.}
proc gr_setwswindow*(a:cdouble, b:cdouble, c:cdouble, d:cdouble)    {.importc,dynlib: libName.}
proc gr_setwsviewport*(a:cdouble, b:cdouble, c:cdouble, d:cdouble)    {.importc,dynlib: libName.}
proc gr_createseg*(a:cint)    {.importc,dynlib: libName.}
proc gr_copysegws*(a:cint)    {.importc,dynlib: libName.}
proc gr_redrawsegws*()    {.importc,dynlib: libName.}
proc gr_setsegtran*(a:cint, b:cdouble, c:cdouble, d:cdouble, e:cdouble, f:cdouble, g:cdouble, h:cdouble)    {.importc,dynlib: libName.}
proc gr_closeseg*()    {.importc,dynlib: libName.}
proc gr_emergencyclosegks*()    {.importc,dynlib: libName.}
proc gr_updategks*()    {.importc,dynlib: libName.}
proc gr_setspace*(a:cdouble, b:cdouble, c:cint, d:cint):cint    {.importc,dynlib: libName.}
proc gr_inqspace*(a:ptr cdouble, b:ptr cdouble, c:ptr cint, d:ptr cint)    {.importc,dynlib: libName.}
proc gr_setscale*(a:cint):cint    {.importc,dynlib: libName.}
proc gr_inqscale*(a:ptr cint)    {.importc,dynlib: libName.}
proc gr_textext*(a:cdouble, b:cdouble, c:cstring):cint    {.importc,dynlib: libName.}
proc gr_inqtextext*(a:cdouble, b:cdouble, c:cstring, d:ptr cdouble, e:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_axes*(a:cdouble, b:cdouble, c:cdouble, d:cdouble, e:cint, f:cint, g:cdouble)    {.importc,dynlib: libName.}
proc gr_grid*(a:cdouble, b:cdouble, c:cdouble, d:cdouble, e:cint, f:cint)    {.importc,dynlib: libName.}
proc gr_grid3d*(a:cdouble, b:cdouble, c:cdouble, d:cdouble, e:cdouble, f:cdouble, g:cint, h:cint, i:cint)    {.importc,dynlib: libName.}
proc gr_verrorbars*(a:cint, b:ptr cdouble, c:ptr cdouble, d:ptr cdouble, e:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_herrorbars*(a:cint, b:ptr cdouble, c:ptr cdouble, d:ptr cdouble, e:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_polyline3d*(a:cint, b:ptr cdouble, c:ptr cdouble, d:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_polymarker3d*(a:cint, b:ptr cdouble, c:ptr cdouble, d:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_axes3d*(a:cdouble, b:cdouble, c:cdouble, d:cdouble, e:cdouble, f:cdouble, g:cint, h:cint, i:cint, j:cdouble)    {.importc,dynlib: libName.}
proc gr_titles3d*(a:cstring, b:cstring, c:cstring)    {.importc,dynlib: libName.}
proc gr_surface*(a:cint, b:cint, c:ptr cdouble, d:ptr cdouble, e:ptr cdouble, f:cint)    {.importc,dynlib: libName.}
proc gr_contour*(a:cint, b:cint, c:cint, d:ptr cdouble, e:ptr cdouble, f:ptr cdouble, g:ptr cdouble, h:cint)    {.importc,dynlib: libName.}
proc gr_contourf*(a:cint, b:cint, c:cint, d:ptr cdouble, e:ptr cdouble, f:ptr cdouble, g:ptr cdouble, h:cint)    {.importc,dynlib: libName.}
proc gr_tricontour*(a:cint, b:ptr cdouble, c:ptr cdouble, d:ptr cdouble, e:cint, f:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_hexbin*(a:cint, b:ptr cdouble, c:ptr cdouble, d:cint):cint    {.importc,dynlib: libName.}
proc gr_setcolormap*(a:cint)    {.importc,dynlib: libName.}
proc gr_inqcolormap*(a:ptr cint)    {.importc,dynlib: libName.}
proc gr_setcolormapfromrgb*(n:cint, r:ptr cdouble, g:ptr cdouble, b:ptr cdouble, x:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_colorbar*()    {.importc,dynlib: libName.}
proc gr_inqcolor*(a:cint, b:ptr cint)    {.importc,dynlib: libName.}
proc gr_inqcolorfromrgb*(a:cdouble, b:cdouble, c:cdouble):cint    {.importc,dynlib: libName.}
proc gr_hsvtorgb*(h:cdouble, s:cdouble, v:cdouble, r:ptr cdouble, g:ptr cdouble, b:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_tick*(a:cdouble, b:cdouble):cdouble    {.importc,dynlib: libName.}
proc gr_validaterange*(a:cdouble, b:cdouble):cint    {.importc,dynlib: libName.}
proc gr_adjustlimits*(a:ptr cdouble, b:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_adjustrange*(a:ptr cdouble, b:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_beginprint*(a:cstring)    {.importc,dynlib: libName.}
proc gr_beginprintext*(a:cstring, b:cstring, c:cstring, d:cstring)    {.importc,dynlib: libName.}
proc gr_endprint*()    {.importc,dynlib: libName.}
proc gr_ndctowc*(a:ptr cdouble, b:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_wctondc*(a:ptr cdouble, b:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_wc3towc*(a:ptr cdouble, b:ptr cdouble, c:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_drawrect*(a:cdouble, b:cdouble, c:cdouble, d:cdouble)    {.importc,dynlib: libName.}
proc gr_fillrect*(a:cdouble, b:cdouble, c:cdouble, d:cdouble)    {.importc,dynlib: libName.}
proc gr_drawarc*(a:cdouble, b:cdouble, c:cdouble, d:cdouble, e:cdouble, f:cdouble)    {.importc,dynlib: libName.}
proc gr_fillarc*(a:cdouble, b:cdouble, c:cdouble, d:cdouble, e:cdouble, f:cdouble)    {.importc,dynlib: libName.}
proc gr_drawpath*(a:cint, b:ptr vertex_t, c:ptr cuchar, d:cint)    {.importc,dynlib: libName.}
proc gr_setarrowstyle*(a:cint)    {.importc,dynlib: libName.}
proc gr_setarrowsize*(a:cdouble)    {.importc,dynlib: libName.}
proc gr_drawarrow*(a:cdouble, b:cdouble, c:cdouble, d:cdouble)    {.importc,dynlib: libName.}
proc gr_readimage*(a:cstring, b:ptr cint, c:ptr cint, d:ptr ptr cint):cint    {.importc,dynlib: libName.}
proc gr_drawimage*(a:cdouble, b:cdouble, c:cdouble, d:cdouble, e:cint, f:cint, g:ptr cint, h:cint)    {.importc,dynlib: libName.}
proc gr_importgraphics*(a:cstring):cint    {.importc,dynlib: libName.}
proc gr_setshadow*(a:cdouble, b:cdouble, c:cdouble)    {.importc,dynlib: libName.}
proc gr_settransparency*(a:cdouble)    {.importc,dynlib: libName.}
proc gr_setcoordxform*(a:cdouble)    {.importc,dynlib: libName.}
proc gr_begingraphics*(a:cstring)    {.importc,dynlib: libName.}
proc gr_endgraphics*()    {.importc,dynlib: libName.}
proc gr_getgraphics*():cstring    {.importc,dynlib: libName.}
proc gr_drawgraphics*(a:cstring):cint    {.importc,dynlib: libName.}
proc gr_mathtex*(a:cdouble, b:cdouble, c:cstring)    {.importc,dynlib: libName.}
proc gr_inqmathtex*(a:cdouble, b:cdouble, c:cstring, d:ptr cdouble, e:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_beginselection*(a:cint, b:cint)    {.importc,dynlib: libName.}
proc gr_endselection*()    {.importc,dynlib: libName.}
proc gr_moveselection*(a:cdouble, b:cdouble)    {.importc,dynlib: libName.}
proc gr_resizeselection*(a:cint, b:cdouble, c:cdouble)    {.importc,dynlib: libName.}
proc gr_inqbbox*(a:ptr cdouble, b:ptr cdouble, c:ptr cdouble, d:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_precision*():cdouble    {.importc,dynlib: libName.}
proc gr_setregenflags*(a:cint)    {.importc,dynlib: libName.}
proc gr_inqregenflags*():cint    {.importc,dynlib: libName.}
proc gr_savestate*()    {.importc,dynlib: libName.}
proc gr_restorestate*()    {.importc,dynlib: libName.}
proc gr_selectcontext*(a:cint)    {.importc,dynlib: libName.}
proc gr_destroycontext*(a:cint)    {.importc,dynlib: libName.}
proc gr_uselinespec*(a:cstring):cint    {.importc,dynlib: libName.}
proc gr_delaunay*(a:cint, b:ptr cdouble, c:ptr cdouble, d:ptr cint, e:ptr ptr cint)    {.importc,dynlib: libName.}
proc gr_reducepoints*(a:cint, b:ptr cdouble, c:ptr cdouble, d:cint, e:ptr cdouble, f:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_trisurface*(a:cint, b:ptr cdouble, c:ptr cdouble, d:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_gradient*(a:cint, b:cint, c:ptr cdouble, d:ptr cdouble, e:ptr cdouble, f:ptr cdouble, g:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_quiver*(a:cint, b:cint, c:ptr cdouble, d:ptr cdouble, e:ptr cdouble, f:ptr cdouble, g:cint)    {.importc,dynlib: libName.}
proc gr_interp2*(nx:cint, ny:cint, x:ptr cdouble, y:ptr cdouble, z:ptr cdouble, nxq:cint, nyq:cint, xq:ptr cdouble, yq:ptr cdouble, zq:ptr cdouble, `method`:cint, extrapval:cdouble)    {.importc,dynlib: libName.}
proc gr_version*():cstring    {.importc,dynlib: libName.}
proc gr_shade*(a:cint, b:ptr cdouble, c:ptr cdouble, d:cint, e:cint, f:ptr cdouble, g:cint, h:cint, i:ptr cint)    {.importc,dynlib: libName.}
proc gr_shadepoints*(a:cint, b:ptr cdouble, c:ptr cdouble, d:cint, e:cint, f:cint)    {.importc,dynlib: libName.}
proc gr_shadelines*(a:cint, b:ptr cdouble, c:ptr cdouble, d:cint, e:cint, f:cint)    {.importc,dynlib: libName.}
proc gr_panzoom*(a:cdouble, b:cdouble, c:cdouble, d:cdouble, e:ptr cdouble, f:ptr cdouble, g:ptr cdouble, h:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_setresamplemethod*(a:cuint)    {.importc,dynlib: libName.}
proc gr_inqresamplemethod*(a:ptr cuint)    {.importc,dynlib: libName.}
proc gr_path*(a:cint, b:ptr cdouble, c:ptr cdouble, d:cstring)    {.importc,dynlib: libName.}
proc gr_setborderwidth*(a:cdouble)    {.importc,dynlib: libName.}
proc gr_inqborderwidth*(a:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_setbordercolorind*(a:cint)    {.importc,dynlib: libName.}
proc gr_inqbordercolorind*(a:ptr cint)    {.importc,dynlib: libName.}
proc gr_setprojectiontype*(a:cint)    {.importc,dynlib: libName.}
proc gr_setperspectiveprojection*(a:cdouble, b:cdouble, c:cdouble)    {.importc,dynlib: libName.}
proc gr_settransformationparameters*(a:cdouble, b:cdouble, c:cdouble, d:cdouble, e:cdouble, f:cdouble, g:cdouble, h:cdouble, i:cdouble)    {.importc,dynlib: libName.}
proc gr_setorthographicprojection*(a:cdouble, b:cdouble, c:cdouble, d:cdouble, e:cdouble, f:cdouble)    {.importc,dynlib: libName.}
proc gr_inqprojectiontype*(a:ptr cint)    {.importc,dynlib: libName.}
proc gr_inqtransformationparameters*(a:ptr cdouble, b:ptr cdouble, c:ptr cdouble, d:ptr cdouble, e:ptr cdouble, f:ptr cdouble, g:ptr cdouble, h:ptr cdouble, i:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_inqperspectiveprojection*(a:ptr cdouble, b:ptr cdouble, c:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_inqorthographicprojection*(a:ptr cdouble, b:ptr cdouble, c:ptr cdouble, d:ptr cdouble, e:ptr cdouble, f:ptr cdouble)    {.importc,dynlib: libName.}
proc gr_camerainteraction*(a:cdouble, b:cdouble, c:cdouble, d:cdouble)    {.importc,dynlib: libName.}
proc gr_setwindow3d*(a:cdouble, b:cdouble, c:cdouble, d:cdouble, e:cdouble, f:cdouble)    {.importc,dynlib: libName.}
proc gr_inqwindow3d*(a:ptr cdouble, b:ptr cdouble, c:ptr cdouble, d:ptr cdouble, e:ptr cdouble, f:ptr cdouble)    {.importc,dynlib: libName.}

