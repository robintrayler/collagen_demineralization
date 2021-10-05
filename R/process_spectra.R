rm(list = ls())
# load required packages ------------------------------------------------------
library(tidyverse)
library(ggridges)
library(viridis)
theme_set(theme_minimal())

# source functions 
source('./R/fit_baseline.R')
source('./R/normalize_height.R')
source('./R/smooth_spectra.R')
source('./R/process_data.R')
source('./R/plot_spectra.R')
# read the data ---------------------------------------------------------------
goat_data <- list.files(path = './data/goat_dentine/', full.names = TRUE) %>% 
  map(process_data) %>% 
  reduce(rbind)

deer_data <- list.files(path = './data/deer_bone/', full.names = TRUE) %>% 
  map(process_data) %>% 
  reduce(rbind)

# shark_data <- list.files(path = './data/shark_dentine/', full.names = TRUE) %>% 
#   map(process_data) %>% 
#   reduce(rbind)

# plot the results ------------------------------------------------------------
goat_color  <- 'magma'
deer_color  <- 'viridis'
shark_color <- 'mako'

# data frame of FTIR absorbance band labels
annotations <- tribble(~label,          ~wavenumber, ~label_pos, ~bottom, ~top,
                       'amide~I',        1640,          23,        1,    22.0,
                       'amide~II',       1545,          22,        1,    21.0,
                       'A~CO[3]',        1540,        21.5,        1,    20.5,
                       'B~CO[3]',        1415,          21,        1,    20.5,
                       'amide~III',      1230,        20.5,        1,    20.0,
                       'nu[3]*PO[4]',    1020,        20.5,        1,    20.0,
                       'CO[3]',           870,          20,        1,    19.5,
                       'nu[2]*PO[4]',     565,          20,        1,    20.0)

# plot 
goat_spectra <- goat_data %>% 
  plot_spectra(annotations, color = 'magma') + 
  ggtitle(expression(italic('Capra'))) + 
  xlim(1900, 350)

deer_spectra <- deer_data %>% 
  plot_spectra(annotations, color = 'viridis') + 
  ggtitle(expression(italic('Odocoileus'))) + 
  xlim(1900, 350)

# shark_spectra <- shark_data %>% 
#   plot_spectra(annotations, color = 'mako') + 
#   ggtitle(expression(italic('baby shark do do'))) + 
#   xlim(1900, 350)


# save the plots for later
pdf(file = './figures/all_spectra.pdf', width = 6, height = 10)
cowplot::plot_grid(goat_spectra, deer_spectra, nrow = 1)
dev.off()

# calculate amide / phosphate ratios ------------------------------------------

calculate_AP <- function(data) {
  amine <- data %>% 
    filter(between(wavenumber, left = 1610, right = 1690)) %>% 
    pull(absorbance) %>% max()
  phosphate <- data %>% 
    filter(between(wavenumber, left = 535, right = 555)) %>% 
    pull(absorbance) %>% max()
  return(amine / phosphate)
}


file_path <- unique(all_data$file_name)
AP_storage <- data.frame(file_path = file_path, AP = 0)

for(i in seq_along(file_path)) {
  AP_storage$AP[i] <- all_data %>% 
    filter(file_name == file_path[i]) %>% 
    calculate_AP()
}

AP_storage <- AP_storage %>% 
  mutate(time = str_split_fixed(string = file_path, 
                                pattern = '\\.', n = 4)[,2] %>% 
           as.numeric())


AP_deer <- AP_storage %>%
  ggplot(mapping = aes(x = time,
                       y = AP,
                       color = time)) +
  geom_point(size = 3) +
  scale_color_viridis(
    option = color,
    begin = 0.2,
    end = 0.8,
    alpha = 0.75) +
  theme(legend.position = 'none') +
  xlab('time (minutes)') +
  ylab(expression(frac(Amide~III, nu[3]*PO[4]))) + 
  ylim(0, 8)
