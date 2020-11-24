my_table %>% 
  ggplot() +
  aes(x = which_subset) +
  aes(y = percent) +
  geom_col(alpha = .5,
           color = "grey") +
  aes(fill = Survived) +
  scale_fill_manual(values = c("oldlace", "plum")) +
  geom_text(aes(label = 
                  paste0(percent, 
                         "%","\ncount:", 
                         n),
                alpha = Survived),
            y = 3,
            vjust = 0,
            lineheight = .7, show.legend = F) +
  scale_y_continuous(limits = c(0,100)) +
  theme_minimal() 
