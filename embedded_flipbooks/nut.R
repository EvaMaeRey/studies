offset <- .15
set.seed(12342)
c(LETTERS, letters, 1:26) %>% 
  tibble(unit = .) %>% 
  mutate(unit = fct_inorder(unit)) %>% 
  mutate(rank = (1:n())-1) %>% 
  mutate(rank_q_4 = rank %/% 8) %>% 
  mutate(rank_r_4 = rank %% 8) %>% 
  ggplot() +
  aes(x = rank) +
  aes(y = 0) +
  geom_label(aes(label = unit),
             alpha = .8) +
  aes(y = unit) +
  aes(y = rank_q_4) +
  aes(x = rank_r_4) +
  aes(y = -rank_q_4) +
  scale_fill_viridis_c(option = "magma") +
  ggdark::dark_theme_minimal() +
  aes(fill = rank %% 10) +
  aes(fill = (1+rank) %% 10) +
  aes(fill = (2+rank) %% 10) +
  aes(fill = (3+rank) %% 10) +
  aes(fill = (4+rank) %% 10) +
  aes(fill = (1+rank) %% 15) +
  aes(fill = (2+rank) %% 16) +
  aes(fill = (3+rank) %% 17) +
  aes(fill = (4+rank) %% 18) +
  aes(fill = rank %% 8) +
  aes(fill = rank %/% 8) +
  aes(fill = -rank %% 8) +
  aes(fill = -rank %/% 8) +
  aes(fill = rank %% 8 %% 4) +
  aes(fill = -rank %% 8 %% 4) +
  aes(fill = rank %% 8 %% 2) +
  aes(fill = -rank %% 8 %% 3) +
  aes(fill = -rank %% 8 %% 4) +
  aes(fill = -rank %% 8 %% 5) +
  aes(fill = -rank %% 8 %% 6) +
  aes(fill = -rank %/% 8 %% 7)
