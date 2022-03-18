library(tidyverse)
theme_set(theme_classic())
data <- read_csv(file = './data/isotope_data/isotope_data.csv')


data %>% 
  filter(genus == 'Odocoileus') %>% 
  ggplot(mapping = aes(x = `C/N`, 
                       y = d13C_corrected,
                       color = time)) + 
  geom_point(size = 2,
             alpha = 0.75) + 
  scale_color_viridis(option = 'plasma', 
                      begin = 0.2,
                      end = 0.8)


