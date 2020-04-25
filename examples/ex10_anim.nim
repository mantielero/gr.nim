import ../src/gr
import os, macros


let SAMPLES = 2048
# This is "real world" area that we are interested in
gr_setwindow(0, SAMPLES.cdouble, -30000, 30000)
# The following is the part that will be displayed
gr_setviewport(0.05, 0.95, 0.05, 0.95)

gr_setlinecolorind(218)
gr_setfillintstyle(1)
gr_setfillcolorind(208)  


update:
  gr_fillrect(0, 100, -30000, 30000)
  gr_grid(40, 1200, 0, 0, 5, 5)
  #grid*(minor_spacing:array[2,float], origin:array[2,float],major:array[2,int]) 

  #gr.polyline(range(SAMPLES)[0::4], amplitudes[0::4])
  #gr.polyline(range(SAMPLES)[0::4], power)
