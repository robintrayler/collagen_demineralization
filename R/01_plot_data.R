# load required packages ------------------------------------------------------
library(tidyverse) # data manipulation
library(ggridges)  # plotting 
library(viridis)   # colors 

# source custom functions 
source('./R/functions/plot_spectra.R')

# set ggplot theme
theme_set(theme_classic())

# load the data ---------------------------------------------------------------
goat_data <- read.csv(file = './data/processed_spectra/goat_data.csv')
deer_data <- read.csv(file = './data/processed_spectra/deer_data.csv')
shark_data <- read.csv(file = './data/processed_spectra/shark_data.csv')

# plot the results ------------------------------------------------------------
# data frame of FTIR absorbance band labels
annotations <- tribble(~label,          ~wavenumber, ~label_pos, ~bottom, ~top,
                       'amide~I',        1640,          23,        1,    22.5,
                       'amide~II',       1545,          22,        1,    21.0,
                       'A~CO[3]',        1540,        21.5,        1,    20.5,
                       'B~CO[3]',        1415,          21,        1,    20.5,
                       'amide~III',      1230,        20.5,        1,    20.0,
                       'nu[3]*PO[4]',    1020,        21.0,        1,    20.0,
                       'CO[3]',           870,          20,        1,    19.5,
                       'nu[2]*PO[4]',     565,          20,        1,    20.0)

# plot 
goat_spectra <- goat_data %>% 
  plot_spectra(annotations, color = 'magma', scale = 3) + 
  ggtitle(expression(italic('Capra hircus'))) + 
  xlim(1900, 400)

deer_spectra <- deer_data %>% 
  plot_spectra(annotations, color = 'viridis', scale = 3) + 
  ggtitle(expression(italic('Odocoileus virginianus'))) + 
  xlim(1900, 400)

shark_spectra <- shark_data %>%
  plot_spectra(annotations, color = 'mako', scale = 3) +
  ggtitle(expression(italic('Prionace glauca'))) +
  xlim(1900, 400)

# save the plots for later
pdf(file = './figures/all_spectra.pdf', width = 8, height = 6)
cowplot::plot_grid(goat_spectra, 
                   deer_spectra, 
                   shark_spectra, 
                   nrow = 1, 
                   align = 'v')
dev.off()
