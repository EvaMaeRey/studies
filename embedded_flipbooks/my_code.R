A <- ggproto("A", NULL,
  x = 1,
  inc = function(self) {
    self$x <- self$x + 1
  }
)

A$x
A$inc()
A$x
A$inc()
A$inc()
A$x
