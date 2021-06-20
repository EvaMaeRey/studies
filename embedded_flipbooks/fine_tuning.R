StatChull <- ggproto("StatChull", Stat,
  compute_group = function(data, scales) {
    data[chull(data$x, data$y), , drop = FALSE]
  },
  
  required_aes = c("x", "y")
)

library(magrittr)
cars %$% 
  # identify the exterior chull points row number
  chull(x = speed, y = dist)

cars[chull(cars$speed, cars$dist), , drop = F]


stat_chull <- function(mapping = NULL, data = NULL, geom = "polygon",
                       position = "identity", na.rm = FALSE, show.legend = NA, 
                       inherit.aes = TRUE, ...) {
  layer(
    stat = StatChull, data = data, mapping = mapping, geom = geom, 
    position = position, show.legend = show.legend, inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}


cars %>% 
  ggplot(aes(speed, dist)) +
  geom_point() +
  stat_chull(fill = NA, color = "black") ->
cars_ggplot

ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  stat_chull(fill = NA, color = "black") +
  stat_chull(fill = NA) +
  aes(color = drv) +
  stat_chull(geom = "point", size = 4, 
             colour = "red") +
  stat_chull(geom = "point", size = 4)
