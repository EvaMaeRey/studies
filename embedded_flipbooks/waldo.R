set.seed(12456)
num <- 10
tibble(type = sample(LETTERS[1:2], num, replace = T) ,
       state = sample(state.abb[1:3], num, replace = T) ,
       event_occurs = sample(c("Yes", "No"), num, replace = T) %>% 
         factor()) %>% 
  count(type, state, event_occurs,.drop = F) %>% 
  ggplot() + 
  aes(x = type, y = n, fill = event_occurs) +
  facet_grid(state~.) +
  geom_col(position = "dodge", 
           width = 0.7,
           color = "grey35") +
  geom_text(aes(label = n), 
            position = position_dodge(width = .7), 
            vjust = -0.5) +
  scale_y_continuous(limits = c(0,4))
