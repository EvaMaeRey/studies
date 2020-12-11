g <- mtcars %>% ggplot() +
  aes(x = cyl) +
  aes(y = wt) +
  stat_summary(geom = "pointrange",
               fun.data = mean_se) +
  geom_blank() +
  geom_point(alpha = .3) +
  geom_boxplot(alpha = .2) +
  geom_boxplot(alpha = .4,
               color = "green",
               aes(group = cyl)) +
  geom_vline(xintercept = 5) +
  geom_vline(aes(xintercept = mean(cyl))) +
  stat_summary(geom = "point",
               color = "red",
               col = "goldenrod2", 
               size = 8,
               fun.y = "mean")

