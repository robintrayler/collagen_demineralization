library(tidyverse)
library(viridis)
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

library(colorspace)
data <- read_csv(file = './data/isotope_data/isotope_data.csv') %>% 
  mutate(yield = sample_wt_final/sample_wt_initial) %>% 
  rename(file_name = sample) %>% 
  filter(!is.na(time))

data <- read_csv(file = './data/ap_ratio.csv') %>% 
  select(AP, file_name) %>% 
  full_join(data, by = 'file_name')


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
    N_mean = mean(N_wt_percent),
    `C/N_mean` = mean(`C/N`, na.rm = TRUE),
    `C/N_sd` = sd(`C/N`, na.rm = TRUE),
    yield_mean = mean(yield, na.rm = TRUE),
    yield_sd = sd(yield, na.rm = TRUE))

# Deer Plots ##################################################################
deer_carbon <- summary %>% 
  filter(genus == 'Odocoileus') %>% 
  ggplot(mapping = aes(x = time, 
                       y = d13C_mean,
                       color = factor(time),
                       shape = factor(temperature))) +
  geom_pointrange(mapping = aes(ymin = d13C_mean - d13C_sd * 2,
                                ymax = d13C_mean + d13C_sd * 2),
                  alpha = 0.75) + 
  scale_color_viridis(option = 'plasma',
                      discrete =TRUE,
                      end = 0.8) + 
  ylim(-28, -25) +
  ylab(expression(delta^13*C))  + 
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

deer_nitrogen <- summary %>% 
  filter(genus == 'Odocoileus') %>% 
  ggplot(mapping = aes(x = time, 
                       y = d15N_mean,
                       color = factor(time),
                       shape = factor(temperature))) +
  geom_pointrange(mapping = aes(ymin = d15N_mean - d15N_sd * 2,
                                ymax = d15N_mean + d15N_sd * 2),
                  alpha = 0.75) + 
  scale_color_viridis(option = 'plasma',
                      discrete =TRUE,
                      end = 0.8) + 
  ylim(2, 5) +
  ylab(expression(delta^15*N))  + 
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

deer_ap <- summary %>% 
  filter(genus == 'Odocoileus') %>% 
  ggplot(mapping = aes(x = time, 
                       y = AP_mean,
                       color = factor(time),
                       shape = factor(temperature))) +
  geom_pointrange(mapping = aes(ymin = AP_mean - AP_sd * 2,
                                ymax = AP_mean + AP_sd * 2),
                  alpha = 0.75) + 
  scale_color_viridis(option = 'plasma',
                      discrete =TRUE,
                      end = 0.8) + 
  ylab(expression(frac(Amide~I, nu[2]*PO[4]))) + 
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
  scale_y_continuous(limits = c(-1, 10), breaks = c(0, 2, 4, 6, 8, 10))


# Goat Plots ##################################################################
goat_carbon <- summary %>% 
  filter(genus == 'Capra') %>% 
  ggplot(mapping = aes(x = time, 
                       y = d13C_mean,
                       color = factor(time),
                       shape = factor(temperature))) +
  geom_pointrange(mapping = aes(ymin = d13C_mean - d13C_sd * 2,
                                ymax = d13C_mean + d13C_sd * 2),
                  alpha = 0.75) + 
  scale_color_viridis(option = 'viridis',
                      discrete =TRUE,
                      end = 0.8) + 
  ylim(-24.5, -21.5) +
  ylab(expression(delta^13*C))  + 
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
goat_nitrogen <- summary %>% 
  filter(genus == 'Capra') %>% 
  ggplot(mapping = aes(x = time, 
                       y = d15N_mean,
                       color = factor(time),
                       shape = factor(temperature))) +
  geom_pointrange(mapping = aes(ymin = d15N_mean - d15N_sd * 2,
                                ymax = d15N_mean + d15N_sd * 2),
                  alpha = 0.75) + 
  scale_color_viridis(option = 'viridis',
                      discrete =TRUE,
                      end = 0.8) + 
  ylim(2.5, 5.5) +
  ylab(expression(delta^15*N))  + 
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

goat_ap <- summary %>% 
  filter(genus == 'Capra') %>% 
  ggplot(mapping = aes(x = time, 
                       y = AP_mean,
                       color = factor(time),
                       shape = factor(temperature))) +
  geom_pointrange(mapping = aes(ymin = AP_mean - AP_sd * 2,
                                ymax = AP_mean + AP_sd * 2),
                  alpha = 0.75) + 
  scale_color_viridis(option = 'viridis',
                      discrete =TRUE,
                      end = 0.8) + 
  scale_y_continuous(limits = c(-1, 10), breaks = c(0, 2, 4, 6, 8, 10)) + 
  ylab(expression(frac(Amide~I, nu[2]*PO[4]))) + 
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

# Shark Plots #################################################################
shark_carbon <- summary %>% 
  filter(genus == 'Prionace') %>% 
  ggplot(mapping = aes(x = time, 
                       y = d13C_mean,
                       color = factor(time),
                       shape = factor(temperature))) +
  geom_pointrange(mapping = aes(ymin = d13C_mean - d13C_sd * 2,
                                ymax = d13C_mean + d13C_sd * 2),
                  alpha = 0.75) + 
  scale_color_viridis(option = 'mako',
                      discrete =TRUE,
                      end = 0.8) + 
  ylim(-17, -14) +
  ylab(expression(delta^13*C))  + 
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

shark_nitrogen <- summary %>% 
  filter(genus == 'Prionace') %>% 
  ggplot(mapping = aes(x = time, 
                       y = d15N_mean,
                       color = factor(time),
                       shape = factor(temperature))) +
  geom_pointrange(mapping = aes(ymin = d15N_mean - d15N_sd * 2,
                                ymax = d15N_mean + d15N_sd * 2),
                  alpha = 0.75) + 
  scale_color_viridis(option = 'mako',
                      discrete =TRUE,
                      end = 0.8) + 
  ylim(10, 13) +
  ylab(expression(delta^15*N))  + 
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

shark_ap <- summary %>% 
  filter(genus == 'Prionace') %>% 
  ggplot(mapping = aes(x = time, 
                       y = AP_mean,
                       color = factor(time),
                       shape = factor(temperature))) +
  geom_pointrange(mapping = aes(ymin = AP_mean - AP_sd * 2,
                                ymax = AP_mean + AP_sd * 2),
                  alpha = 0.75) + 
  scale_color_viridis(option = 'mako',
                      discrete =TRUE,
                      end = 0.8) + 
  scale_y_continuous(limits = c(-1, 10), breaks = c(0, 2, 4, 6, 8, 10)) + 
  ylab(expression(frac(Amide~I, nu[2]*PO[4]))) + 
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




goat_col <- cowplot::plot_grid(
  goat_carbon, goat_nitrogen, goat_ap,
  ncol = 1,
  align = 'v')

deer_col <- cowplot::plot_grid(
  deer_carbon, deer_nitrogen, deer_ap,
  ncol = 1,
  align = 'v')

shark_col <- cowplot::plot_grid(
  shark_carbon, shark_nitrogen, shark_ap,
  ncol = 1,
  align = 'v')


pdf(file = './figures/isotope_data_figure.pdf', width = 7.5, height = 5.5)
cowplot::plot_grid(
  goat_col,
  deer_col, 
  shark_col,
  nrow = 1
)

dev.off()




summary %>% 
  filter(time > 0) %>% 
  ggplot(mapping = aes(x = C_mean, 
                       y = AP_mean,
                       color = genus)) + 
  geom_point(show.legend = TRUE) + 
  facet_grid(~genus) +
  theme(legend.position = 'top') + 
  theme_minimal()
