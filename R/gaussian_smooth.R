# Nonparametric Smoothing Function --------------------------------------------
gaussian_smooth <- function(x, y, xmod = x, winsize){
  ## INPUTS
  ## x = x values
  ## y = yvalues
  ## xmod = positions to calculate statistics at. default is data positions
  ## winsize = standard deviation for gaussian kernel
  ## OUTPUTS
  ## mean = ymod = the weighted moving mean
  ## sd = ymodsd = the weighted moving standard deviation
  ## se = ymodse = the weighted moving standard error
  ymod <- vector(length = length(xmod)) # preallocate
  ymodsd <- vector(length = length(xmod)) # preallocate
  ymodse <- vector(length = length(xmod)) # preallocate
  
  for (i in 1:length(xmod)) { # for each value in xmod
    w <- dnorm(x, xmod[i], winsize) # weights 
    ymod[i] <- sum(w * y) / sum(w) # calculate the moving weighted mean
  }
  return (mean = ymod) 
}


# nonparametric_smooth <- function(x, y, xmod = x, winsize) {
#   f <- function(xmod) {dnorm(x, xmod, sd = winsize)}
#   w <- sapply(X = xmod, FUN = f)
#   f_smooth <- function(w) {sum(w * y) / sum(w)}
#   return(mean = apply(w, 2, f_smooth))
# }

# 
# start_time <- Sys.time()
# y2 <- nonparametric_smooth(x, y, winsize = 0.05)
# end_time <- Sys.time()
# print(end_time - start_time)
# 
# start_time <- Sys.time()
# y3 <- gaussian_smooth(x, y, winsize = 0.05)
# end_time <- Sys.time()
# print(end_time - start_time)
