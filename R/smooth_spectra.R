smooth_spectra <- function(data) {
  spline <- data %>% with(smooth.spline(x = wavenumber, 
                                        y = absorbance))
  
  f <- approxfun(x = spline$x, y = spline$y)
  data <- data %>% mutate(absorbance_corrected = f(wavenumber))
  return(data)
}