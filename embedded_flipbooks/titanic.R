library(tidyverse)
Titanic %>% 
  as.data.frame() %>% 
  uncount(weights = Freq) %>% 
  ggplot() +
  ggthemes::theme_igray() +
  aes(x = 1) + labs(x = NULL) + theme(axis.text.x = element_blank()) +
  geom_bar(position = 
             position_dodge2(preserve = "single")) +
  stat_count(geom = "text",
             aes(label = after_stat(count), 
                 y = after_stat(count) + 65),
             vjust = 0,
             size = 4,
             position = 
               position_dodge2(width = .9,
                               preserve = "single")) + #BREAK
  aes(fill = Survived) + 
  theme(legend.position = "top") +
  theme(legend.justification = 0) +
  scale_fill_viridis_d(option = "inferno") + #BREAK
  aes(x = Sex) + theme(axis.text.x = element_text()) + #BREAK
  facet_grid(Class~.) + 
  scale_y_continuous(expand = expansion(mult = c(.025, .3))) + #BREAK
  facet_grid(Class~Age) #BREAK

