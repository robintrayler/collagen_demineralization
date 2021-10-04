# rm(list = ls())
# load required packages ------------------------------------------------------
library(tidyverse)
library(ggridges)
library(viridis)
theme_set(theme_minimal())

# source functions 
source('./R/fit_baseline.R')
source('./R/normalize_height.R')
source('./R/smooth_spectra.R')
# read the data ---------------------------------------------------------------
files <- list.files(path = './data/goat_dentine/',
                    full.names = TRUE)

# define a function to read and parse the dpt files
read_data <- function(file_path) {
  
  dat <- read_table(file = file_path, 
                    col_names = FALSE) %>% 
    rename('wavenumber' = X1,
           'absorbance' = X2)
  interp_grid <- seq((min(dat$wavenumber)), max(dat$wavenumber))
  f <- dat %>% with(approxfun(x = wavenumber, y = absorbance))
  
  dat <- data.frame(wavenumber = interp_grid, 
                    absorbance = f(interp_grid))
  
  dat %>% 
    mutate(file_name = basename(file_path),
           time_min = str_split_fixed(basename(file_path), 
                                      pattern = "\\.", 
                                      n = 4)[2] %>% as.numeric())
}

# read in all the files 
all_data <- files %>% 
  map(read_data) %>% 
  reduce(rbind)

# smooth and subtract baselines -----------------------------------------------

# smooth using a spline to reduce random noise
all_data <- all_data %>% 
  group_by(file_name) %>% 
  do(smooth_spectra(.))

# normalize to the height of the most prominent amide band
all_data <- all_data %>% 
  group_by(file_name) %>% 
  do(normalize_height(.,
                      position = 1650, 
                      width = 20)) %>% 
  ungroup()

# subtract baselines by fitting a spline to areas of low absorbance
backgroud_positions <- c(4000, 3950, # must be in high - low, high-low order
                         2050, 1950,
                         800, 750,
                         400, 350)
all_data <- all_data %>%
  group_by(file_name) %>%
  do(fit_baseline(., 
                  backgroud_positions = backgroud_positions)) %>%
  ungroup()


all_data %>% write_csv(file = './data/corrected_goat.csv')

# plot the results ------------------------------------------------------------  
color <- 'magma'

annotations <- tribble(~label,                ~wavenumber,   ~label_pos, ~bottom, ~top,
                       'amide~I',            1640,          23,        1,    22.5,
                       'amide~II',           1545,          22,        1,    21.0,
                       'A~CO[3]',            1540,        21.5,        1,    20.5,
                       'B~CO[3]',            1415,          21,        1,    20.5,
                       'amide~III',          1230,        20.5,        1,    20.0,
                       'nu[3]*PO[4]',        1020,        20.5,        1,    20.0,
                       'CO[3]',               870,          20,        1,    19.5,
                       'nu[2]*PO[4]',         565,          20,        1,    20.0)

time_text <- tibble(wavenumber = rep(400, length = length(unique(all_data$time_min))), 
                    time_min   = seq_along(unique(all_data$time_min)) + 0.25, 
                    label = unique(all_data$time_min))

p <- all_data %>%
  filter(wavenumber < 2000) %>% 
  ggplot(mapping = aes(x = wavenumber,
                       y = factor(time_min),
                       height = absorbance,
                       fill = file_name,
                       color = file_name)) +
  geom_density_ridges(stat = "identity",
                      scale = 6) +
  theme_minimal() +
  theme(legend.position = 'none',
        panel.grid.minor = element_blank(),
        axis.text.y = element_blank()) + 
  scale_color_viridis(discrete = TRUE, 
                      option = color, 
                      begin = 0.2,
                      end = 0.8) + 
  scale_fill_viridis(discrete = TRUE, 
                     option = color, 
                     begin = 0.2,
                     end = 0.8,
                     alpha = 0.5) + 
  xlim(1900, 325) + 
  xlab(expression(wavenumber~'('~cm^{-1}~')')) + 
  ylab('Absorbance') + 
  geom_segment(data = annotations,
               mapping = aes(x = wavenumber,
                             xend = wavenumber,
                             y = bottom,
                             yend = top), 
               inherit.aes = FALSE,
               linetype = 'dotted',
               alpha = 0.75) +
  geom_text(data = annotations, 
            mapping = aes(x = wavenumber,
                          y = label_pos,
                          label = label),
            parse = TRUE,
            inherit.aes = FALSE,
            size = 3) + 
  
  annotate(geom = 'text', 
           x = 400, 
           y = 21,
           label = 'time\n(min)',
           hjust = 0) + 
  geom_text(data = time_text, 
            mapping = aes(x = wavenumber, 
                          y = time_min,
                          label = label), 
            inherit.aes = FALSE,
            hjust = 0) +
  scale_y_discrete(expand = expansion(mult = c(0, 0.25))) + 
  ggtitle(label = expression(italic('Capra hircus')))


pdf(file = './figures/dentine_spectra.pdf',
    width = 5,
    height = 10)
p
dev.off()

# calculate amide / phosphate ratios ------------------------------------------

calculate_AP <- function(data) {
  amine <- data %>% 
    filter(between(wavenumber, left = 1610, right = 1690)) %>% 
    pull(absorbance) %>% max()
  
  phosphate <- data %>% 
    filter(between(wavenumber, left = 535, right = 555)) %>% 
    pull(absorbance) %>% max()
  
  return(amine / phosphate)
}

times <- unique(all_data$time_min)
AP_storage <- data.frame(times = times, AP = 0)
for(i in seq_along(times)) {
  AP_storage$AP[i] <- all_data %>% 
    filter(time_min == times[i]) %>% 
    calculate_AP()
}
# 
# AP_storage %>%
#   ggplot(mapping = aes(x = times,
#                        y = AP,
#                        color = times)) +
#   geom_point(size = 3) +
#   scale_color_viridis(
#     option = color,
#     begin = 0.2,
#     end = 0.8) +
#   theme(legend.position = 'none') + 
#   xlab('time (minutes)') + 
#   ylab(expression(Amide~III/nu[3]*PO[4]^{-3})) + 
#   geom_smooth(data = AP_storage %>% filter(times > 0), method = 'lm')
# 
# AP_storage %>% filter(times > 0) %>% lm(AP ~ times, data = .) %>% summary()
