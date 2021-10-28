process_data <- function(file_path) {
  pb$tick()
  source('./R/fit_baseline.R')
  source('./R/normalize_height.R')
  source('./R/smooth_spectra.R')
  background_positions <- c(4000, 3950, # must be in high - low, high-low order
                            2050, 1950,
                            800, 750,
                            400, 350)
  
  dat <- read_table(file = file_path, 
                    col_names = FALSE,
                    progress = FALSE,
                    col_types = cols()) %>% 
    rename('wavenumber' = X1,
           'absorbance' = X2) %>% 
    smooth_spectra() %>%
    normalize_height(position = 1650, width = 20) %>%
    fit_baseline(backgroud_positions = background_positions) %>%
    mutate(file_name = tools::file_path_sans_ext(basename(file_path)),
           time_min = str_split_fixed(basename(file_path), 
                                      pattern = "\\.", 
                                      n = 4)[2] %>% as.numeric()) %>% 
    return()
}