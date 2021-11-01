interpolate_spectra <- function(data) {
  grid <- seq(400, 4000, by = 1)
  f <- data %>% 
    with(approxfun(
      x = wavenumber,
      y = absorbance, 
      rule = 2))
  data <- tibble(wavenumber = grid, 
                 absorbance = f(grid))
  return(data)
}
