# load required packages ------------------------------------------------------
library(tidyverse)
library(ggridges)
library(viridis)
library(progress)
theme_set(theme_classic())

# source functions 
source('./R/process_data.R')
source('./R/plot_spectra.R')
# read the data ---------------------------------------------------------------
pb <- progress_bar$new(total = length(list.files(path = './data/goat_dentine/')))
goat_data <- list.files(path = './data/goat_dentine/', full.names = TRUE) %>% 
  map(process_data) %>% 
  reduce(rbind)

pb <- progress_bar$new(total = length(list.files(path = './data/deer_bone/')))
deer_data <- list.files(path = './data/deer_bone/', full.names = TRUE) %>% 
  map(process_data) %>% 
  reduce(rbind)

pb <- progress_bar$new(total = length(list.files(path = './data/shark_dentine/')))
shark_data <- list.files(path = './data/shark_dentine/', full.names = TRUE) %>%
  map(process_data) %>%
  reduce(rbind)

# plot the results ------------------------------------------------------------
# data frame of FTIR absorbance band labels
annotations <- tribble(~label,          ~wavenumber, ~label_pos, ~bottom, ~top,
                       'amide~I',        1640,          23,        1,    22.5,
                       'amide~II',       1545,          22,        1,    21.0,
                       'A~CO[3]',        1540,        21.5,        1,    20.5,
                       'B~CO[3]',        1415,          21,        1,    20.5,
                       'amide~III',      1230,        20.5,        1,    20.0,
                       'nu[3]*PO[4]',    1020,        20.5,        1,    20.0,
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
cowplot::plot_grid(goat_spectra, deer_spectra, shark_spectra, nrow = 1, align = 'v')
dev.off()

# calculate amide / phosphate ratios ------------------------------------------
amide_phosphate_ratio <- function(data) {
  amide <- data %>% 
    filter(between(wavenumber, left = 1610, right = 1690)) %>% 
    pull(absorbance) %>% max()
  phosphate <- data %>% 
    filter(between(wavenumber, left = 535, right = 555)) %>% 
    pull(absorbance) %>% max()
  
  tibble(AP        = amide  / phosphate, 
         time      = unique(data$time_min),
         file_name = unique(data$file_name)) %>% 
    return()
}

deer_ratio <- deer_data %>% 
  group_by(file_name) %>% 
  do(amide_phosphate_ratio(.)) %>% 
  add_column(species = 'deer')

goat_ratio <- goat_data %>% 
  group_by(file_name) %>% 
  do(amide_phosphate_ratio(.)) %>% 
  add_column(species = 'goat')

shark_ratio <- shark_data %>% 
  group_by(file_name) %>% 
  do(amide_phosphate_ratio(.)) %>% 
  add_column(species = 'shark')

goat_ratio %>% 
  ggplot(mapping = aes(x = time, 
                       y = AP, 
                       color = time)) + 
  geom_point(size = 3) +
  scale_color_viridis(
    option = 'magma',
    begin = 0.2,
    end = 0.8,
    alpha = 0.75) +
  theme(legend.position = 'none') +
  xlab('time (minutes)') +
  ylab(expression(frac(Amide~I, nu[2]*PO[4]))) + 
  ylim(0, 8)

deer_ratio %>% 
  ggplot(mapping = aes(x = time, 
                       y = AP, 
                       color = time)) + 
  geom_point(size = 3) +
  scale_color_viridis(
    option = 'viridis',
    begin = 0.2,
    end = 0.8,
    alpha = 0.75) +
  theme(legend.position = 'none') +
  xlab('time (minutes)') +
  ylab(expression(frac(Amide~I, nu[2]*PO[4]))) + 
  ylim(0, 8)

shark_ratio %>% 
  ggplot(mapping = aes(x = time, 
                       y = AP, 
                       color = time)) + 
  geom_point(size = 3) +
  scale_color_viridis(
    option = 'mako',
    begin = 0.2,
    end = 0.8,
    alpha = 0.75) +
  theme(legend.position = 'none') +
  xlab('time (minutes)') +
  ylab(expression(frac(Amide~I, nu[2]*PO[4]))) + 
  ylim(0, 8)
