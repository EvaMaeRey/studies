bind_rows(all_data %>% 
            mutate(which_subset = "all"),
          child_data %>% 
            mutate(which_subset = "child"),
          female_data %>% 
            mutate(which_subset = "female"),
          child_or_female_data %>% 
            mutate(which_subset = 
                     "child_or_female")) %>%
  mutate(which_subset = 
           fct_inorder(which_subset)) ->
bound_rows
  
bound_rows %>%   
  group_by(which_subset, Survived) %>%  # here 3 different outcomes, maybe doing some na subset
  count() %>% 
  group_by(which_subset) %>% 
  mutate(percent = (100*n/sum(n)) %>% 
           round(1)) ->
my_table; my_table
