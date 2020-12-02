options(scipen = 10)
gapminder::gapminder %>% 
  filter(year == 1992) %>% 
  ggplot() + 
  theme_minimal() +
  theme(panel.background = element_rect(fill = "grey95")) + 
  theme(plot.background = element_rect(fill= "grey90")) +
  aes(x = gdpPercap) + 
  labs(x = "GDP per Capita, US$") +
  scale_x_log10() + 
  aes(y = lifeExp) + 
  labs(y = "Life Expectancy") + #BREAK
  theme(axis.title.y = element_text(colour = alpha("blue", 0))) +
  aes(size = pop) + 
  scale_size(range = c(1,8), trans = "sqrt", guide = F) +
  geom_blank() +
  geom_point(color = "white") +
  geom_point(alpha = .7, show.legend = F) + #BREAK
  aes(color = continent) + labs(color = NULL) #BREAK
