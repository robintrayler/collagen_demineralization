# load required libraries 
library(tidyverse)
library(viridis)
library(changepoint)

# load the data ---------------------------------------------------------------
data <- read_csv(file = './data/isotope_data/isotope_data.csv') %>% 
  mutate(yield = sample_wt_final/sample_wt_initial) %>% 
  rename(file_name = sample) %>% 
  filter(!is.na(time))

data <- read_csv(file = './data/ap_ratio.csv') %>% 
  select(AP, file_name) %>% 
  full_join(data, by = 'file_name') %>% 
  filter(temperature == 5)

# summarize the data ----------------------------------------------------------
summary <- data %>% 
  group_by(time, genus, temperature) %>%
  summarize(
    d13C_mean = mean(d13C_corrected, na.rm = TRUE),
    d13C_sd = sd(d13C_corrected, na.rm = TRUE), 
    d15N_mean = mean(d15N_corrected, na.rm = TRUE),
    d15N_sd = sd(d15N_corrected, na.rm = TRUE),
    AP_mean = mean(AP, na.rm = TRUE),
    AP_sd = sd(AP, na.rm = TRUE),
    C_mean = mean(C_wt_percent),
    N_mean = mean(N_wt_percent),
    `C/N_mean` = mean(`C:N_atomic`, na.rm = TRUE),
    `C/N_sd` = sd(`C:N_atomic`, na.rm = TRUE),
    yield_mean = mean(yield, na.rm = TRUE),
    yield_sd = sd(yield, na.rm = TRUE)) %>% 
  ungroup()

# changepoint analysis --------------------------------------------------------
# goat
goat_storage <- list()

tmp_data <- summary %>% 
  filter(genus == 'Capra') %>% 
  drop_na() %>% 
  select(d13C_mean,
         d15N_mean,
         C_mean,
         N_mean,
         `C/N_mean`,
         yield_mean,
         AP_mean)
time = summary %>% 
  filter(genus == 'Capra') %>% 
  pull(time)

for(i in 1:ncol(tmp_data)) {
  ans <- tmp_data %>% 
    pull(i) %>% 
    changepoint::cpt.mean(data = .)
  plot(ans)
  goat_storage[[i]] <- data.frame(changepoints = time[ans@cpts], 
                                  means = ans@param.est,
                                  param = colnames(tmp_data)[i],
                                  genus = 'Capra')
}

goat_pnts <- reduce(goat_storage, rbind)

# deer
deer_storage <- list()

tmp_data <- summary %>% 
  filter(genus == 'Odocoileus') %>% 
  drop_na() %>% 
  select(d13C_mean,
         d15N_mean,
         C_mean,
         N_mean,
         `C/N_mean`,
         yield_mean,
         AP_mean)
time = summary %>% 
  filter(genus == 'Odocoileus') %>% 
  pull(time)

for(i in 1:ncol(tmp_data)) {
  ans <- tmp_data %>% 
    pull(i) %>% 
    changepoint::cpt.mean(data = .)
  plot(ans)
  deer_storage[[i]] <- data.frame(changepoints = time[ans@cpts], 
                                  means = ans@param.est,
                                  param = colnames(tmp_data)[i],
                                  genus = 'Odocoileus')
}

deer_pnts <- reduce(deer_storage, rbind)

# shark
shark_storage <- list()

tmp_data <- summary %>% 
  filter(genus == 'Prionace') %>% 
  drop_na() %>% 
  select(d13C_mean,
         d15N_mean,
         C_mean,
         N_mean,
         `C/N_mean`,
         yield_mean,
         AP_mean)
time = summary %>% 
  filter(genus == 'Prionace') %>% 
  pull(time)

for(i in 1:ncol(tmp_data)) {
  ans <- tmp_data %>% 
    pull(i) %>% 
    changepoint::cpt.mean(data = .)
  plot(ans)
  shark_storage[[i]] <- data.frame(changepoints = time[ans@cpts], 
                                   means = ans@param.est,
                                   param = colnames(tmp_data)[i],
                                   genus = 'Prionace')
}

shark_pnts <- reduce(shark_storage, rbind)

rbind(goat_pnts, deer_pnts, shark_pnts) %>% 
  write_csv(file = './data/change_points.csv')
