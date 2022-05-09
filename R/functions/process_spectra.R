process_spectra <- function(file_path) {
  pb$tick()
  source('./R/functions/fit_baseline.R')
  source('./R/functions/normalize_height.R')
  source('./R/functions/smooth_spectra.R')
  source('./R/functions/interpolate_spectra.R')
  background_positions <- c(4000, 3950, # must be in high - low, high-low order
                            2050, 1950,
                            800, 775,
                            400, 350)
  
  dat <- read_table(file = file_path, 
                    col_names = FALSE,
                    progress = FALSE,
                    col_types = cols()) |> 
    rename('wavenumber' = X1,
           'absorbance' = X2) |> 
    interpolate_spectra() |> 
    smooth_spectra() |> 
    normalize_height(position = 1650, width = 20) |> 
    fit_baseline(backgroud_positions = background_positions) |> 
    mutate(file_name = tools::file_path_sans_ext(basename(file_path)),
           time_min = str_split_fixed(basename(file_path), 
                                      pattern = "\\.", 
                                      n = 4)[2] |> as.numeric())
  
    return(dat)
}