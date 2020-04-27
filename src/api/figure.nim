#[
function Figure(width=600, height=450)
    obj = Dict()
    args = @_tuple(Any)
    kvs = Dict()
    kvs[:size] = (width, height)
    kvs[:ax] = false
    kvs[:subplot] = [0, 1, 0, 1]
    kvs[:clear] = true
    kvs[:update] = true
    kvs[:panzoom] = None
    PlotObject(obj, args, kvs)
end

]#

type
  ##
  Drawable = Axes2

  ## This is the top level figure (which is a container)
  Figure = object
    width:Natural
    height:Natural
    content:seq[Drawable]  ## This is what it will be drawn in order


