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

# plot the results ------------------------------------------------------------
goat_AP <- goat_ratio %>% 
  ggplot(mapping = aes(x = time, 
                       y = AP, 
                       color = time)) + 
  geom_point(size = 3) +
  scale_color_viridis(
    option = 'magma',
    begin = 0.2,
    end = 0.8,
    alpha = 0.75) +
  theme(legend.position = 'none',
        axis.text = element_text(size = 8,
                                 family = 'Helvetica',
                                 color = 'black')) +
  xlab('time (minutes)') +
  ylab(expression(frac(Amide~I, nu[2]*PO[4]))) + 
  ylim(0, 10) + 
  xlim(0, 125) + 
  ggtitle(expression(italic('Capra hircus')))

deer_AP <- deer_ratio %>% 
  ggplot(mapping = aes(x = time, 
                       y = AP, 
                       color = time)) + 
  geom_point(size = 3) +
  scale_color_viridis(
    option = 'viridis',
    begin = 0.2,
    end = 0.8,
    alpha = 0.75) +
  theme(legend.position = 'none',
        axis.text = element_text(size = 8,
                                 family = 'Helvetica',
                                 color = 'black')) +
  xlab('time (minutes)') +
  ylab(expression(frac(Amide~I, nu[2]*PO[4]))) + 
  ylim(0, 10) + 
  xlim(0, 125) +
  ggtitle(expression(italic('Odocoileus virginianus')))

shark_AP <- shark_ratio %>% 
  ggplot(mapping = aes(x = time, 
                       y = AP, 
                       color = time)) + 
  geom_point(size = 3) +
  scale_color_viridis(
    option = 'mako',
    begin = 0.2,
    end = 0.8,
    alpha = 0.75) +
  theme(legend.position = 'none',
        axis.text = element_text(size = 8,
                                 family = 'Helvetica',
                                 color = 'black'),
  ) +
  xlab('time (minutes)') +
  ylab(expression(frac(Amide~I, nu[2]*PO[4]))) + 
  ylim(0, 10) + 
  xlim(0, 125) + 
  ggtitle(expression(italic('Prionace glauca')))


pdf(file = './figures/ratio.pdf', width = 7.5, height = 2.5)
cowplot::plot_grid(goat_AP,
                   deer_AP,
                   shark_AP,
                   align = 'vh',
                   nrow = 1)
dev.off()
