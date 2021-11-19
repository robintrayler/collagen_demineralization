# load required packages ------------------------------------------------------
library(tidyverse) # data manipulation
library(progress)  # progress bars 

# source custom functions 
source('./R/functions/process_spectra.R')

# read the data ---------------------------------------------------------------
# goat data
pb <- progress_bar$new(
  total = length(list.files(path = './data/goat_ABS/')))
goat_data <- list.files(path = './data/goat_ABS/', 
                        full.names = TRUE) %>% 
  map(process_spectra) %>% 
  reduce(rbind) %>% 
  write_csv(file = './data/processed_spectra/goat_data.csv')

# deer data
pb <- progress_bar$new(
  total = length(list.files(path = './data/deer_ABS/')))
deer_data <- list.files(path = './data/deer_ABS/', 
                        full.names = TRUE) %>% 
  map(process_spectra) %>% 
  reduce(rbind) %>% 
  write_csv(file = './data/processed_spectra/deer_data.csv')

# shark data
pb <- progress_bar$new(
  total = length(list.files(path = './data/shark_dentine/')))
shark_data <- list.files(path = './data/shark_dentine/', 
                         full.names = TRUE) %>%
  map(process_spectra) %>%
  reduce(rbind) %>% 
  write_csv(file = './data/processed_spectra/shark_data.csv')

