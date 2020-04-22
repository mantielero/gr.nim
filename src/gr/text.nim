
type
  Font* = enum
    ftTIMES_ROMAN = 101,
    ftTIMES_ITALIC = 102,
    ftTIMES_BOLD = 103,
    ftTIMES_BOLDITALIC = 104,
    ftHELVETICA = 105,
    ftHELVETICA_OBLIQUE = 106,
    ftHELVETICA_BOLD = 107,
    ftHELVETICA_BOLDOBLIQUE = 108,
    ftCOURIER = 109,
    ftCOURIER_OBLIQUE = 110,
    ftCOURIER_BOLD = 111,
    ftCOURIER_BOLDOBLIQUE = 112,
    ftSYMBOL = 113,
    ftBOOKMAN_LIGHT = 114,
    ftBOOKMAN_LIGHTITALIC = 115,
    ftBOOKMAN_DEMI = 116,
    ftBOOKMAN_DEMIITALIC = 117,
    ftNEWCENTURYSCHLBK_ROMAN = 118,
    ftNEWCENTURYSCHLBK_ITALIC = 119,
    ftNEWCENTURYSCHLBK_BOLD = 120,
    ftNEWCENTURYSCHLBK_BOLDITALIC = 121,
    ftAVANTGARDE_BOOK = 122,
    ftAVANTGARDE_BOOKOBLIQUE = 123,
    ftAVANTGARDE_DEMI = 124,
    ftAVANTGARDE_DEMIOBLIQUE = 125,
    ftPALATINO_ROMAN = 126,
    ftPALATINO_ITALIC = 127,
    ftPALATINO_BOLD = 128,
    ftPALATINO_BOLDITALIC = 129,
    ftZAPFCHANCERY_MEDIUMITALIC = 130,
    ftZAPFDINGBATS = 131

  TextPrecision = enum
    tprSTRING = 0, # String precision (higher quality)
    tprCHAR   = 1, # Character precision (medium quality)
    tprSTROKE = 2 # Stroke precision (lower quality)

  TextPath = enum
    tpRIGHT = 0, ## left-to-right
    tpLEFT = 1, ## right-to-left
    tpUP    = 2, ## downside-up
    tpDOWN = 3  ## upside-down

  TextHalign = enum
    TEXT_HALIGN_NORMAL = 0, ## Normal 
    TEXT_HALIGN_LEFT   = 1, ## Left justify
    TEXT_HALIGN_CENTER = 2, ## Center justify
    TEXT_HALIGN_RIGHT  = 3  ## Right justify

  TextValign = enum
    TEXT_VALIGN_NORMAL = 0, ## Normal  
    TEXT_VALIGN_TOP    = 1, ## Align with the top of the characters
    TEXT_VALIGN_CAP    = 2, ## Aligned with the cap of the characters
    TEXT_VALIGN_HALF   = 3, ## Aligned with the half line of the characters
    TEXT_VALIGN_BASE   = 4, ## Aligned with the base line of the characters
    TEXT_VALIGN_BOTTOM = 5 ## Aligned with the bottom line of the characters


proc text*(x,y:float, cad:string) =
  ##[
  Draw a text at position `x`, `y` using the current text attributes.

  The values for `x` and `y` are in normalized device coordinates. The attributes that control the appearance of text are text font and precision, character expansion factor, character spacing, text color index, character height, character up vector, text path and text alignment.

  Parameters:

  - `x`: The X coordinate of the starting position of the text string
  - `y`: The Y coordinate of the starting position of the text string
  - `string`: The text to be drawn
  ]##
  gr_text(x.cdouble, y.cdouble, cad.cstring)

#[
proc getText*(x,y:float, cad:string, d:ptr cdouble, e:ptr cdouble)):tuple[d,e:float] =
  var a,b:cdouble
  gr_inqtext(x.cdouble, y.cdouble, cad.cstring, a.addr, b.addr)
  return (a.float,b.float)
]#


proc setTextFontPrecision*(font:Font, precision:TextPrecision) = 
  ## Specify the text font and precision for subsequent text output primitives.
  ## 
  ## The appearance of a font depends on the text precision value specified. STRING, CHARACTER or STROKE precision allows for a greater or lesser realization of the text primitives, for efficiency. STRING is the default precision for GR and produces the highest quality output.
  gr_settextfontprec(font.cint, precision.cint)


proc setCharExpansion*(factor:float) =
  ##[
  Set the current character expansion factor (width to height ratio).

  This function defines the width of subsequent text output primitives. The expansion factor alters the width of the generated characters, but not their height. The default text expansion factor is 1, or one times the normal width-to-height ratio of the text.

  Parameters:

  - `factor`: Text expansion factor applied to the nominal text width-to-height ratio
  ]##
  gr_setcharexpan(factor.cdouble)


proc setCharSpace(a:float) =
  gr_setcharspace(a.cdouble)

proc setTextColor*(color:Color) =
  ##[
  Set the current text color index.

  This function defines the color of subsequent text output primitives. GR uses the default foreground color (black=1) for the default text color index.

  Parameters:
  
  - `color`: The text color index (COLOR < 1256)
  ]##
  gr_settextcolorind(color.cint) 

proc setCharHeight*(height:float) =
  ##[
  Set the current character height.

  This function defines the height of subsequent text output primitives. Text height is defined as a percentage of the default window. GR uses the default text height of 0.027 (2.7% of the height of the default window).

  Parameters:

  - `height`: Text height value
  ]##
  gr_setcharheight( height.cdouble )

proc setCharUp*(ux,uy:float) =
  ##[
  Set the current character text angle up vector.

  This function defines the vertical rotation of subsequent text output primitives. The text up vector is initially set to (0, 1), horizontal to the baseline.

  Parameters:

  - `ux`: X coordinate of the text up vector
  - `uy`: Y coordinate of the text up vector
  ]##  
  gr_setcharup(ux.cdouble, uy.cdouble)


proc setTextPath*(path:int) =
  ## Define the current direction in which subsequent text will be drawn.
  gr_settextpath(path.cint) 


proc setTextAlign*(horizontal:TextHalign, vertical:TextValign) =
  ## Set the current horizontal and vertical alignment for text.
  gr_settextalign(horizontal.cint, vertical.cint)