smooth_spectra <- function(data) {
  source('./R/gaussian_smooth.R')
  # with(gaussian_smooth(x = wavenumber, y = absorbance))
  # spline <- data %>% with(smooth.spline(x = wavenumber, 
  #                                       y = absorbance))
  
  # f <- approxfun(x = spline$x, y = spline$y)
  data <- data %>% mutate(absorbance = gaussian_smooth(x = wavenumber, 
                                                        y = absorbance,
                                                        winsize = 5))
  return(data)
}
