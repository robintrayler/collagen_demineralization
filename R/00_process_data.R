# load required packages ------------------------------------------------------
library(tidyverse) # data manipulation
library(progress)  # progress bars 

# source custom functions 
source('./R/functions/process_spectra.R')

# read the data ---------------------------------------------------------------
# goat data
pb <- progress_bar$new(
  total = length(list.files(path = './data/goat_ATR/')))

goat_data <- list.files(path = './data/goat_ATR/', 
                        full.names = TRUE) %>% 
  map(process_spectra)  %>%  
  reduce(rbind)  %>% 
  write_csv(file = './data/processed_spectra/goat_data.csv')

# deer data
pb <- progress_bar$new(
  total = length(list.files(path = './data/deer_ATR/')))

deer_data <- list.files(path = './data/deer_ATR/', 
                        full.names = TRUE)  %>% 
  map(process_spectra)  %>%  
  reduce(rbind)  %>% 
  write_csv(file = './data/processed_spectra/deer_data.csv')

# shark data
pb <- progress_bar$new(
  total = length(list.files(path = './data/shark_ATR/')))

shark_data <- list.files(path = './data/shark_ATR/', 
                    	 full.names = TRUE)  %>%
  map(process_spectra)  %>%
  reduce(rbind)  %>%
  write_csv(file = './data/processed_spectra/shark_data.csv')

