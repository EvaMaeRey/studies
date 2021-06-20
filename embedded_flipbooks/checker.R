LETTERS[1:25] %>% 
  tibble(unit = .) %>% 
  mutate(rank = (1:n())-1) %>% 
  ggplot() +
  aes(x = rank %% 5) +
  aes(y = -(rank %/% 5)) +
  geom_label(aes(label = unit),
             alpha = .3) +
  aes(fill = rank %% 2) +
  aes(fill = as.character(rank %% 2)) +
  geom_tile() +
  coord_equal() +
  theme_void() +
  theme(legend.position = "none") +
  theme(plot.background = element_rect(fill = "grey75")) +
  scale_fill_manual(values = c("beige", "plum3"))
