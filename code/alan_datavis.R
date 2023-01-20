### Libraries ###

library(ggplot2)
library(viridis)
library(dplyr)
library(tidyverse)

### Customization ###

scale_colour_viridis_d(
  alpha = 1,
  begin = 0,
  end = 1,
  direction = 1,
  option = "A",
  aesthetics = "colour"
)

### Data Reading ###

all_data <- read.csv(file = '../data/tcc_ceds_music.csv')
head(all_data)


### Statistical Analysis ###

# get average values by year
num_data <- dplyr::select_if(all_data, is.numeric)
years <- unique(num_data$release_date)
metric <- colnames(num_data)[-(1:3)]
metric <- metric[-length(metric)]

mean_metric <- c()
for (year in years) {
  get_row <- num_data[num_data$release_date == year,][metric]
  new_row <- c(year, colMeans(get_row))
  mean_metric <- rbind(mean_metric, new_row)
}
df_mean_metric <- as.data.frame(mean_metric, row.names = NULL, optional = TRUE)
colnames(df_mean_metric)[1] <- 'year'
mean_by_year = df_mean_metric

# get average values by decade



### Graphing ###

# area plot by year
# colors_metric <- viridis::turbo(length(metric))
# 
# mean_reshape <- mean_by_year %>%
#   select(all_of(c('year', metric))) %>%
#   gather(key = "variable", value = "value", -year)
#  
# ggplot(data = mean_reshape, aes(x = year, y = value)) + 
#   geom_area(aes(color = variable), alpha = 0.8) +
#   scale_color_manual(values = colors_metric) +
#   labs(x = 'Year', y = 'Aggregate Proportion', title = 
#          'Average Topic Frequencies in Pop Music over Time', color = 'Topic') +
#   guides(color = guide_legend(ncol = 1)) +
#   theme(legend.key.size = unit(0.03, 'npc'), plot.title = element_text(hjust = 0.5))

# reduced area plot
colors_metric <- viridis::turbo(length(metric))


