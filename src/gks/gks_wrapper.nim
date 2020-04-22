 {.deadCodeElim: on.}
when defined(windows):
  const
    libname* = "libGKS.dll"
elif defined(macosx):
  const
    libname* = "libGKS.dylib"
else:
  const
    libname* = "libGKS.so"
when defined(_WIN32):
  template __declspec*(dllexport: untyped): void =
    nil

else:
  const
    DLLEXPORT* = true
##  default connection identifier

const
  GKS_K_CONID_DEFAULT* = nil

##  default workstation type

const
  GKS_K_WSTYPE_DEFAULT* = 0

##  standard workstation types

const
  GKS_K_WSTYPE_MO* = 2
  GKS_K_WSTYPE_MI* = 3
  GKS_K_WSTYPE_WISS* = 5

##  aspect source flag

const
  GKS_K_ASF_BUNDLED* = 0
  GKS_K_ASF_INDIVIDUAL* = 1

##  clear control flag

const
  GKS_K_CLEAR_CONDITIONALLY* = 0
  GKS_K_CLEAR_ALWAYS* = 1

##  clipping indicator

const
  GKS_K_NOCLIP* = 0
  GKS_K_CLIP* = 1

##  coordinate switch

const
  GKS_K_COORDINATES_WC* = 0
  GKS_K_COORDINATES_NDC* = 1

##  device coordinate units

const
  GKS_K_METERS* = 0
  GKS_K_OTHER_UNITS* = 1

##  fill area interior style

const
  GKS_K_INTSTYLE_HOLLOW* = 0
  GKS_K_INTSTYLE_SOLID* = 1
  GKS_K_INTSTYLE_PATTERN* = 2
  GKS_K_INTSTYLE_HATCH* = 3
  GKS_K_INTSTYLE_SOLID_WITH_BORDER* = 4

##  input device status

const
  GKS_K_STATUS_NONE* = 0
  GKS_K_STATUS_OK* = 1

##  level of GKS

const
  GKS_K_LEVEL_0A* = 0
  GKS_K_LEVEL_0B* = 1
  GKS_K_LEVEL_0C* = 2
  GKS_K_LEVEL_1A* = 3
  GKS_K_LEVEL_1B* = 4
  GKS_K_LEVEL_1C* = 5
  GKS_K_LEVEL_2A* = 6
  GKS_K_LEVEL_2B* = 7
  GKS_K_LEVEL_2C* = 8

##  operating state value

const
  GKS_K_GKCL* = 0
  GKS_K_GKOP* = 1
  GKS_K_WSOP* = 2
  GKS_K_WSAC* = 3
  GKS_K_SGOP* = 4

##  regeneration flag

const
  GKS_K_POSTPONE_FLAG* = 0
  GKS_K_PERFORM_FLAG* = 1
  GKS_K_WRITE_PAGE_FLAG* = 2

##  text alignment horizontal

const
  GKS_K_TEXT_HALIGN_NORMAL* = 0
  GKS_K_TEXT_HALIGN_LEFT* = 1
  GKS_K_TEXT_HALIGN_CENTER* = 2
  GKS_K_TEXT_HALIGN_RIGHT* = 3

##  text alignment vertical

const
  GKS_K_TEXT_VALIGN_NORMAL* = 0
  GKS_K_TEXT_VALIGN_TOP* = 1
  GKS_K_TEXT_VALIGN_CAP* = 2
  GKS_K_TEXT_VALIGN_HALF* = 3
  GKS_K_TEXT_VALIGN_BASE* = 4
  GKS_K_TEXT_VALIGN_BOTTOM* = 5

##  text path

const
  GKS_K_TEXT_PATH_RIGHT* = 0
  GKS_K_TEXT_PATH_LEFT* = 1
  GKS_K_TEXT_PATH_UP* = 2
  GKS_K_TEXT_PATH_DOWN* = 3

##  text precision

const
  GKS_K_TEXT_PRECISION_STRING* = 0
  GKS_K_TEXT_PRECISION_CHAR* = 1
  GKS_K_TEXT_PRECISION_STROKE* = 2
  GKS_K_TEXT_PRECISION_OUTLINE* = 3

##  workstation category

const
  GKS_K_WSCAT_OUTPUT* = 0
  GKS_K_WSCAT_INPUT* = 1
  GKS_K_WSCAT_OUTIN* = 2
  GKS_K_WSCAT_WISS* = 3
  GKS_K_WSCAT_MO* = 4
  GKS_K_WSCAT_MI* = 5

##  workstation state

const
  GKS_K_WS_INACTIVE* = 0
  GKS_K_WS_ACTIVE* = 1

##  standard linetypes

const
  GKS_K_LINETYPE_SOLID* = 1
  GKS_K_LINETYPE_DASHED* = 2
  GKS_K_LINETYPE_DOTTED* = 3
  GKS_K_LINETYPE_DASHED_DOTTED* = 4

##  GKS specific linetypes

const
  GKS_K_LINETYPE_DASH_2_DOT* = -1
  GKS_K_LINETYPE_DASH_3_DOT* = -2
  GKS_K_LINETYPE_LONG_DASH* = -3
  GKS_K_LINETYPE_LONG_SHORT_DASH* = -4
  GKS_K_LINETYPE_SPACED_DASH* = -5
  GKS_K_LINETYPE_SPACED_DOT* = -6
  GKS_K_LINETYPE_DOUBLE_DOT* = -7
  GKS_K_LINETYPE_TRIPLE_DOT* = -8

##  standard markertypes

const
  GKS_K_MARKERTYPE_DOT* = 1
  GKS_K_MARKERTYPE_PLUS* = 2
  GKS_K_MARKERTYPE_ASTERISK* = 3
  GKS_K_MARKERTYPE_CIRCLE* = 4
  GKS_K_MARKERTYPE_DIAGONAL_CROSS* = 5

##  GKS specific markertypes

const
  GKS_K_MARKERTYPE_SOLID_CIRCLE* = -1
  GKS_K_MARKERTYPE_TRIANGLE_UP* = -2
  GKS_K_MARKERTYPE_SOLID_TRI_UP* = -3
  GKS_K_MARKERTYPE_TRIANGLE_DOWN* = -4
  GKS_K_MARKERTYPE_SOLID_TRI_DOWN* = -5
  GKS_K_MARKERTYPE_SQUARE* = -6
  GKS_K_MARKERTYPE_SOLID_SQUARE* = -7
  GKS_K_MARKERTYPE_BOWTIE* = -8
  GKS_K_MARKERTYPE_SOLID_BOWTIE* = -9
  GKS_K_MARKERTYPE_HOURGLASS* = -10
  GKS_K_MARKERTYPE_SOLID_HGLASS* = -11
  GKS_K_MARKERTYPE_DIAMOND* = -12
  GKS_K_MARKERTYPE_SOLID_DIAMOND* = -13
  GKS_K_MARKERTYPE_STAR* = -14
  GKS_K_MARKERTYPE_SOLID_STAR* = -15
  GKS_K_MARKERTYPE_TRI_UP_DOWN* = -16
  GKS_K_MARKERTYPE_SOLID_TRI_RIGHT* = -17
  GKS_K_MARKERTYPE_SOLID_TRI_LEFT* = -18
  GKS_K_MARKERTYPE_HOLLOW_PLUS* = -19
  GKS_K_MARKERTYPE_SOLID_PLUS* = -20
  GKS_K_MARKERTYPE_PENTAGON* = -21
  GKS_K_MARKERTYPE_HEXAGON* = -22
  GKS_K_MARKERTYPE_HEPTAGON* = -23
  GKS_K_MARKERTYPE_OCTAGON* = -24
  GKS_K_MARKERTYPE_STAR_4* = -25
  GKS_K_MARKERTYPE_STAR_5* = -26
  GKS_K_MARKERTYPE_STAR_6* = -27
  GKS_K_MARKERTYPE_STAR_7* = -28
  GKS_K_MARKERTYPE_STAR_8* = -29
  GKS_K_MARKERTYPE_VLINE* = -30
  GKS_K_MARKERTYPE_HLINE* = -31
  GKS_K_MARKERTYPE_OMARK* = -32

##  Type of output values set

const
  GKS_K_VALUE_SET* = 0
  GKS_K_VALUE_REALIZED* = 1

##  Resample flags

const
  GKS_K_UPSAMPLE_VERTICAL_DEFAULT* = 0x00000000
  GKS_K_UPSAMPLE_HORIZONTAL_DEFAULT* = 0x00000000
  GKS_K_DOWNSAMPLE_VERTICAL_DEFAULT* = 0x00000000
  GKS_K_DOWNSAMPLE_HORIZONTAL_DEFAULT* = 0x00000000
  GKS_K_UPSAMPLE_VERTICAL_NEAREST* = 0x00000001
  GKS_K_UPSAMPLE_HORIZONTAL_NEAREST* = 0x00000100
  GKS_K_DOWNSAMPLE_VERTICAL_NEAREST* = 0x00010000
  GKS_K_DOWNSAMPLE_HORIZONTAL_NEAREST* = 0x01000000
  GKS_K_UPSAMPLE_VERTICAL_LINEAR* = 0x00000002
  GKS_K_UPSAMPLE_HORIZONTAL_LINEAR* = 0x00000200
  GKS_K_DOWNSAMPLE_VERTICAL_LINEAR* = 0x00020000
  GKS_K_DOWNSAMPLE_HORIZONTAL_LINEAR* = 0x02000000
  GKS_K_UPSAMPLE_VERTICAL_LANCZOS* = 0x00000003
  GKS_K_UPSAMPLE_HORIZONTAL_LANCZOS* = 0x00000300
  GKS_K_DOWNSAMPLE_VERTICAL_LANCZOS* = 0x00030000
  GKS_K_DOWNSAMPLE_HORIZONTAL_LANCZOS* = 0x03000000
  GKS_K_RESAMPLE_DEFAULT* = (GKS_K_UPSAMPLE_VERTICAL_DEFAULT or
      GKS_K_UPSAMPLE_HORIZONTAL_DEFAULT or GKS_K_DOWNSAMPLE_VERTICAL_DEFAULT or
      GKS_K_DOWNSAMPLE_HORIZONTAL_DEFAULT)
  GKS_K_RESAMPLE_NEAREST* = (GKS_K_UPSAMPLE_VERTICAL_NEAREST or
      GKS_K_UPSAMPLE_HORIZONTAL_NEAREST or GKS_K_DOWNSAMPLE_VERTICAL_NEAREST or
      GKS_K_DOWNSAMPLE_HORIZONTAL_NEAREST)
  GKS_K_RESAMPLE_LINEAR* = (GKS_K_UPSAMPLE_VERTICAL_LINEAR or
      GKS_K_UPSAMPLE_HORIZONTAL_LINEAR or GKS_K_DOWNSAMPLE_VERTICAL_LINEAR or
      GKS_K_DOWNSAMPLE_HORIZONTAL_LINEAR)
  GKS_K_RESAMPLE_LANCZOS* = (GKS_K_UPSAMPLE_VERTICAL_LANCZOS or
      GKS_K_UPSAMPLE_HORIZONTAL_LANCZOS or GKS_K_DOWNSAMPLE_VERTICAL_LANCZOS or
      GKS_K_DOWNSAMPLE_HORIZONTAL_LANCZOS)

##  GKS generalized drawing primitive (GDP) function IDs

const
  GKS_K_GDP_DRAW_PATH* = 1

##  GKS error codes

const
  GKS_K_NO_ERROR* = 0
  GKS_K_ERROR* = 1

##  Simple types

type
  Gfile* = FILE
  Gchar* = char
  Gconn* = char
  Gfloat* = cdouble
  Gwstype* = cint
  Gint* = cint
  Guint* = cuint
  Glong* = clong

const
  GWC_DEF* = nil
  GCONID_DEFAULT* = nil
  GWS_DEFAULT* = nil
  GWS_DEF* = nil

##  Enumerations

type                          ##  aspect control flag
    ##  clipping indicator
    ##  clear control flag
    ##  co-ord switch
    ##  device co-ord units
    ##  fill area interior style
    ##  request status
    ##  line type - not standard
    ##  marker type - not standard
    ##  GKS operating state
    ##  regeneration flag
    ##  horiz text alignment component
    ##  text path
    ##  text precision
    ##  vert text alignment component
    ##  WS category
  Gasf* {.size: sizeof(cint).} = enum
    GBUNDLED, GINDIVIDUAL
  Gclip* {.size: sizeof(cint).} = enum
    GCLIP, GNOCLIP
  Gclrflag* {.size: sizeof(cint).} = enum
    GCONDITIONALLY, GALWAYS
  Gcsw* {.size: sizeof(cint).} = enum
    GWC, GNDC
  Gdevunits* {.size: sizeof(cint).} = enum
    GDC_METRES, GDC_OTHER
  Gflinter* {.size: sizeof(cint).} = enum
    GHOLLOW, GSOLID, GPATTERN, GHATCH
  Gistat* {.size: sizeof(cint).} = enum
    GOK, GNONE
  Glntype* {.size: sizeof(cint).} = enum
    GLN_TRIPLE_DOT = -8, GLN_DOUBLE_DOT, GLN_SPACED_DOT, GLN_SPACED_DASH,
    GLN_LONG_SHORT_DASH, GLN_LONG_DASH, GLN_DASH_3_DOT, GLN_DASH_2_DOT,
    GLN_SOLID = 1, GLN_DASHED, GLN_DOTTED, GLN_DASHDOT
  Gmktype* {.size: sizeof(cint).} = enum
    GMK_SOLID_DIAMOND = -13, GMK_DIAMOND, GMK_SOLID_HGLASS, GMK_HOURGLASS,
    GMK_SOLID_BOWTIE, GMK_BOWTIE, GMK_SOLID_SQUARE, GMK_SQUARE, GMK_SOLID_TRI_DOWN,
    GMK_TRIANGLE_DOWN, GMK_SOLID_TRI_UP, GMK_TRIANGLE_UP, GMK_SOLID_CIRCLE,
    GMK_POINT = 1, GMK_PLUS, GMK_STAR, GMK_O, GMK_X
  Gopst* {.size: sizeof(cint).} = enum
    GGKCL,                    ##  closed
    GGKOP,                    ##  open
    GWSOP,                    ##  workstation open
    GWSAC,                    ##  workstation active
    GSGOP                     ##  segment open
  Gregen* {.size: sizeof(cint).} = enum
    GPERFORM, GPOSTPONE
  Gtxhor* {.size: sizeof(cint).} = enum
    GAH_NORMAL, GAH_LEFT, GAH_CENTRE, GAH_RIGHT
  Gtxpath* {.size: sizeof(cint).} = enum
    GTP_RIGHT, GTP_LEFT, GTP_UP, GTP_DOWN
  Gtxprec* {.size: sizeof(cint).} = enum
    GP_STRING, GP_CHAR, GP_STROKE
  Gtxver* {.size: sizeof(cint).} = enum
    GAV_NORMAL, GAV_TOP, GAV_CAP, GAV_HALF, GAV_BASE, GAV_BOTTOM
  Gwscat* {.size: sizeof(cint).} = enum
    GOUTPUT, GINPUT, GOUTIN, GWISS, GMO, GMI

















##  Forward type definitions

type
  Gipoint* {.bycopy.} = object
    x*: Gint                   ##  integer point
    ##  x coordinate
    y*: Gint                   ##  y coordinate

  Gpoint* {.bycopy.} = object
    x*: Gfloat                 ##  coordinate point
    ##  X coordinate
    y*: Gfloat                 ##  Y coordinate

  Glimit* {.bycopy.} = object
    xmin*: Gfloat              ##  coordinate limits
    ##  x minimum limit
    xmax*: Gfloat              ##  x maximum limit
    ymin*: Gfloat              ##  y minimum limit
    ymax*: Gfloat              ##  y maximum limit

  Gtxfp* {.bycopy.} = object
    font*: Gint                ##  text facilities
    ##  text font
    prec*: Gtxprec             ##  text precision

  Gtxalign* {.bycopy.} = object
    hor*: Gtxhor               ##  text alignment
    ##  horizontal component
    ver*: Gtxver               ##  vertical component

  Grect* {.bycopy.} = object
    ul*: Gpoint                ##  coordinate rectangle pointer
    ##  upper left point
    lr*: Gpoint                ##  lower right point

  Gidim* {.bycopy.} = object
    x_dim*: Guint              ##  dimension in integer values
    ##  X dimension
    y_dim*: Guint              ##  Y dimension


##  Structs

type
  Gasfs* {.bycopy.} = object
    ln_type*: Gasf             ##  aspect source flags
    ##  line type
    ln_width*: Gasf            ##  line width
    ln_colour*: Gasf           ##  line colour
    mk_type*: Gasf             ##  marker type
    mk_size*: Gasf             ##  marker size
    mk_colour*: Gasf           ##  marker colour
    tx_fp*: Gasf               ##  text font and precision
    tx_exp*: Gasf              ##  text expansion
    tx_space*: Gasf            ##  text character spacing
    tx_colour*: Gasf           ##  text colour
    fl_inter*: Gasf            ##  fill area interior style
    fl_style*: Gasf            ##  fill area style index
    fl_colour*: Gasf           ##  fill area colour

  Gcobundl* {.bycopy.} = object
    red*: Gfloat               ##  colour bundle
    ##  red intensity
    green*: Gfloat             ##  green intensity
    blue*: Gfloat              ##  blue intensity

  Gcliprect* {.bycopy.} = object
    ind*: Gclip                ##  clipping rectangle
    ##  clipping indicator
    rec*: Glimit               ##  clipping rectangle

  Gdspsize* {.bycopy.} = object
    units*: Gdevunits          ##  display size
    ##  device coordinate units
    device*: Gpoint            ##  device coordinate unit size
    raster*: Gipoint           ##  raster unit size

  Gextent* {.bycopy.} = object
    concat*: Gpoint            ##  text extent
    ##  concatenation point
    corner_1*: Gpoint          ##  corner 1
    corner_2*: Gpoint          ##  corner 2
    corner_3*: Gpoint          ##  corner 3
    corner_4*: Gpoint          ##  corner 4

  Gloc* {.bycopy.} = object
    transform*: Gint           ##  locator data
    ##  normalization transformation number
    position*: Gpoint          ##  locator position

  Gqloc* {.bycopy.} = object
    status*: Gistat            ##  request locator
    ##  request status
    loc*: Gloc                 ##  locator data

  Gqstring* {.bycopy.} = object
    status*: Gistat            ##  request string
    ##  request status
    string*: ptr Gchar          ##  string data

  Gscale* {.bycopy.} = object
    x_scale*: Gfloat           ##  scale vector
    y_scale*: Gfloat

  Gtran* {.bycopy.} = object
    w*: Glimit                 ##  transformation
    ##  window
    v*: Glimit                 ##  viewport

  Ggksmit* {.bycopy.} = object
    `type`*: Gint              ##  metafile item information
    ##  item type
    length*: Gint              ##  item length


##  GKS function prototypes

proc gks_init_gks*() {.cdecl, importc: "gks_init_gks", dynlib: libname.}
proc gks_open_gks*(errfil: cint) {.cdecl, importc: "gks_open_gks", dynlib: libname.}
proc gks_close_gks*() {.cdecl, importc: "gks_close_gks", dynlib: libname.}
proc gks_open_ws*(wkid: cint; conid: cstring; wtype: cint) {.cdecl,
    importc: "gks_open_ws", dynlib: libname.}
proc gks_close_ws*(wkid: cint) {.cdecl, importc: "gks_close_ws", dynlib: libname.}
proc gks_activate_ws*(wkid: cint) {.cdecl, importc: "gks_activate_ws", dynlib: libname.}
proc gks_deactivate_ws*(wkid: cint) {.cdecl, importc: "gks_deactivate_ws",
                                   dynlib: libname.}
proc gks_configure_ws*(wkid: cint) {.cdecl, importc: "gks_configure_ws",
                                  dynlib: libname.}
proc gks_clear_ws*(wkid: cint; cofl: cint) {.cdecl, importc: "gks_clear_ws",
                                        dynlib: libname.}
proc gks_redraw_seg_on_ws*(wkid: cint) {.cdecl, importc: "gks_redraw_seg_on_ws",
                                      dynlib: libname.}
proc gks_update_ws*(wkid: cint; regfl: cint) {.cdecl, importc: "gks_update_ws",
    dynlib: libname.}
proc gks_set_deferral_state*(wkid: cint; defmo: cint; regmo: cint) {.cdecl,
    importc: "gks_set_deferral_state", dynlib: libname.}
proc gks_escape*(funid: cint; dimidr: cint; idr: ptr cint; maxodr: cint; lenodr: ptr cint;
                odr: ptr cint) {.cdecl, importc: "gks_escape", dynlib: libname.}
proc gks_message*(wkid: cint; message: cstring) {.cdecl, importc: "gks_message",
    dynlib: libname.}
proc gks_polyline*(n: cint; pxa: ptr cdouble; pya: ptr cdouble) {.cdecl,
    importc: "gks_polyline", dynlib: libname.}
proc gks_polymarker*(n: cint; pxa: ptr cdouble; pya: ptr cdouble) {.cdecl,
    importc: "gks_polymarker", dynlib: libname.}
proc gks_text*(px: cdouble; py: cdouble; str: cstring) {.cdecl, importc: "gks_text",
    dynlib: libname.}
proc gks_fillarea*(n: cint; pxa: ptr cdouble; pya: ptr cdouble) {.cdecl,
    importc: "gks_fillarea", dynlib: libname.}
proc gks_cellarray*(qx: cdouble; qy: cdouble; rx: cdouble; ry: cdouble; dimx: cint;
                   dimy: cint; scol: cint; srow: cint; ncol: cint; nrow: cint;
                   colia: ptr cint) {.cdecl, importc: "gks_cellarray", dynlib: libname.}
proc gks_gdp*(n: cint; px: ptr cdouble; py: ptr cdouble; primid: cint; ldr: cint;
             datrec: ptr cint) {.cdecl, importc: "gks_gdp", dynlib: libname.}
proc gks_set_pline_index*(index: cint) {.cdecl, importc: "gks_set_pline_index",
                                      dynlib: libname.}
proc gks_set_pline_linetype*(ltype: cint) {.cdecl,
    importc: "gks_set_pline_linetype", dynlib: libname.}
proc gks_set_pline_linewidth*(lwidth: cdouble) {.cdecl,
    importc: "gks_set_pline_linewidth", dynlib: libname.}
proc gks_set_pline_color_index*(coli: cint) {.cdecl,
    importc: "gks_set_pline_color_index", dynlib: libname.}
proc gks_set_pmark_index*(index: cint) {.cdecl, importc: "gks_set_pmark_index",
                                      dynlib: libname.}
proc gks_set_pmark_type*(mtype: cint) {.cdecl, importc: "gks_set_pmark_type",
                                     dynlib: libname.}
proc gks_set_pmark_size*(mszsc: cdouble) {.cdecl, importc: "gks_set_pmark_size",
                                        dynlib: libname.}
proc gks_set_pmark_color_index*(coli: cint) {.cdecl,
    importc: "gks_set_pmark_color_index", dynlib: libname.}
proc gks_set_text_index*(index: cint) {.cdecl, importc: "gks_set_text_index",
                                     dynlib: libname.}
proc gks_set_text_fontprec*(font: cint; prec: cint) {.cdecl,
    importc: "gks_set_text_fontprec", dynlib: libname.}
proc gks_set_text_expfac*(chxp: cdouble) {.cdecl, importc: "gks_set_text_expfac",
                                        dynlib: libname.}
proc gks_set_text_spacing*(chsp: cdouble) {.cdecl, importc: "gks_set_text_spacing",
    dynlib: libname.}
proc gks_set_text_color_index*(coli: cint) {.cdecl,
    importc: "gks_set_text_color_index", dynlib: libname.}
proc gks_set_text_height*(chh: cdouble) {.cdecl, importc: "gks_set_text_height",
                                       dynlib: libname.}
proc gks_set_text_upvec*(chux: cdouble; chuy: cdouble) {.cdecl,
    importc: "gks_set_text_upvec", dynlib: libname.}
proc gks_set_text_path*(txp: cint) {.cdecl, importc: "gks_set_text_path",
                                  dynlib: libname.}
proc gks_set_text_align*(txalh: cint; txalv: cint) {.cdecl,
    importc: "gks_set_text_align", dynlib: libname.}
proc gks_set_fill_index*(index: cint) {.cdecl, importc: "gks_set_fill_index",
                                     dynlib: libname.}
proc gks_set_fill_int_style*(ints: cint) {.cdecl, importc: "gks_set_fill_int_style",
                                        dynlib: libname.}
proc gks_set_fill_style_index*(styli: cint) {.cdecl,
    importc: "gks_set_fill_style_index", dynlib: libname.}
proc gks_set_fill_color_index*(coli: cint) {.cdecl,
    importc: "gks_set_fill_color_index", dynlib: libname.}
proc gks_set_asf*(flag: ptr cint) {.cdecl, importc: "gks_set_asf", dynlib: libname.}
proc gks_set_color_rep*(wkid: cint; index: cint; red: cdouble; green: cdouble;
                       blue: cdouble) {.cdecl, importc: "gks_set_color_rep",
                                      dynlib: libname.}
proc gks_set_window*(tnr: cint; xmin: cdouble; xmax: cdouble; ymin: cdouble;
                    ymax: cdouble) {.cdecl, importc: "gks_set_window",
                                   dynlib: libname.}
proc gks_set_viewport*(tnr: cint; xmin: cdouble; xmax: cdouble; ymin: cdouble;
                      ymax: cdouble) {.cdecl, importc: "gks_set_viewport",
                                     dynlib: libname.}
proc gks_select_xform*(tnr: cint) {.cdecl, importc: "gks_select_xform",
                                 dynlib: libname.}
proc gks_set_clipping*(clsw: cint) {.cdecl, importc: "gks_set_clipping",
                                  dynlib: libname.}
proc gks_set_ws_window*(wkid: cint; xmin: cdouble; xmax: cdouble; ymin: cdouble;
                       ymax: cdouble) {.cdecl, importc: "gks_set_ws_window",
                                      dynlib: libname.}
proc gks_set_ws_viewport*(wkid: cint; xmin: cdouble; xmax: cdouble; ymin: cdouble;
                         ymax: cdouble) {.cdecl, importc: "gks_set_ws_viewport",
                                        dynlib: libname.}
proc gks_create_seg*(segn: cint) {.cdecl, importc: "gks_create_seg", dynlib: libname.}
proc gks_close_seg*() {.cdecl, importc: "gks_close_seg", dynlib: libname.}
proc gks_delete_seg*(segn: cint) {.cdecl, importc: "gks_delete_seg", dynlib: libname.}
proc gks_assoc_seg_with_ws*(wkid: cint; segn: cint) {.cdecl,
    importc: "gks_assoc_seg_with_ws", dynlib: libname.}
proc gks_copy_seg_to_ws*(wkid: cint; segn: cint) {.cdecl,
    importc: "gks_copy_seg_to_ws", dynlib: libname.}
proc gks_set_seg_xform*(segn: cint; mat: array[3, array[2, cdouble]]) {.cdecl,
    importc: "gks_set_seg_xform", dynlib: libname.}
proc gks_initialize_locator*(wkid: cint; lcdnr: cint; tnr: cint; px: cdouble;
                            py: cdouble; pet: cint; xmin: cdouble; xmax: cdouble;
                            ymin: cdouble; ymax: cdouble; ldr: cint; datrec: cstring) {.
    cdecl, importc: "gks_initialize_locator", dynlib: libname.}
proc gks_request_locator*(wkid: cint; lcdnr: cint; stat: ptr cint; tnr: ptr cint;
                         px: ptr cdouble; py: ptr cdouble) {.cdecl,
    importc: "gks_request_locator", dynlib: libname.}
proc gks_request_stroke*(wkid: cint; skdnr: cint; n: cint; stat: ptr cint; tnr: ptr cint;
                        np: ptr cint; pxa: ptr cdouble; pya: ptr cdouble) {.cdecl,
    importc: "gks_request_stroke", dynlib: libname.}
proc gks_request_choice*(wkid: cint; chdnr: cint; stat: ptr cint; chnr: ptr cint) {.cdecl,
    importc: "gks_request_choice", dynlib: libname.}
proc gks_request_string*(wkid: cint; stdnr: cint; stat: ptr cint; lostr: ptr cint;
                        str: cstring) {.cdecl, importc: "gks_request_string",
                                      dynlib: libname.}
proc gks_read_item*(wkid: cint; lenidr: cint; maxodr: cint; odr: cstring) {.cdecl,
    importc: "gks_read_item", dynlib: libname.}
proc gks_get_item*(wkid: cint; `type`: ptr cint; lenodr: ptr cint) {.cdecl,
    importc: "gks_get_item", dynlib: libname.}
proc gks_interpret_item*(`type`: cint; lenidr: cint; dimidr: cint; idr: cstring) {.cdecl,
    importc: "gks_interpret_item", dynlib: libname.}
proc gks_eval_xform_matrix*(fx: cdouble; fy: cdouble; transx: cdouble; transy: cdouble;
                           phi: cdouble; scalex: cdouble; scaley: cdouble;
                           coord: cint; tran: array[3, array[2, cdouble]]) {.cdecl,
    importc: "gks_eval_xform_matrix", dynlib: libname.}
proc gks_inq_operating_state*(opsta: ptr cint) {.cdecl,
    importc: "gks_inq_operating_state", dynlib: libname.}
proc gks_inq_level*(errind: ptr cint; lev: ptr cint) {.cdecl, importc: "gks_inq_level",
    dynlib: libname.}
proc gks_inq_wstype*(n: cint; errind: ptr cint; number: ptr cint; wtype: ptr cint) {.cdecl,
    importc: "gks_inq_wstype", dynlib: libname.}
proc gks_inq_max_xform*(errind: ptr cint; maxtnr: ptr cint) {.cdecl,
    importc: "gks_inq_max_xform", dynlib: libname.}
proc gks_inq_open_ws*(n: cint; errind: ptr cint; ol: ptr cint; wkid: ptr cint) {.cdecl,
    importc: "gks_inq_open_ws", dynlib: libname.}
proc gks_inq_active_ws*(n: cint; errind: ptr cint; ol: ptr cint; wkid: ptr cint) {.cdecl,
    importc: "gks_inq_active_ws", dynlib: libname.}
proc gks_inq_segn_ws*(wkid: cint; n: cint; errind: ptr cint; ol: ptr cint; segn: ptr cint) {.
    cdecl, importc: "gks_inq_segn_ws", dynlib: libname.}
proc gks_inq_color_rep*(wkid: cint; index: cint; `type`: cint; errind: ptr cint;
                       red: ptr cdouble; green: ptr cdouble; blue: ptr cdouble) {.cdecl,
    importc: "gks_inq_color_rep", dynlib: libname.}
proc gks_inq_pline_linetype*(errind: ptr cint; ltype: ptr cint) {.cdecl,
    importc: "gks_inq_pline_linetype", dynlib: libname.}
proc gks_inq_pline_linewidth*(errind: ptr cint; lwidth: ptr cdouble) {.cdecl,
    importc: "gks_inq_pline_linewidth", dynlib: libname.}
proc gks_inq_pline_color_index*(errind: ptr cint; coli: ptr cint) {.cdecl,
    importc: "gks_inq_pline_color_index", dynlib: libname.}
proc gks_inq_pmark_type*(errind: ptr cint; mtype: ptr cint) {.cdecl,
    importc: "gks_inq_pmark_type", dynlib: libname.}
proc gks_inq_pmark_size*(errind: ptr cint; mszsc: ptr cdouble) {.cdecl,
    importc: "gks_inq_pmark_size", dynlib: libname.}
proc gks_inq_pmark_color_index*(errind: ptr cint; coli: ptr cint) {.cdecl,
    importc: "gks_inq_pmark_color_index", dynlib: libname.}
proc gks_inq_text_fontprec*(errind: ptr cint; font: ptr cint; prec: ptr cint) {.cdecl,
    importc: "gks_inq_text_fontprec", dynlib: libname.}
proc gks_inq_text_expfac*(errind: ptr cint; chxp: ptr cdouble) {.cdecl,
    importc: "gks_inq_text_expfac", dynlib: libname.}
proc gks_inq_text_spacing*(errind: ptr cint; chsp: ptr cdouble) {.cdecl,
    importc: "gks_inq_text_spacing", dynlib: libname.}
proc gks_inq_text_color_index*(errind: ptr cint; coli: ptr cint) {.cdecl,
    importc: "gks_inq_text_color_index", dynlib: libname.}
proc gks_inq_text_height*(errind: ptr cint; chh: ptr cdouble) {.cdecl,
    importc: "gks_inq_text_height", dynlib: libname.}
proc gks_inq_text_upvec*(errind: ptr cint; chux: ptr cdouble; chuy: ptr cdouble) {.cdecl,
    importc: "gks_inq_text_upvec", dynlib: libname.}
proc gks_inq_text_path*(errind: ptr cint; txp: ptr cint) {.cdecl,
    importc: "gks_inq_text_path", dynlib: libname.}
proc gks_inq_text_align*(errind: ptr cint; txalh: ptr cint; txalv: ptr cint) {.cdecl,
    importc: "gks_inq_text_align", dynlib: libname.}
proc gks_inq_fill_int_style*(errind: ptr cint; ints: ptr cint) {.cdecl,
    importc: "gks_inq_fill_int_style", dynlib: libname.}
proc gks_inq_fill_style_index*(errind: ptr cint; styli: ptr cint) {.cdecl,
    importc: "gks_inq_fill_style_index", dynlib: libname.}
proc gks_inq_fill_color_index*(errind: ptr cint; coli: ptr cint) {.cdecl,
    importc: "gks_inq_fill_color_index", dynlib: libname.}
proc gks_inq_open_segn*(errind: ptr cint; segn: ptr cint) {.cdecl,
    importc: "gks_inq_open_segn", dynlib: libname.}
proc gks_inq_current_xformno*(errind: ptr cint; tnr: ptr cint) {.cdecl,
    importc: "gks_inq_current_xformno", dynlib: libname.}
proc gks_inq_xform*(tnr: cint; errind: ptr cint; wn: ptr cdouble; vp: ptr cdouble) {.cdecl,
    importc: "gks_inq_xform", dynlib: libname.}
proc gks_inq_clip*(errind: ptr cint; clsw: ptr cint; clrt: ptr cdouble) {.cdecl,
    importc: "gks_inq_clip", dynlib: libname.}
proc gks_inq_ws_conntype*(wkid: cint; errind: ptr cint; conid: ptr cint; wtype: ptr cint) {.
    cdecl, importc: "gks_inq_ws_conntype", dynlib: libname.}
proc gks_inq_ws_category*(wkid: cint; errind: ptr cint; wscat: ptr cint) {.cdecl,
    importc: "gks_inq_ws_category", dynlib: libname.}
proc gks_inq_text_extent*(wkid: cint; px: cdouble; py: cdouble; str: cstring;
                         errind: ptr cint; cpx: ptr cdouble; cpy: ptr cdouble;
                         tx: ptr cdouble; ty: ptr cdouble) {.cdecl,
    importc: "gks_inq_text_extent", dynlib: libname.}
proc gks_inq_max_ds_size*(wtype: cint; errind: ptr cint; dcunit: ptr cint;
                         rx: ptr cdouble; ry: ptr cdouble; lx: ptr cint; ly: ptr cint) {.
    cdecl, importc: "gks_inq_max_ds_size", dynlib: libname.}
proc gks_emergency_close*() {.cdecl, importc: "gks_emergency_close", dynlib: libname.}
proc gks_set_text_slant*(slant: cdouble) {.cdecl, importc: "gks_set_text_slant",
                                        dynlib: libname.}
proc gks_draw_image*(x: cdouble; y: cdouble; scalex: cdouble; scaley: cdouble;
                    width: cint; height: cint; data: ptr cint) {.cdecl,
    importc: "gks_draw_image", dynlib: libname.}
proc gks_set_shadow*(offsetx: cdouble; offsety: cdouble; blur: cdouble) {.cdecl,
    importc: "gks_set_shadow", dynlib: libname.}
proc gks_set_transparency*(alpha: cdouble) {.cdecl, importc: "gks_set_transparency",
    dynlib: libname.}
proc gks_set_coord_xform*(mat: array[3, array[2, cdouble]]) {.cdecl,
    importc: "gks_set_coord_xform", dynlib: libname.}
proc gks_begin_selection*(index: cint; kind: cint) {.cdecl,
    importc: "gks_begin_selection", dynlib: libname.}
proc gks_end_selection*() {.cdecl, importc: "gks_end_selection", dynlib: libname.}
proc gks_move_selection*(x: cdouble; y: cdouble) {.cdecl,
    importc: "gks_move_selection", dynlib: libname.}
proc gks_resize_selection*(kind: cint; x: cdouble; y: cdouble) {.cdecl,
    importc: "gks_resize_selection", dynlib: libname.}
proc gks_inq_bbox*(errind: ptr cint; xmin: ptr cdouble; xmax: ptr cdouble;
                  ymin: ptr cdouble; ymax: ptr cdouble) {.cdecl,
    importc: "gks_inq_bbox", dynlib: libname.}
proc gks_inq_text_slant*(errind: ptr cint; slant: ptr cdouble) {.cdecl,
    importc: "gks_inq_text_slant", dynlib: libname.}
proc gks_precision*(): cdouble {.cdecl, importc: "gks_precision", dynlib: libname.}
proc gks_set_border_color_index*(coli: cint) {.cdecl,
    importc: "gks_set_border_color_index", dynlib: libname.}
proc gks_inq_border_color_index*(errind: ptr cint; coli: ptr cint) {.cdecl,
    importc: "gks_inq_border_color_index", dynlib: libname.}
proc gks_set_border_width*(bwidth: cdouble) {.cdecl,
    importc: "gks_set_border_width", dynlib: libname.}
proc gks_inq_border_width*(errind: ptr cint; bwidth: ptr cdouble) {.cdecl,
    importc: "gks_inq_border_width", dynlib: libname.}
proc gks_set_resample_method*(flag: cuint) {.cdecl,
    importc: "gks_set_resample_method", dynlib: libname.}
proc gks_inq_resample_method*(flag: ptr cuint) {.cdecl,
    importc: "gks_inq_resample_method", dynlib: libname.}
##  Entry point definitions

const
  gsetlinecolorind* = gsetlinecolourind
  gsetmarkercolorind* = gsetmarkercolourind
  gsettextcolorind* = gsettextcolourind
  gsetfillcolorind* = gsetfillcolourind
  gsetcolorrep* = gsetcolourrep
  ginqlinecolorind* = ginqlinecolourind
  ginqmarkercolorind* = ginqmarkercolourind
  ginqtextcolorind* = ginqtextcolourind
  ginqfillcolorind* = ginqfillcolourind

proc gopengks*(a1: ptr Gfile; a2: Glong): cint {.cdecl, importc: "gopengks",
    dynlib: libname.}
proc gclosegks*(): cint {.cdecl, importc: "gclosegks", dynlib: libname.}
proc gopenws*(a1: Gint; a2: ptr Gconn; a3: ptr Gwstype): cint {.cdecl, importc: "gopenws",
    dynlib: libname.}
proc gclosews*(a1: Gint): cint {.cdecl, importc: "gclosews", dynlib: libname.}
proc gactivatews*(a1: Gint): cint {.cdecl, importc: "gactivatews", dynlib: libname.}
proc gdeactivatews*(a1: Gint): cint {.cdecl, importc: "gdeactivatews", dynlib: libname.}
proc gconfigurews*(a1: Gint): cint {.cdecl, importc: "gconfigurews", dynlib: libname.}
proc gclearws*(a1: Gint; a2: Gclrflag): cint {.cdecl, importc: "gclearws",
    dynlib: libname.}
proc gupdatews*(a1: Gint; a2: Gregen): cint {.cdecl, importc: "gupdatews",
                                        dynlib: libname.}
proc gmessage*(a1: Gint; a2: ptr Gchar): cint {.cdecl, importc: "gmessage",
    dynlib: libname.}
proc gpolyline*(a1: Gint; a2: ptr Gpoint): cint {.cdecl, importc: "gpolyline",
    dynlib: libname.}
proc gpolymarker*(a1: Gint; a2: ptr Gpoint): cint {.cdecl, importc: "gpolymarker",
    dynlib: libname.}
proc gtext*(a1: ptr Gpoint; a2: ptr Gchar): cint {.cdecl, importc: "gtext", dynlib: libname.}
proc gfillarea*(a1: Gint; a2: ptr Gpoint): cint {.cdecl, importc: "gfillarea",
    dynlib: libname.}
proc gcellarray*(a1: ptr Grect; a2: ptr Gidim; a3: ptr Gint): cint {.cdecl,
    importc: "gcellarray", dynlib: libname.}
proc gsetasf*(a1: ptr Gasfs): cint {.cdecl, importc: "gsetasf", dynlib: libname.}
proc gsetlineind*(a1: Gint): cint {.cdecl, importc: "gsetlineind", dynlib: libname.}
proc gsetlinetype*(a1: Gint): cint {.cdecl, importc: "gsetlinetype", dynlib: libname.}
proc gsetlinewidth*(a1: Gfloat): cint {.cdecl, importc: "gsetlinewidth",
                                    dynlib: libname.}
proc gsetlinecolourind*(a1: Gint): cint {.cdecl, importc: "gsetlinecolourind",
                                      dynlib: libname.}
proc gsetmarkerind*(a1: Gint): cint {.cdecl, importc: "gsetmarkerind", dynlib: libname.}
proc gsetmarkertype*(a1: Gint): cint {.cdecl, importc: "gsetmarkertype",
                                   dynlib: libname.}
proc gsetmarkersize*(a1: Gfloat): cint {.cdecl, importc: "gsetmarkersize",
                                     dynlib: libname.}
proc gsetmarkercolourind*(a1: Gint): cint {.cdecl, importc: "gsetmarkercolourind",
                                        dynlib: libname.}
proc gsettextind*(a1: Gint): cint {.cdecl, importc: "gsettextind", dynlib: libname.}
proc gsettextfontprec*(a1: ptr Gtxfp): cint {.cdecl, importc: "gsettextfontprec",
    dynlib: libname.}
proc gsetcharexpan*(a1: Gfloat): cint {.cdecl, importc: "gsetcharexpan",
                                    dynlib: libname.}
proc gsetcharspace*(a1: Gfloat): cint {.cdecl, importc: "gsetcharspace",
                                    dynlib: libname.}
proc gsettextcolourind*(a1: Gint): cint {.cdecl, importc: "gsettextcolourind",
                                      dynlib: libname.}
proc gsetcharheight*(a1: Gfloat): cint {.cdecl, importc: "gsetcharheight",
                                     dynlib: libname.}
proc gsetcharup*(a1: ptr Gpoint): cint {.cdecl, importc: "gsetcharup", dynlib: libname.}
proc gsettextpath*(a1: Gtxpath): cint {.cdecl, importc: "gsettextpath", dynlib: libname.}
proc gsettextalign*(a1: ptr Gtxalign): cint {.cdecl, importc: "gsettextalign",
    dynlib: libname.}
proc gsetfillind*(a1: Gint): cint {.cdecl, importc: "gsetfillind", dynlib: libname.}
proc gsetfillintstyle*(a1: Gflinter): cint {.cdecl, importc: "gsetfillintstyle",
    dynlib: libname.}
proc gsetfillstyle*(a1: Gint): cint {.cdecl, importc: "gsetfillstyle", dynlib: libname.}
proc gsetfillcolourind*(a1: Gint): cint {.cdecl, importc: "gsetfillcolourind",
                                      dynlib: libname.}
proc gsetcolourrep*(a1: Gint; a2: Gint; a3: ptr Gcobundl): cint {.cdecl,
    importc: "gsetcolourrep", dynlib: libname.}
proc gsetwindow*(a1: Gint; a2: ptr Glimit): cint {.cdecl, importc: "gsetwindow",
    dynlib: libname.}
proc gsetviewport*(a1: Gint; a2: ptr Glimit): cint {.cdecl, importc: "gsetviewport",
    dynlib: libname.}
proc gselntran*(a1: Gint): cint {.cdecl, importc: "gselntran", dynlib: libname.}
proc gsetclip*(a1: Gclip): cint {.cdecl, importc: "gsetclip", dynlib: libname.}
proc gsetwswindow*(a1: Gint; a2: ptr Glimit): cint {.cdecl, importc: "gsetwswindow",
    dynlib: libname.}
proc gsetwsviewport*(a1: Gint; a2: ptr Glimit): cint {.cdecl, importc: "gsetwsviewport",
    dynlib: libname.}
proc greqloc*(a1: Gint; a2: Gint; a3: ptr Gqloc): cint {.cdecl, importc: "greqloc",
    dynlib: libname.}
proc greqstring*(a1: Gint; a2: Gint; a3: ptr Gqstring): cint {.cdecl,
    importc: "greqstring", dynlib: libname.}
proc gcreateseg*(a1: Gint): cint {.cdecl, importc: "gcreateseg", dynlib: libname.}
proc gcopysegws*(a1: Gint; a2: Gint): cint {.cdecl, importc: "gcopysegws",
                                       dynlib: libname.}
proc gredrawsegws*(a1: Gint): cint {.cdecl, importc: "gredrawsegws", dynlib: libname.}
proc gcloseseg*(): cint {.cdecl, importc: "gcloseseg", dynlib: libname.}
proc gevaltran*(a1: ptr Gpoint; a2: ptr Gpoint; a3: Gfloat; a4: ptr Gscale; a5: Gcsw;
               a6: array[2, array[3, Gfloat]]): cint {.cdecl, importc: "gevaltran",
    dynlib: libname.}
proc gsetsegtran*(a1: Gint; a2: array[2, array[3, Gfloat]]): cint {.cdecl,
    importc: "gsetsegtran", dynlib: libname.}
proc ginqopst*(a1: ptr Gint): cint {.cdecl, importc: "ginqopst", dynlib: libname.}
proc ginqlevelgks*(a1: ptr Gint; a2: ptr Gint): cint {.cdecl, importc: "ginqlevelgks",
    dynlib: libname.}
proc ginqmaxntrannum*(a1: ptr Gint; a2: ptr Gint): cint {.cdecl,
    importc: "ginqmaxntrannum", dynlib: libname.}
proc ginqcharheight*(a1: ptr Gfloat; a2: ptr Gint): cint {.cdecl,
    importc: "ginqcharheight", dynlib: libname.}
proc ginqcharup*(a1: ptr Gpoint; a2: ptr Gint): cint {.cdecl, importc: "ginqcharup",
    dynlib: libname.}
proc ginqtextpath*(a1: ptr Gtxpath; a2: ptr Gint): cint {.cdecl, importc: "ginqtextpath",
    dynlib: libname.}
proc ginqtextalign*(a1: ptr Gtxalign; a2: ptr Gint): cint {.cdecl,
    importc: "ginqtextalign", dynlib: libname.}
proc ginqlinetype*(a1: ptr Gint; a2: ptr Gint): cint {.cdecl, importc: "ginqlinetype",
    dynlib: libname.}
proc ginqlinewidth*(a1: ptr Gfloat; a2: ptr Gint): cint {.cdecl,
    importc: "ginqlinewidth", dynlib: libname.}
proc ginqlinecolourind*(a1: ptr Gint; a2: ptr Gint): cint {.cdecl,
    importc: "ginqlinecolourind", dynlib: libname.}
proc ginqmarkertype*(a1: ptr Gint; a2: ptr Gint): cint {.cdecl,
    importc: "ginqmarkertype", dynlib: libname.}
proc ginqmarkersize*(a1: ptr Gfloat; a2: ptr Gint): cint {.cdecl,
    importc: "ginqmarkersize", dynlib: libname.}
proc ginqmarkercolourind*(a1: ptr Gint; a2: ptr Gint): cint {.cdecl,
    importc: "ginqmarkercolourind", dynlib: libname.}
proc ginqtextfontprec*(a1: ptr Gtxfp; a2: ptr Gint): cint {.cdecl,
    importc: "ginqtextfontprec", dynlib: libname.}
proc ginqcharexpan*(a1: ptr Gfloat; a2: ptr Gint): cint {.cdecl,
    importc: "ginqcharexpan", dynlib: libname.}
proc ginqcharspace*(a1: ptr Gfloat; a2: ptr Gint): cint {.cdecl,
    importc: "ginqcharspace", dynlib: libname.}
proc ginqtextcolourind*(a1: ptr Gint; a2: ptr Gint): cint {.cdecl,
    importc: "ginqtextcolourind", dynlib: libname.}
proc ginqfillintstyle*(a1: ptr Gint; a2: ptr Gint): cint {.cdecl,
    importc: "ginqfillintstyle", dynlib: libname.}
proc ginqfillstyle*(a1: ptr Gint; a2: ptr Gint): cint {.cdecl, importc: "ginqfillstyle",
    dynlib: libname.}
proc ginqfillcolourind*(a1: ptr Gint; a2: ptr Gint): cint {.cdecl,
    importc: "ginqfillcolourind", dynlib: libname.}
proc ginqcurntrannum*(a1: ptr Gint; a2: ptr Gint): cint {.cdecl,
    importc: "ginqcurntrannum", dynlib: libname.}
proc ginqntran*(a1: Gint; a2: ptr Gtran; a3: ptr Gint): cint {.cdecl, importc: "ginqntran",
    dynlib: libname.}
proc ginqclip*(a1: ptr Gcliprect; a2: ptr Gint): cint {.cdecl, importc: "ginqclip",
    dynlib: libname.}
proc ginqwscategory*(a1: ptr Gwstype; a2: ptr Gint; a3: ptr Gint): cint {.cdecl,
    importc: "ginqwscategory", dynlib: libname.}
proc ginqdisplaysize*(a1: ptr Gwstype; a2: ptr Gdspsize; a3: ptr Gint): cint {.cdecl,
    importc: "ginqdisplaysize", dynlib: libname.}
proc ginqtextextent*(a1: Gint; a2: ptr Gpoint; a3: ptr Gchar; a4: ptr Gextent; a5: ptr Gint): cint {.
    cdecl, importc: "ginqtextextent", dynlib: libname.}
proc ginqnameopenseg*(a1: ptr Gint; a2: ptr Gint): cint {.cdecl,
    importc: "ginqnameopenseg", dynlib: libname.}
proc gemergencyclosegks*(): cint {.cdecl, importc: "gemergencyclosegks",
                                dynlib: libname.}