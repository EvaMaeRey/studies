LETTERS %>% 
  tibble(unit = .) %>% 
  mutate(rank = (1:n())-1) %>% 
  mutate(rank_q_4 = rank %/% 4) %>% 
  mutate(rank_r_4 = rank %% 4) %>% 
  ggplot() +
  aes(x = rank) +
  aes(y = 0) +
  geom_label(aes(label = unit),
             alpha = .3) +
  aes(y = unit) +
  aes(y = rank_q_4) +
  aes(x = rank_r_4) +
  aes(y = -rank_q_4) +
  aes(color = as.character(rank %/% 4 %% 2)) +
  aes(fill = rank %% 10) +
  scale_fill_viridis_c()
