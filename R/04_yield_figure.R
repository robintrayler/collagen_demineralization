library(tidyverse)
library(viridis)

# load data -------------------------------------------------------------------
data <- read_csv(file = './data/isotope_data/isotope_data.csv') %>% 
  mutate(yield = sample_wt_final/sample_wt_initial * 100) %>% 
  rename(file_name = sample) %>% 
  filter(!is.na(time)) %>% 
  filter(temperature < 10)

data <- read_csv(file = './data/ap_ratio.csv') %>% 
  select(AP, file_name) %>% 
  full_join(data, by = 'file_name')

change_points <- read_csv(file = './data/change_points.csv') 

change_points %>% 
  pivot_wider(names_from = 'param', values_from = c('mean')) %>% 
  view()

# summarize data --------------------------------------------------------------
summary <- data %>% 
  group_by(time, genus, temperature) %>%
  summarize(
    d13C_mean = mean(d13C_corrected, na.rm = TRUE),
    d13C_sd = sd(d13C_corrected, na.rm = TRUE), 
    d15N_mean = mean(d15N_corrected, na.rm = TRUE),
    d15N_sd = sd(d15N_corrected, na.rm = TRUE),
    AP_mean = mean(AP, na.rm = TRUE),
    AP_sd = sd(AP, na.rm = TRUE),
    C_mean = mean(C_wt_percent),
    C_sd = sd(C_wt_percent),
    N_mean = mean(N_wt_percent),
    N_sd = sd(N_wt_percent),
    `C:N_mean` = mean(`C:N_atomic`, na.rm = TRUE),
    `C:N_sd` = sd(`C:N_atomic`, na.rm = TRUE),
    yield_mean = mean(yield, na.rm = TRUE),
    yield_sd = sd(yield, na.rm = TRUE)) %>% 
  ungroup()


# set ggplot_theme ------------------------------------------------------------
theme_set(theme_classic() + 
            theme(axis.text.x = element_text(angle = 45, 
                                             vjust = 1, 
                                             hjust=1,
                                             size = 8),
                  legend.position = 'none',
                  axis.title.x = element_blank(),
                  plot.title = element_blank(),
                  panel.grid.minor.x = element_blank(),
                  panel.margin = margin(t = 1, r = 0, b = 0, l = 0, unit = 'pt')))

# plot the data ---------------------------------------------------------------

# goat data -------------------------------------------------------------------

goat_yield <- summary %>% 
  filter(genus == 'Capra') %>% 
  ggplot(mapping = aes(x = time, 
                       y = yield_mean,
                       color = factor(time),
                       shape = factor(temperature))) + 
  geom_pointrange(mapping = aes(ymin = yield_mean - yield_sd * 2,
                                ymax = yield_mean + yield_sd * 2)) + 
  scale_color_viridis(option = 'viridis',
                      discrete =TRUE,
                      end = 0.8,
                      alpha = 0.75) + 
  ylim(0, 100) +
  ylab('sample remaining (%)')  + 
  scale_x_log10(breaks = c(0, 5, 10, 15, 30, 60, 120, 1080, 1440),
                labels = c('0 min',
                           '5 min', 
                           '10 min',
                           '15 min',
                           '30 min', 
                           '1 hr', 
                           '2 hr', 
                           '18 hr', 
                           '24 hr')) + 
  geom_linerange(data = goat_changes,
               mapping = aes(xmin = changepoints[1],
                             xmax = changepoints[2],
                             y = yield_mean[1] * 100),
               inherit.aes = FALSE)

goat_C <- summary %>% 
  filter(genus == 'Capra') %>% 
  ggplot(mapping = aes(x = time, 
                       y = C_mean,
                       color = factor(time),
                       shape = factor(temperature))) + 
  geom_pointrange(mapping = aes(ymin = C_mean - C_sd * 2,
                                ymax = C_mean + C_sd * 2)) + 
  scale_color_viridis(option = 'viridis',
                      discrete =TRUE,
                      end = 0.8,
                      alpha = 0.75) + 
  ylim(0, 75) +
  ylab('Carbon Content (%)')  + 
  scale_x_log10(breaks = c(0, 5, 10, 15, 30, 60, 120, 1080, 1440),
                labels = c('0 min',
                           '5 min', 
                           '10 min',
                           '15 min',
                           '30 min', 
                           '1 hr', 
                           '2 hr', 
                           '18 hr', 
                           '24 hr'))

goat_N <- summary %>% 
  filter(genus == 'Capra') %>% 
  ggplot(mapping = aes(x = time, 
                       y = N_mean,
                       color = factor(time),
                       shape = factor(temperature))) + 
  geom_pointrange(mapping = aes(ymin = N_mean - N_sd * 2,
                                ymax = N_mean + N_sd * 2)) + 
  scale_color_viridis(option = 'viridis',
                      discrete =TRUE,
                      end = 0.8,
                      alpha = 0.75) + 
  ylim(0, 50) +
  ylab('Nitrogen Content (%)')  + 
  scale_x_log10(breaks = c(0, 5, 10, 15, 30, 60, 120, 1080, 1440),
                labels = c('0 min',
                           '5 min', 
                           '10 min',
                           '15 min',
                           '30 min', 
                           '1 hr', 
                           '2 hr', 
                           '18 hr', 
                           '24 hr'))

goat_cn <- summary %>% 
  filter(genus == 'Capra') %>%
  ggplot(mapping = aes(x = time, 
                       y = `C:N_mean`,
                       color = factor(time),
                       shape = factor(temperature))) + 
  geom_pointrange(mapping = aes(ymin = `C:N_mean` - `C:N_sd` * 2,
                                ymax = `C:N_mean` + `C:N_sd` * 2)) + 
  scale_color_viridis(option = 'viridis',
                      discrete =TRUE,
                      end = 0.8,
                      alpha = 0.75) + 
  ylim(2.5, 4) +
  ylab('C/N (atomic)')  + 
  scale_x_log10(breaks = c(0, 5, 10, 15, 30, 60, 120, 1080, 1440),
                labels = c('0 min',
                           '5 min', 
                           '10 min',
                           '15 min',
                           '30 min', 
                           '1 hr', 
                           '2 hr', 
                           '18 hr', 
                           '24 hr'))

# deer data -------------------------------------------------------------------
deer_yield <- summary %>% 
  filter(genus == 'Odocoileus') %>% 
  ggplot(mapping = aes(x = time, 
                       y = yield_mean,
                       color = factor(time),
                       shape = factor(temperature))) + 
  geom_pointrange(mapping = aes(ymin = yield_mean - yield_sd * 2,
                                ymax = yield_mean + yield_sd * 2)) + 
  scale_color_viridis(option = 'plasma',
                      discrete =TRUE,
                      end = 0.8,
                      alpha = 0.75) + 
  ylim(0, 100) +
  ylab('sample remaining (%)')  + 
  scale_x_log10(breaks = c(0, 5, 10, 15, 30, 60, 120, 1080, 1440),
                labels = c('0 min',
                           '5 min', 
                           '10 min',
                           '15 min',
                           '30 min', 
                           '1 hr', 
                           '2 hr', 
                           '18 hr', 
                           '24 hr'))

deer_C <- summary %>% 
  filter(genus == 'Odocoileus') %>% 
  ggplot(mapping = aes(x = time, 
                       y = C_mean,
                       color = factor(time),
                       shape = factor(temperature))) + 
  geom_pointrange(mapping = aes(ymin = C_mean - C_sd * 2,
                                ymax = C_mean + C_sd * 2)) + 
  scale_color_viridis(option = 'plasma',
                      discrete =TRUE,
                      end = 0.8,
                      alpha = 0.75) + 
  ylim(0, 75) +
  ylab('Carbon Content (%)')  + 
  scale_x_log10(breaks = c(0, 5, 10, 15, 30, 60, 120, 1080, 1440),
                labels = c('0 min',
                           '5 min', 
                           '10 min',
                           '15 min',
                           '30 min', 
                           '1 hr', 
                           '2 hr', 
                           '18 hr', 
                           '24 hr'))

deer_N <- summary %>% 
  filter(genus == 'Odocoileus') %>% 
  ggplot(mapping = aes(x = time, 
                       y = N_mean,
                       color = factor(time),
                       shape = factor(temperature))) + 
  geom_pointrange(mapping = aes(ymin = N_mean - N_sd * 2,
                                ymax = N_mean + N_sd * 2)) + 
  scale_color_viridis(option = 'plasma',
                      discrete =TRUE,
                      end = 0.8,
                      alpha = 0.75) + 
  ylim(0, 50) +
  ylab('Nitrogen Content (%)')  + 
  scale_x_log10(breaks = c(0, 5, 10, 15, 30, 60, 120, 1080, 1440),
                labels = c('0 min',
                           '5 min', 
                           '10 min',
                           '15 min',
                           '30 min', 
                           '1 hr', 
                           '2 hr', 
                           '18 hr', 
                           '24 hr'))

deer_cn <- summary %>% 
  filter(genus == 'Odocoileus') %>%
  ggplot(mapping = aes(x = time, 
                       y = `C:N_mean`,
                       color = factor(time),
                       shape = factor(temperature))) + 
  geom_pointrange(mapping = aes(ymin = `C:N_mean` - `C:N_sd` * 2,
                                ymax = `C:N_mean` + `C:N_sd` * 2)) + 
  scale_color_viridis(option = 'plasma',
                      discrete =TRUE,
                      end = 0.8,
                      alpha = 0.75) + 
  ylim(2.5, 4) +
  ylab('C/N (atomic)')  + 
  scale_x_log10(breaks = c(0, 5, 10, 15, 30, 60, 120, 1080, 1440),
                labels = c('0 min',
                           '5 min', 
                           '10 min',
                           '15 min',
                           '30 min', 
                           '1 hr', 
                           '2 hr', 
                           '18 hr', 
                           '24 hr'))

# shark data ------------------------------------------------------------------
shark_yield <- summary %>% 
  filter(genus == 'Prionace') %>% 
  ggplot(mapping = aes(x = time, 
                       y = yield_mean,
                       color = factor(time),
                       shape = factor(temperature))) + 
  geom_pointrange(mapping = aes(ymin = yield_mean - yield_sd * 2,
                                ymax = yield_mean + yield_sd * 2)) + 
  scale_color_viridis(option = 'mako',
                      discrete =TRUE,
                      end = 0.8,
                      alpha = 0.75) + 
  ylim(0, 100) +
  ylab('sample remaining (%)')  + 
  scale_x_log10(breaks = c(0, 5, 10, 15, 30, 60, 120, 1080, 1440),
                labels = c('0 min',
                           '5 min', 
                           '10 min',
                           '15 min',
                           '30 min', 
                           '1 hr', 
                           '2 hr', 
                           '18 hr', 
                           '24 hr'))


shark_C <- summary %>% 
  filter(genus == 'Prionace') %>% 
  ggplot(mapping = aes(x = time, 
                       y = C_mean,
                       color = factor(time),
                       shape = factor(temperature))) + 
  geom_pointrange(mapping = aes(ymin = C_mean - C_sd * 2,
                                ymax = C_mean + C_sd * 2)) + 
  scale_color_viridis(option = 'mako',
                      discrete =TRUE,
                      end = 0.8,
                      alpha = 0.75) + 
  ylim(0, 75) +
  ylab('Carbon Content (%)')  + 
  scale_x_log10(breaks = c(0, 5, 10, 15, 30, 60, 120, 1080, 1440),
                labels = c('0 min',
                           '5 min', 
                           '10 min',
                           '15 min',
                           '30 min', 
                           '1 hr', 
                           '2 hr', 
                           '18 hr', 
                           '24 hr'))

shark_N <- summary %>% 
  filter(genus == 'Prionace') %>% 
  ggplot(mapping = aes(x = time, 
                       y = N_mean,
                       color = factor(time),
                       shape = factor(temperature))) + 
  geom_pointrange(mapping = aes(ymin = N_mean - N_sd * 2,
                                ymax = N_mean + N_sd * 2)) + 
  scale_color_viridis(option = 'mako',
                      discrete =TRUE,
                      end = 0.8,
                      alpha = 0.75) + 
  ylim(0, 50) +
  ylab('Nitrogen Content (%)')  + 
  scale_x_log10(breaks = c(0, 5, 10, 15, 30, 60, 120, 1080, 1440),
                labels = c('0 min',
                           '5 min', 
                           '10 min',
                           '15 min',
                           '30 min', 
                           '1 hr', 
                           '2 hr', 
                           '18 hr', 
                           '24 hr'))


shark_cn <- summary %>% 
  filter(genus == 'Prionace') %>%
  ggplot(mapping = aes(x = time, 
                       y = `C:N_mean`,
                       color = factor(time),
                       shape = factor(temperature))) + 
  geom_pointrange(mapping = aes(ymin = `C:N_mean` - `C:N_sd` * 2,
                                ymax = `C:N_mean` + `C:N_sd` * 2)) + 
  scale_color_viridis(option = 'mako',
                      discrete =TRUE,
                      end = 0.8,
                      alpha = 0.75) + 
  ylim(2.5, 4) +
  ylab('C/N (atomic)')  + 
  scale_x_log10(breaks = c(0, 5, 10, 15, 30, 60, 120, 1080, 1440),
                labels = c('0 min',
                           '5 min', 
                           '10 min',
                           '15 min',
                           '30 min', 
                           '1 hr', 
                           '2 hr', 
                           '18 hr', 
                           '24 hr'))


# write the results to a pdf --------------------------------------------------
pdf(file = './figures/yield.pdf', width = 6.5, height = 7.5)
cowplot::plot_grid(
  goat_yield, deer_yield, shark_yield, 
  goat_cn, deer_cn, shark_cn,
  goat_C, deer_C, shark_C,
  goat_N, deer_N, shark_N,
  nrow = 4
)
dev.off()


