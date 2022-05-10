# load required packages ------------------------------------------------------
library(tidyverse) # data manipulation
library(ggridges)  # plotting 
library(RColorBrewer)
library(colorspace)
library(viridis)

# source custom functions 
source('./R/functions/plot_spectra.R')

# set ggplot theme
theme_set(theme_classic())

# load the data ---------------------------------------------------------------
goat_data <- read.csv(file = './data/processed_spectra/goat_data.csv') %>% 
  filter(!(file_name %in% c("goatRT.1080.1", 
                            "goatRT.1080.2",
                            "goatRT.1080.3", 
                            "goatRT.1440.1", 
                            "goatRT.1440.2", 
                            "goatRT.1440.3")))
deer_data <- read.csv(file = './data/processed_spectra/deer_data.csv') %>% 
  filter(!(file_name %in% c("deerRT.1080.2", 
                            "deerRT.1080.3",
                            "deerRT.1440.1", 
                            "deerRT.1440.2",
                            "deerRT.1440.3")))
shark_data <- read.csv(file = './data/processed_spectra/shark_data.csv') %>% 
  filter(!(file_name %in% c("sharkRT.1080.1", 
                            "sharkRT.1080.2",
                            "sharkRT.1080.3", 
                            "sharkRT.1440.1", 
                            "sharkRT.1440.2", 
                            "sharkRT.1440.3")))

# plot the results ------------------------------------------------------------
# data frame of FTIR absorbance band labels
annotations <- tribble(~label,          ~wavenumber, ~label_pos, ~bottom, ~top,
                       'amide~I',        1640,          25,        1,    24.5,
                       'amide~II',       1545,          24,        1,    23.5,
                       'A~CO[3]',        1540,        23.5,        1,    22.5,
                       'B~CO[3]',        1415,          23,        1,    22.5,
                       'amide~III',      1230,        22.5,        1,    22.0,
                       'nu[3]*PO[4]',    1020,        23.0,        1,    22.0,
                       'CO[3]',           870,          22,        1,    21.5,
                       'nu[2]*PO[4]',     565,          22,        1,    22.0,
                       'lipid',           720,          22,        1,    22.0,
                       'lipid',          1150,          22,        1,    22.0,
                       'lipid',          1746,          22,        1,    22.0,
                       'lipid',          2854,          22,        1,    22.0,
                       'lipid',          2925,          22,        1,    22.0,
                       'lipid',          1150,          22,        1,    22.0,
                       'lipid',           720,          22,        1,    22.0)

# plot 
goat_spectra <- goat_data |>
  plot_spectra(annotations, 
               scale = 3) + 
  scale_color_viridis(option = 'viridis',
                                  discrete = TRUE,
                      end = 0.8) + 
  scale_fill_viridis(option = 'viridis',
                     discrete = TRUE,
                                 alpha = 0.4,
                     end = 0.8) + 
  ggtitle(expression(italic('Capra hircus'))) #+ 
  xlim(1900, 400)

deer_spectra <- deer_data |>  
  plot_spectra(annotations, scale = 3) + 
  scale_color_viridis(option = 'plasma',
                      discrete = TRUE,
                      end = 0.8) + 
  scale_fill_viridis(option = 'plasma',
                     discrete = TRUE,
                     alpha = 0.4,
                     end = 0.8) + 
  ggtitle(expression(italic('Odocoileus virginianus'))) #+ 
  xlim(1900, 400)

shark_spectra <- shark_data |> 
  plot_spectra(annotations, scale = 3) +
  scale_color_viridis(option = 'mako',
                      discrete = TRUE,
                      end = 0.8) + 
  scale_fill_viridis(option = 'mako',
                     discrete = TRUE,
                     alpha = 0.4,
                     end = 0.8) + 
  ggtitle(expression(italic('Prionace glauca'))) #+
  xlim(1900, 400)

# save the plots for later
pdf(file = './figures/all_spectra.pdf', width = 8, height = 6)
cowplot::plot_grid(goat_spectra, 
                   deer_spectra, 
                   shark_spectra, 
                   nrow = 1, 
                   align = 'v')
dev.off()
