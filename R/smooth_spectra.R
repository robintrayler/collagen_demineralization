smooth_spectra <- function(data) {
  source('./R/gaussian_smooth.R')
  # with(gaussian_smooth(x = wavenumber, y = absorbance))
  # spline <- data %>% with(smooth.spline(x = wavenumber, 
  #                                       y = absorbance))
  
  # f <- approxfun(x = spline$x, y = spline$y)
  data <- data %>% mutate(absorbance = gaussian_smooth(x = wavenumber,
                                                        y = absorbance,
                                                        winsize = 5))
  
  # data <- data %>% mutate(absorbance = ksmooth(x = wavenumber, 
  #                                              y = absorbance, 
  #                                              kernel = 'normal',
  #                                              bandwidth = 0.001,
  #                                              n.points = 5000)$)
  return(data)
}

