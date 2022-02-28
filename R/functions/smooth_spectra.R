smooth_spectra <- function(data) {
  source('./R/functions/gaussian_smooth.R')
  data <- data %>% mutate(absorbance = gaussian_smooth(x = wavenumber,
                                                        y = absorbance,
                                                        winsize = 2))
  return(data)
}

