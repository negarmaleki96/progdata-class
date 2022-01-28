library(tidyverse)

plastic_waste <- read_csv(here::here("data", "plastic-waste.csv"))

#glimpse(plastic_waste)
#head(plastic_waste)
#view(plastic_waste)

# Notice that some cells in the data have the value NA — what does this mean? It means the data is missing!

# Exercise1:
# 1-1
hist_1 <- ggplot(plastic_waste) +
  aes(x = plastic_waste_per_cap) +
  geom_histogram(binwidth = 1) +
  facet_wrap(~continent)

hist_1 +
  geom_density(aes(y = after_stat(count)))

# 1-2
ggplot(plastic_waste) +
  aes(x = plastic_waste_per_cap, color=continent, fill=continent) +
  geom_density(alpha=0.3)

# 1-3
# The color aesthetic typically changes the outside outline of an object and 
# the fill aesthetic is typically the inside shading. However, if we put alpha 
# in aes(), it does not apply the alpha to the legend, so the result doesn't
# looks good.(we put alpha in the geom to apply it to all attributes of the 
# previous layer)


