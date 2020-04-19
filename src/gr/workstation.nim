#from gr_wrapper import gr_openws, gr_closews, gr_activatews, gr_deactivatews, gr_configurews, gr_clearws, gr_updatews

type
  WorkStationType = enum
    wsIss = 5,  # Workstation Independent Segment Storage
    wsGDI = 41, # Windows GDI
    wsPS1 = 61, # PostScript (b/w, color)
    wsPS2 = 62, # PostScript (b/w, color)
    wsPS3 = 63, # PostScript (b/w, color)
    wsPS4 = 64, # PostScript (b/w, color)
    wsPDFplain = 101,       # Portable Document Format (plain)
    wsPDFcompressed = 102, 	# Portable Document Format (compressed)
    wsXwindows1 = 210,  # X Windows
    wsXwindows2 = 211,  # X Windows
    wsXwindows3 = 212,  # X Windows
    wsXwindows4 = 213,  # X Windows        
    wsRF = 214, # Sun Raster file (RF)
    wsGIF87 = 215, # Graphics Interchange Format (GIF87) 
    wsGIF89 = 218, # Graphics Interchange Format (GIF89)
    wsUIL   = 216, # Motif User Interface Language (UIL)
    wsBMP   = 320, # Windows Bitmap (BMP)
    wsJPEG  = 321, # JPEG image file
    wsPNG   = 322, # Portable Network Graphics file (PNG)
    wsTIFF  = 323, # Tagged Image File Format (TIFF)
    wsGTK   = 371, # Gtk
    wsWX    = 380, # wxWidgets
    wsQt4   = 381, # Qt4
    wsSVG   = 382, # Scaleable Vector Graphics (SVG)
    wsWMF   = 390, #	Windows Metafile
    wsQuartz = 400, # Quartz
    wsSocket = 410, # Socket driver
    wsZMQ = 415,    # 0MQ driver
    wsOpenGL = 420 # OpenGL


#[
proc gr_openws*(a:cint, b:cstring, c:cint)    {.importc,dynlib: libName.}
proc gr_closews*(a:cint)    {.importc,dynlib: libName.}
proc gr_activatews*(a:cint)    {.importc,dynlib: libName.}
proc gr_deactivatews*(a:cint)    {.importc,dynlib: libName.}
proc gr_configurews*()    {.importc,dynlib: libName.}
proc gr_clearws*()    {.importc,dynlib: libName.}
proc gr_updatews*()    {.importc,dynlib: libName.}    
]#

#[
type
  WorkStation = object
    id:int
    connection:string
    `type`:WorkStationType
]#

type
  WorkStation = int

var workstationCounter:int = 1

proc newWorkStation*(id:WorkStation, connection:string, `type`:WorkStationType) =
  ## Open a graphical workstation
  ## - `id`: a workstation identifier
  ## - `connection`: a connection identifier
  ## - `type`: one of the `WorkStation` enum
  gr_openws(WORKSTATION.cint, connection.cstring, `type`.cint)
  result = workstationCounter
  workstationCounter += 1


proc close(id:WorkStation) =
  gr_closews(id.cint)

proc 
  
proc activate(ws:WorkStation) =
  gr_activatews(ws.cint)

proc deactivate(ws:WorkStation) =
  gr_deactivatews(ws.cint)

proc configure() =
  gr_configurews()

proc clear() =
  gr_clearws()

proc update() =
  gr_updatews()  
