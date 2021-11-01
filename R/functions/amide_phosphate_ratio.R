amide_phosphate_ratio <- function(data) {
  amide <- data %>% 
    filter(between(wavenumber, left = 1610, right = 1690)) %>% 
    pull(absorbance) %>% max()
  phosphate <- data %>% 
    filter(between(wavenumber, left = 535, right = 555)) %>% 
    pull(absorbance) %>% max()
  
  tibble(AP        = amide  / phosphate, 
         time      = unique(data$time_min),
         file_name = unique(data$file_name)) %>% 
    return()
}