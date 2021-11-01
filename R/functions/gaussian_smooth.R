# Nonparametric Smoothing Function --------------------------------------------
gaussian_smooth <- function(x, y, xmod = x, winsize){
  ## INPUTS
  ## x = x values
  ## y = yvalues
  ## xmod = positions to calculate statistics at. default is data positions
  ## winsize = standard deviation for gaussian kernel
  ## OUTPUTS
  ## mean = ymod = the weighted moving mean
  ymod <- vector(length = length(xmod)) # preallocate
  
  for (i in 1:length(xmod)) { # for each value in xmod
    w <- dnorm(x, xmod[i], winsize) # weights 
    ymod[i] <- sum(w * y) / sum(w) # calculate the moving weighted mean
  }
  return (mean = ymod) 
}