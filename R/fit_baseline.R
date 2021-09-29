fit_baseline <- function(data, 
                         backgroud_positions) {
  # define backgrounds ------------------------------------
  b <- length(backgroud_positions)
  strng <- character()
  for(i in seq(1, b, by = 2)) {
    strng[i] <- paste0(
      'between(',
      'wavenumber', 
      ',',
      'left=', backgroud_positions[i + 1],
      ',',
      'right=',backgroud_positions[i],')')
  }
  
  # remove NA's -------------------------------------------
  strng <- paste(strng[!is.na(strng)], 
                 collapse = '|')
  
  # subset backgrounds 
  backgrounds <- data %>% 
    filter(eval(parse(text = strng)))
  
  # fit a spline ------------------------------------------
  spline_fit <- smooth.spline(x = backgrounds$wavenumber, 
                              y = backgrounds$absorbance,
                              spar = 0.5)
  
  # form interpolation function ---------------------------
  f <- approxfun(x = spline_fit$x, y = spline_fit$y)
  
  data <- data %>% 
    mutate(absorbance = absorbance - f(wavenumber)) %>% 
    muatate(absorbance = absorbance + abs(min(absorbance)))
  
  return(data)
}