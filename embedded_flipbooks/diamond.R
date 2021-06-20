offset <- .15
set.seed(12342)
tibble(period = 1:22) %>% 
  crossing(tibble(unit = LETTERS[1:6])) %>% 
  sample_n(60, replace = T) %>% 
  count(unit, period) %>% 
  mutate(unit_numeric = as.numeric(as.factor(unit))) %>% 
  # if in even or odd period, shift up or down
  mutate(unit_offset = period %% 2) %>% 
  mutate(unit_numeric_plus = unit_numeric + 
           unit_offset*offset - offset/2) %>% 
  ggplot() +
  aes(x = period) +
  aes(y = unit) +
  aes(y = unit_numeric) +
  geom_hline(aes(yintercept = unit_numeric),
             linetype = "dashed") +
  geom_point(size = 12, 
             shape = "diamond") +
  aes(y = unit_numeric_plus) +
  aes(color = n) +
  geom_text(aes(label = n),
            fontface = "bold",
            size = 5,
            color = "oldlace") 
