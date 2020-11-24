library(tidyverse)
set.seed(98789)
n <- 22
tibble(type = sample(LETTERS[1:3], n, replace = T),
       state = sample(state.abb[1:4], n, replace = T),
       event_occurs = sample(c("Yes", "No"), n, replace = T)) %>% 
  ggplot() +
  ggthemes::theme_igray() +
  geom_bar(position = "dodge2") + #ROTATE
  geom_bar(position = "identity") + #ROTATE
  geom_bar(position = "fill") + #ROTATE
  geom_bar(position = position_dodge2(preserve = "single")) + #ROTATE
  geom_bar(position = position_dodge2(preserve = "single", padding = .2)) + #ROTATE
  geom_bar(position = position_dodge2(preserve = "single", reverse = T)) + #ROTATE
  geom_bar(position = position_dodge2(preserve = "total", reverse = T)) + #ROTATE
  geom_bar(position = position_dodge(preserve = "single")) + #ROTATE
  geom_bar(position = position_dodge(width = 0.6)) + #ROTATE
  geom_bar(position = "stack") + #ROTATE
  geom_bar(position = "dodge") + #ROTATE
  aes(fill = factor(event_occurs)) + 
  theme(legend.position = "top") +
  theme(legend.justification = 0) +
  scale_fill_manual(values = c("plum4", "goldenrod1") ) + 
  aes(x = type) + 
  facet_grid(state~.) + 
  scale_y_continuous(expand = expansion(mult = c(.025, .3))) 
