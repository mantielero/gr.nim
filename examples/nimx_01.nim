
import nimx/[window, layout, view, animation]
import ../src/gr

let x = @[0.0, 0.2, 0.4, 0.6, 0.8, 1.0]
let y = @[0.3, 0.5, 0.4, 0.2, 0.6, 0.7]
polyline(x, y)
axes(tick(0.0, 1.0), tick(0.0, 1.0), 0.0, 0.0, 1, 1, -0.01)
gr_updatews()  # By default: GKS QtTerm
discard readLine(stdin)


#import nanovg
#import nanovg/wrapper
import opengl/private/prelude
import times
import demo

var vg: NVGContext
type MyView = ref object of View

var demoData: DemoData

method draw*(v: MyView, r: Rect) =
  procCall v.View.draw(r)

  #vg.beginFrame(v.bounds.width, v.bounds.height, 1.0)
  #renderDemo(vg, 0, 0, v.bounds.width, v.bounds.height, epochTime(), false, demoData)
  #vg.endFrame()
  gr3.drawimage(0, size.width, 0, size.height, int(size.width), int(size.height),
                      gr3.GR3_Drawable.GR3_DRAWABLE_OPENGL)
  #self.gl_canvas.SwapBuffers()

#[
proc nvgInit(flags: set[NvgInitFlag] = {}): NVGContext =
  when defined(ios) or defined(android):
    result = nvgCreateContext(flags)
  else:
    result = nvgInit(glGetProc)
]#

proc startApp() =
  # First create a window. Window is the root of view hierarchy.
  var wnd = newWindow(newRect(40, 40, 800, 600))
  wnd.makeLayout:
    title: "Gr example"
    - MyView:
      frame == super

  #vg = nvgInit()

  # Asset loading is slightly more involved on the following platforms, so we just don't try at all.
  when not (defined(android) or defined(ios) or defined(emscripten) or defined(wasm)):
    if not vg.loadDemoData(demoData):
      raise newException(ValueError, "Could not load demo data")

  wnd.addAnimation(newAnimation())

# Run the app
runApplication:
    startApp()