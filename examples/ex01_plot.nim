import ../src/gr

let x = @[0.0, 0.2, 0.4, 0.6, 0.8, 1.0]
let y = @[0.3, 0.5, 0.4, 0.2, 0.6, 0.7]
polyline(x, y)
axes(tick(0.0, 1.0), tick(0.0, 1.0), 0.0, 0.0, 1, 1, -0.01)
gr_updatews()  # By default: GKS QtTerm
discard readLine(stdin)
