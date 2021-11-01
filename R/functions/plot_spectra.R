plot_spectra <- function(data, annotations, time_text, color, scale) {
  data %>% 
    ggplot(mapping = aes(x = wavenumber,
                         y = factor(time_min),
                         height = absorbance,
                         group = file_name,
                         fill = (time_min),
                         color = (time_min))) +
    geom_density_ridges(stat = "identity",
                        scale = scale,
                        size = 0.1) +
    theme(legend.position = 'none',
          panel.grid.minor = element_blank()) + 
    scale_color_viridis(discrete = FALSE, 
                        option = color, 
                        begin = 0.2,
                        end = 0.8) + 
    scale_fill_viridis(discrete = FALSE, 
                       option = color, 
                       begin = 0.2,
                       end = 0.8,
                       alpha = 0.25) + 
    xlab(expression(wavenumber~'('~cm^{-1}~')')) + 
    ylab('time (minutes)') + 
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
              size = 6 / ggplot2::.pt) + 
    scale_y_discrete(expand = expansion(mult = c(0, 0.25)))
}
