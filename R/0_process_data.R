# load required packages ------------------------------------------------------
library(tidyverse) # data manipulation
library(progress)  # progress bars 

# source custom functions 
source('./R/functions/process_spectra.R')

# read the data ---------------------------------------------------------------
# goat data
pb <- progress_bar$new(
  total = length(list.files(path = './data/goat_dentine/')))
goat_data <- list.files(path = './data/goat_dentine/', 
                        full.names = TRUE) %>% 
  map(process_spectra) %>% 
  reduce(rbind) %>% 
  write_csv(file = './data/cleaned_spectra/goat_data.csv')

# deer data
pb <- progress_bar$new(
  total = length(list.files(path = './data/deer_bone/')))
deer_data <- list.files(path = './data/deer_bone/', 
                        full.names = TRUE) %>% 
  map(process_spectra) %>% 
  reduce(rbind) %>% 
  write_csv(file = './data/cleaned_spectra/deer_data.csv')

# shark data
pb <- progress_bar$new(
  total = length(list.files(path = './data/shark_dentine/')))
shark_data <- list.files(path = './data/shark_dentine/', 
                         full.names = TRUE) %>%
  map(process_spectra) %>%
  reduce(rbind) %>% 
  write_csv(file = './data/cleaned_spectra/shark_data.csv')

