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