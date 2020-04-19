
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