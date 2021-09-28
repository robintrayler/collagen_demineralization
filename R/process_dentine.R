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
# read the data ---------------------------------------------------------------
files <- list.files(path = './data/goat_dentine/',
                    full.names = TRUE)

# define a function to read and parse the dpt files
read_data <- function(file_path) {
  read_table(file = file_path, 
             col_names = FALSE) %>% 
    rename('wavenumber' = X1,
           'absorbance' = X2) %>% 
    mutate(file_name = basename(file_path),
           time_min = str_split_fixed(basename(file_path), 
                                      pattern = "\\.", 
                                      n = 4)[2] %>% as.numeric())
}

# read in all the files 
all_data <- files %>% 
  map(read_data) %>% 
  reduce(rbind)

# smooth and subtract baselines -----------------------------------------------

# smooth using a spline to reduce random noise
all_data <- all_data %>% 
  group_by(file_name) %>% 
  do(smooth_spectra(.))

# normalize to the height of the most prominent amide band
all_data <- all_data %>% 
  group_by(file_name) %>% 
  do(normalize_height(.,
                      position = 1650, 
                      width = 20)) %>% 
  ungroup()

# subtract baselines by fitting a spline to areas of low absorbance
backgroud_positions <- c(4000, 3950, # must be in high - low, high-low order
                         2050, 1950,
                         800, 750,
                         400, 350)
all_data <- all_data %>%
  group_by(file_name) %>%
  do(fit_baseline(., 
                  backgroud_positions = backgroud_positions)) %>%
  ungroup()

# plot the results ------------------------------------------------------------  
color <- 'inferno'
  all_data %>%
  filter(wavenumber < 2000) %>% 
  ggplot(mapping = aes(x = wavenumber,
                       y = factor(time_min),
                       height = absorbance_corrected,
                       fill = file_name,
                       color = file_name)) +
  geom_density_ridges2(stat = "identity", 
                      scale = 8,
                      alpha = 0.75) + 
  theme_void() +
  theme(legend.position = 'none') + 
  scale_fill_viridis(discrete = TRUE, 
                     option = color, 
                     begin = 0.2,
                     end = 0.8) +
  scale_color_viridis(discrete = TRUE, 
                     option = color, 
                     begin = 0.2,
                     end = 0.8) + 
  xlim(1800, 400) + 
  xlab(expression(wavenumber~'('~cm^{-1}~')')) + 
  ylab('time (minutes)')
  


