# Resetting /home/jose/src/gr.nim/src/wrapper/build
# Importing /home/jose/src/gr.nim/src/wrapper/build/lib/gr3/gr3.h
# Generated at 2020-04-22T23:22:54+02:00
# Command line:
#   /home/jose/.nimble/pkgs/nimterop-#head/nimterop/toast --preprocess --pnim --dynlib=dynlibFile --nim:/home/jose/.choosenim/toolchains/nim-1.2.0/bin/nim /home/jose/src/gr.nim/src/wrapper/build/lib/gr3/gr3.h

{.hint[ConvFromXtoItselfNotNeeded]: off.}

import nimterop/types

when defined(windows):
  const dynlibFile3 = "libGR3.dll"

elif defined(linux):
  const dynlibFile3 = "/usr/gr/lib/libGR3.so"

const

  # !\file gr3.h
  #  * The gr3 header
  # 
  # !
  #  * These constants can be used to specify various properties
  #  * when calling gr3_init().
  # 
  GR3_IA_END_OF_LIST* = 0
  GR3_IA_FRAMEBUFFER_WIDTH* = 1
  GR3_IA_FRAMEBUFFER_HEIGHT* = 2
  GR3_IA_NUM_THREADS* = 3

  # !
  #  * These contants are error codes returned by gr3 functions.
  # 
  GR3_ERROR_NONE* = 0
  GR3_ERROR_INVALID_VALUE* = 1
  GR3_ERROR_INVALID_ATTRIBUTE* = 2
  GR3_ERROR_INIT_FAILED* = 3
  GR3_ERROR_OPENGL_ERR* = 4
  GR3_ERROR_OUT_OF_MEM* = 5
  GR3_ERROR_NOT_INITIALIZED* = 6
  GR3_ERROR_CAMERA_NOT_INITIALIZED* = 7
  GR3_ERROR_UNKNOWN_FILE_EXTENSION* = 8
  GR3_ERROR_CANNOT_OPEN_FILE* = 9
  GR3_ERROR_EXPORT* = 10
  GR3_QUALITY_OPENGL_NO_SSAA* = 0
  GR3_QUALITY_OPENGL_2X_SSAA* = 2
  GR3_QUALITY_OPENGL_4X_SSAA* = 4
  GR3_QUALITY_OPENGL_8X_SSAA* = 8
  GR3_QUALITY_OPENGL_16X_SSAA* = 16
  GR3_QUALITY_POVRAY_NO_SSAA* = 1
  GR3_QUALITY_POVRAY_2X_SSAA* = 3
  GR3_QUALITY_POVRAY_4X_SSAA* = 5
  GR3_QUALITY_POVRAY_8X_SSAA* = 9
  GR3_QUALITY_POVRAY_16X_SSAA* = 17
  GR3_DRAWABLE_OPENGL* = 1
  GR3_DRAWABLE_GKS* = 2
  GR3_PROJECTION_PERSPECTIVE* = 0
  GR3_PROJECTION_PARALLEL* = 1
  GR3_PROJECTION_ORTHOGRAPHIC* = 2
  GR3_SURFACE_DEFAULT* = 0
  GR3_SURFACE_NORMALS* = 1
  GR3_SURFACE_FLAT* = 2
  GR3_SURFACE_GRTRANSFORM* = 4
  GR3_SURFACE_GRCOLOR* = 8
  GR3_SURFACE_GRZSHADED* = 16
  GR_VOLUME_EMISSION* = 0
  GR_VOLUME_ABSORPTION* = 1
  GR_VOLUME_MIP* = 2

{.pragma: impgr3, importc.}
{.pragma: impgr3C, impgr3, cdecl, dynlib: dynlibFile3.}

type
  gr3_coord_t* {.bycopy.} = object
    x*: cfloat
    y*: cfloat
    z*: cfloat
  gr3_triangle_t* {.bycopy.} = object
    vertex*: array[3, gr3_coord_t]
    normal*: array[3, gr3_coord_t]


proc gr3_init*(attrib_list: ptr cint): cint {.impgr3C.}
proc gr3_free*(pointer: pointer) {.impgr3C.}
proc gr3_terminate*() {.impgr3C.}
proc gr3_geterror*(clear: cint, line: ptr cint, file: ptr cstring): cint {.impgr3C.}
proc gr3_getrenderpathstring*(): cstring {.impgr3C.}
proc gr3_geterrorstring*(error: cint): cstring {.impgr3C.}
# Declaration 'gr3_setlogcallback' skipped
# GR3API void gr3_setlogcallback(void (*gr3_log_func)(const char *log_message));
# Declaration 'gr3_setlogcallback' skipped
# Declaration 'gr3_log_func' skipped
# 
# Declaration 'log_message' skipped
proc gr3_clear*(): cint {.impgr3C.}
proc gr3_usecurrentframebuffer*() {.impgr3C.}
proc gr3_useframebuffer*(framebuffer: cuint) {.impgr3C.}
proc gr3_setquality*(quality: cint): cint {.impgr3C.}
proc gr3_getimage*(width: cint, height: cint, use_alpha: cint, pixels: cstring): cint {.impgr3C.}
proc gr3_export*(filename: cstring, width: cint, height: cint): cint {.impgr3C.}
proc gr3_drawimage*(xmin: cfloat, xmax: cfloat, ymin: cfloat, ymax: cfloat, width: cint, height: cint, drawable_type: cint): cint {.impgr3C.}
proc gr3_createmesh_nocopy*(mesh: ptr cint, n: cint, vertices: ptr cfloat, normals: ptr cfloat, colors: ptr cfloat): cint {.impgr3C.}
proc gr3_createmesh*(mesh: ptr cint, n: cint, vertices: ptr cfloat, normals: ptr cfloat, colors: ptr cfloat): cint {.impgr3C.}
proc gr3_createindexedmesh_nocopy*(mesh: ptr cint, number_of_vertices: cint, vertices: ptr cfloat, normals: ptr cfloat, colors: ptr cfloat, number_of_indices: cint, indices: ptr cint): cint {.impgr3C.}
proc gr3_createindexedmesh*(mesh: ptr cint, number_of_vertices: cint, vertices: ptr cfloat, normals: ptr cfloat, colors: ptr cfloat, number_of_indices: cint, indices: ptr cint): cint {.impgr3C.}
proc gr3_drawmesh*(mesh: cint, n: cint, positions: ptr cfloat, directions: ptr cfloat, ups: ptr cfloat, colors: ptr cfloat, scales: ptr cfloat) {.impgr3C.}
proc gr3_deletemesh*(mesh: cint) {.impgr3C.}
proc gr3_cameralookat*(camera_x: cfloat, camera_y: cfloat, camera_z: cfloat, center_x: cfloat, center_y: cfloat, center_z: cfloat, up_x: cfloat, up_y: cfloat, up_z: cfloat) {.impgr3C.}
proc gr3_setcameraprojectionparameters*(vertical_field_of_view: cfloat, zNear: cfloat, zFar: cfloat): cint {.impgr3C.}
proc gr3_getcameraprojectionparameters*(vfov: ptr cfloat, znear: ptr cfloat, zfar: ptr cfloat): cint {.impgr3C.}
proc gr3_setlightdirection*(x: cfloat, y: cfloat, z: cfloat) {.impgr3C.}
proc gr3_setbackgroundcolor*(red: cfloat, green: cfloat, blue: cfloat, alpha: cfloat) {.impgr3C.}
proc gr3_createheightmapmesh*(heightmap: ptr cfloat, num_columns: cint, num_rows: cint): cint {.impgr3C.}
proc gr3_drawheightmap*(heightmap: ptr cfloat, num_columns: cint, num_rows: cint, positions: ptr cfloat, scales: ptr cfloat) {.impgr3C.}
proc gr3_drawconemesh*(n: cint, positions: ptr cfloat, directions: ptr cfloat, colors: ptr cfloat, radii: ptr cfloat, lengths: ptr cfloat) {.impgr3C.}
proc gr3_drawcylindermesh*(n: cint, positions: ptr cfloat, directions: ptr cfloat, colors: ptr cfloat, radii: ptr cfloat, lengths: ptr cfloat) {.impgr3C.}
proc gr3_drawspheremesh*(n: cint, positions: ptr cfloat, colors: ptr cfloat, radii: ptr cfloat) {.impgr3C.}
proc gr3_drawcubemesh*(n: cint, positions: ptr cfloat, directions: ptr cfloat, ups: ptr cfloat, colors: ptr cfloat, scales: ptr cfloat) {.impgr3C.}
proc gr3_setobjectid*(id: cint) {.impgr3C.}
proc gr3_selectid*(x: cint, y: cint, width: cint, height: cint, selection_id: ptr cint): cint {.impgr3C.}
proc gr3_getviewmatrix*(m: ptr cfloat) {.impgr3C.}
proc gr3_setviewmatrix*(m: ptr cfloat) {.impgr3C.}
proc gr3_getprojectiontype*(): cint {.impgr3C.}
proc gr3_setprojectiontype*(`type`: cint) {.impgr3C.}
proc gr3_triangulate*(data: ptr cushort, isolevel: cushort, dim_x: cuint, dim_y: cuint, dim_z: cuint, stride_x: cuint, stride_y: cuint, stride_z: cuint, step_x: cdouble, step_y: cdouble, step_z: cdouble, offset_x: cdouble, offset_y: cdouble, offset_z: cdouble, triangles_p: ptr ptr gr3_triangle_t): cuint {.impgr3C.}
proc gr3_triangulateindexed*(data: ptr cushort, isolevel: cushort, dim_x: cuint, dim_y: cuint, dim_z: cuint, stride_x: cuint, stride_y: cuint, stride_z: cuint, step_x: cdouble, step_y: cdouble, step_z: cdouble, offset_x: cdouble, offset_y: cdouble, offset_z: cdouble, num_vertices: ptr cuint, vertices: ptr ptr gr3_coord_t, normals: ptr ptr gr3_coord_t, num_indices: ptr cuint, indices: ptr ptr cuint) {.impgr3C.}
proc gr3_createisosurfacemesh*(mesh: ptr cint, data: ptr cushort, isolevel: cushort, dim_x: cuint, dim_y: cuint, dim_z: cuint, stride_x: cuint, stride_y: cuint, stride_z: cuint, step_x: cdouble, step_y: cdouble, step_z: cdouble, offset_x: cdouble, offset_y: cdouble, offset_z: cdouble): cint {.impgr3C.}
proc gr3_createsurfacemesh*(mesh: ptr cint, nx: cint, ny: cint, px: ptr cfloat, py: ptr cfloat, pz: ptr cfloat, option: cint): cint {.impgr3C.}
proc gr3_drawmesh_grlike*(mesh: cint, n: cint, positions: ptr cfloat, directions: ptr cfloat, ups: ptr cfloat, colors: ptr cfloat, scales: ptr cfloat) {.impgr3C.}
proc gr3_drawsurface*(mesh: cint) {.impgr3C.}
proc gr3_surface*(nx: cint, ny: cint, px: ptr cfloat, py: ptr cfloat, pz: ptr cfloat, option: cint) {.impgr3C.}
proc gr3_drawtubemesh*(n: cint, points: ptr cfloat, colors: ptr cfloat, radii: ptr cfloat, num_steps: cint, num_segments: cint): cint {.impgr3C.}
proc gr3_createtubemesh*(mesh: ptr cint, n: cint, points: ptr cfloat, colors: ptr cfloat, radii: ptr cfloat, num_steps: cint, num_segments: cint): cint {.impgr3C.}
proc gr3_drawspins*(n: cint, positions: ptr cfloat, directions: ptr cfloat, colors: ptr cfloat, cone_radius: cfloat, cylinder_radius: cfloat, cone_height: cfloat, cylinder_height: cfloat) {.impgr3C.}
proc gr3_drawmolecule*(n: cint, positions: ptr cfloat, colors: ptr cfloat, radii: ptr cfloat, bond_radius: cfloat, bond_color: array[3, cfloat], bond_delta: cfloat) {.impgr3C.}
proc gr3_createxslicemesh*(mesh: ptr cint, data: ptr cushort, ix: cuint, dim_x: cuint, dim_y: cuint, dim_z: cuint, stride_x: cuint, stride_y: cuint, stride_z: cuint, step_x: cdouble, step_y: cdouble, step_z: cdouble, offset_x: cdouble, offset_y: cdouble, offset_z: cdouble) {.impgr3C.}
proc gr3_createyslicemesh*(mesh: ptr cint, data: ptr cushort, iy: cuint, dim_x: cuint, dim_y: cuint, dim_z: cuint, stride_x: cuint, stride_y: cuint, stride_z: cuint, step_x: cdouble, step_y: cdouble, step_z: cdouble, offset_x: cdouble, offset_y: cdouble, offset_z: cdouble) {.impgr3C.}
proc gr3_createzslicemesh*(mesh: ptr cint, data: ptr cushort, iz: cuint, dim_x: cuint, dim_y: cuint, dim_z: cuint, stride_x: cuint, stride_y: cuint, stride_z: cuint, step_x: cdouble, step_y: cdouble, step_z: cdouble, offset_x: cdouble, offset_y: cdouble, offset_z: cdouble) {.impgr3C.}
proc gr3_drawxslicemesh*(data: ptr cushort, ix: cuint, dim_x: cuint, dim_y: cuint, dim_z: cuint, stride_x: cuint, stride_y: cuint, stride_z: cuint, step_x: cdouble, step_y: cdouble, step_z: cdouble, offset_x: cdouble, offset_y: cdouble, offset_z: cdouble) {.impgr3C.}
proc gr3_drawyslicemesh*(data: ptr cushort, iy: cuint, dim_x: cuint, dim_y: cuint, dim_z: cuint, stride_x: cuint, stride_y: cuint, stride_z: cuint, step_x: cdouble, step_y: cdouble, step_z: cdouble, offset_x: cdouble, offset_y: cdouble, offset_z: cdouble) {.impgr3C.}
proc gr3_drawzslicemesh*(data: ptr cushort, iz: cuint, dim_x: cuint, dim_y: cuint, dim_z: cuint, stride_x: cuint, stride_y: cuint, stride_z: cuint, step_x: cdouble, step_y: cdouble, step_z: cdouble, offset_x: cdouble, offset_y: cdouble, offset_z: cdouble) {.impgr3C.}
proc gr3_drawtrianglesurface*(n: cint, triangles: ptr cfloat) {.impgr3C.}
proc gr_volume*(nx: cint, ny: cint, nz: cint, data: ptr cdouble, algorithm: cint, dmin_ptr: ptr cdouble, dmax_ptr: ptr cdouble) {.impgr3C.}
proc gr3_setorthographicprojection*(left: cfloat, right: cfloat, bottom: cfloat, top: cfloat, znear: cfloat, zfar: cfloat) {.impgr3C.}

