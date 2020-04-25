#https://gr-framework.org/examples/double_pendulum3.html
import math
import ../src/gr
import sequtils, sugar, times, os

let g = 9.8 # gravitational constant

# length of rods
let l1 = 1.2       
let l2 = 1.0

# weights of bobs
let m1 = 1.0      
let m2 = 1.5

proc `*`[T,Y](h:T, state:seq[Y]):seq[Y] =
  var tmp = newSeq[Y](state.len)
  for i in 0..<state.len:
      tmp[i] = h.Y * state[i]
  return tmp

proc `+`[T](x, y:seq[T]):seq[T] =
    assert(x.len == y.len)
    var tmp = newSeq[T](x.len)
    for i in 0..<x.len:
        tmp[i] = x[i] + y[i]
    return tmp

proc `/`[T,Y](x:seq[T],y:Y):seq[T] =
    var tmp = newSeq[T](x.len)
    for i in 0..<x.len:
        tmp[i] = x[i] / y.Y
    return tmp

proc rk4( x, h:float, y:seq[float], 
          f:proc(t:float, state:seq[float]):seq[float]):tuple[t:float,state:seq[float]] = 
    # 4th order Runge-Kutta: https://es.wikipedia.org/wiki/M%C3%A9todo_de_Runge-Kutta
    # Solves the ODE
    let k1 = h * f(x, y)  #f(x, y).map( z => z * h)
    let k2 = h * f(x + 0.5 * h, y + 0.5 * k1)
    let k3 = h * f(x + 0.5 * h, y + 0.5 * k2)
    let k4 = h * f(x + h, y + k3)
    return (x + h, y + (k1 + 2 * (k2 + k3) + k4) / 6.0)


# m1, m2, l1, l2
proc pendulum_derivs(t:float, state:seq[float]):seq[float] =
    # The following derivation is from:
    # http://scienceworld.wolfram.com/physics/DoublePendulum.html
    #let (t1, w1, t2, w2) = state
    let t1 = state[0]
    let w1 = state[1]
    let t2 = state[2]
    let w2 = state[3]

    let a = (m1 + m2) * l1
    let b = m2 * l2 * cos(t1 - t2)
    let c = m2 * l1 * cos(t1 - t2)
    let d = m2 * l2
    let e = -m2 * l2 * w2^2 * sin(t1 - t2) - g * (m1 + m2) * sin(t1)
    let f =  m2 * l1 * w1^2 * sin(t1 - t2) - m2 * g * sin(t2)
    return @[w1, (e*d-b*f) / (a*d-c*b), w2, (a*f-c*e) / (a*d-c*b)]


proc double_pendulum(theta, length, mass:array[2,float]) =
    ## Plots
    gr_clearws()
    setViewport(0.0, 1.0, 0.0, 1.0)

    var direction:seq[array[3,float]]
    var position = @[[0.0, 0.0, 0.0]]
    for i in 0..1:
        direction &= [ sin(theta[i]) * length[i] * 2.0,
                        -cos(theta[i]) * length[i] * 2.0, 
                        0.0 ]
        var tmp:array[3,float]
        for j in 0..2:
          tmp[j] = position[ position.len - 1 ][j] + direction[ direction.len - 1 ][j]
        position  &= tmp

    discard gr3_clear()
    # draw pivot point
    drawCylinderMesh([0.0, 0.2, 0.0], [0.0, 1.0, 0.0], [0.4, 0.4, 0.4], 0.4, 0.05)
    drawCylinderMesh([0.0, 0.2, 0.0], [0.0, -1.0, 0.0], [0.4, 0.4, 0.4], 0.05, 0.2)
    drawSphereMesh([0.0,0.0,0.0], [0.4, 0.4, 0.4], 0.05)
    # draw rods
    #var colors:seq[array[3, float]]
    let colors = @[[0.6, 0.6, 0.6], [0.6, 0.6, 0.6]]
    #echo positions
    #echo direction
    #echo colors
    drawCylinderMesh( position[0..1], direction, colors,
                      @[0.05, 0.05],
                      @[2.0 * length[0], 2.0 * length[1]] )
    # draw bobs
    drawSphereMesh( position[1..2], 
                    @[[1.0, 1.0, 1.0], [1.0, 1.0, 1.0]], 
                    @[mass[0] * 0.2, mass[1] * 0.2] )

    drawImage(0.0, 1.0, 0.0, 1.0, 500, 500,GR3_DRAWABLE_GKS) #GR3_DRAWABLE_OPENGL) #
    gr_updatews()
    #return



# initial angles
var t1 = 100.0     
var t2 = -20.0

var w1 = 0.0
var w2 = 0.0
var t  = 0.0     # Initial time
let dt = 0.04 # Delta time 
var state = @[t1, w1, t2, w2].map( x => x * PI / 180.0 )

discard gr3_init(nil)
discard gr3_setcameraprojectionparameters(45.cfloat, 1.cfloat, 100.cfloat)
gr3_cameralookat(6.cfloat, -2.cfloat, 4.cfloat, 0.cfloat, -2.cfloat, 0.cfloat, 0.cfloat, 1.cfloat, 0.cfloat)
gr3_setbackgroundcolor(1, 1, 1, 1)
gr3_setlightdirection(1, 1, 10)

let start = epochTime()

while t < 30.0:
    let time1 = epochTime()
    (t, state) = rk4(t, dt, state, pendulum_derivs)
    (t1, w1, t2, w2) = state
    double_pendulum([t1, t2], [l1, l2], [m1, m2])
    let time2 = epochTime()

    let diff = time1.float + dt - time2.float
    if diff > 0:  # If it goes too fast
        var milliseconds = diff * 1000.0
        #echo milliseconds
        sleep( milliseconds.int )
