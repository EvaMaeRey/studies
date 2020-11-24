Titanic %>% 
  as.data.frame() %>% 
  uncount(weights = Freq) %>% 
  mutate(child_or_female = 
           Age == "Child"| 
           Sex == "Female" ) ->
all_data

all_data %>% 
  filter(Age == "Child") ->
child_data

all_data %>% 
  filter(Sex == "Female") ->
female_data

all_data %>% 
  filter(child_or_female) ->
child_or_female_data
