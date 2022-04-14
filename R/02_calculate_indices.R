# load required packages ------------------------------------------------------
library(tidyverse) # data manipulation
library(ggridges)  # plotting 
library(viridis)   # colors 

# source custom functions 
source('./R/functions/amide_phosphate_ratio.R')

# set ggplot theme
theme_set(theme_classic())

# load the data ---------------------------------------------------------------
goat_data <- read.csv(file = './data/processed_spectra/goat_data.csv')
deer_data <- read.csv(file = './data/processed_spectra/deer_data.csv')
shark_data <- read.csv(file = './data/processed_spectra/shark_data.csv')

# calculate amide / phosphate ratios ------------------------------------------
# goat ratios
goat_ratio <- goat_data %>% 
  group_by(file_name) %>% 
  do(amide_phosphate_ratio(.)) %>% 
  add_column(species = 'goat')

# deer ratios
deer_ratio <- deer_data %>% 
  group_by(file_name) %>% 
  do(amide_phosphate_ratio(.)) %>% 
  add_column(species = 'deer')

# shark ratios
shark_ratio <- shark_data %>% 
  group_by(file_name) %>% 
  do(amide_phosphate_ratio(.)) %>% 
  add_column(species = 'shark')

all_ratios <- rbind(shark_ratio, 
      deer_ratio, 
      goat_ratio)

write_csv(all_ratios, file = './data/ap_ratio.csv')

# plot the results ------------------------------------------------------------
goat_AP <- goat_ratio %>% 
  ggplot(mapping = aes(x = time, 
                       y = AP, 
                       color = factor(time))) + 
  geom_point(size = 3) +
  scale_color_discrete_sequential(palette = 'Viridis',
                                  rev = FALSE,
                                  alpha = 0.75) + 
  theme(legend.position = 'none',
        axis.text = element_text(size = 8,
                                 family = 'Helvetica',
                                 color = 'black')) +
  xlab('time (minutes)') +
  ylab(expression(frac(Amide~I, nu[2]*PO[4]))) + 
  ylim(0, 10) + 
  ggtitle(expression(italic('Capra hircus'))) + 
  scale_x_log10(breaks = c(5, 10, 15, 30, 60, 120, 1080, 1440),
                labels = c('5 min', 
                           '10 min',
                           '15 min',
                           '30 min', 
                           '1 hr', 
                           '2 hr', 
                           '18 hr', 
                           '24 hr'))

deer_AP <- deer_ratio %>% 
  ggplot(mapping = aes(x = time, 
                       y = AP, 
                       color = factor(time))) + 
  geom_point(size = 3) +
  scale_color_discrete_sequential(palette = 'Plasma',
                                  rev = FALSE,
                                  alpha = 0.75) + 
  theme(legend.position = 'none',
        axis.text = element_text(size = 8,
                                 family = 'Helvetica',
                                 color = 'black')) +
  xlab('time (minutes)') +
  ylab(expression(frac(Amide~I, nu[2]*PO[4]))) + 
  ylim(0, 10) + 
  ggtitle(expression(italic('Odocoileus virginianus'))) + 
  scale_x_log10(breaks = c(5, 10, 15, 30, 60, 120, 1080, 1440),
                labels = c('5 min', 
                           '10 min',
                           '15 min',
                           '30 min', 
                           '1 hr', 
                           '2 hr', 
                           '18 hr', 
                           '24 hr'))

shark_AP <- shark_ratio %>% 
  ggplot(mapping = aes(x = time, 
                       y = AP, 
                       color = factor(time))) + 
  geom_point(size = 3) +
  scale_color_discrete_sequential(palette = 'Mako',
                                  rev = FALSE,
                                  alpha = 0.75) + 
  theme(legend.position = 'none',
        axis.text = element_text(size = 8,
                                 family = 'Helvetica',
                                 color = 'black'),
  ) +
  xlab('time (minutes)') +
  ylab(expression(frac(Amide~I, nu[2]*PO[4]))) + 
  ylim(0, 10) + 
  # xlim(0, 125) + 
  ggtitle(expression(italic('Prionace glauca'))) + 
  scale_x_log10(breaks = c(5, 10, 15, 30, 60, 120, 1080, 1440),
                labels = c('5 min', 
                           '10 min',
                           '15 min',
                           '30 min', 
                           '1 hr', 
                           '2 hr', 
                           '18 hr', 
                           '24 hr'))


pdf(file = './figures/ratio.pdf', width = 6.5, height = 6)
cowplot::plot_grid(goat_AP,
                   deer_AP,
                   shark_AP,
                   align = 'vh',
                   nrow = 3)
dev.off()


