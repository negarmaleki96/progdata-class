library(tidyverse)
library(tsibble)
(mauna <- tsibble::as_tsibble(co2) |> 
  rename(month = index, conc = value))

# Line chart
  ggplot(mauna) +
  aes(x=month, y=conc) +
  geom_line() + 
  scale_x_yearmonth(name="Year-Month")

#Scatter plot
library(palmerpenguins)
ggplot(palmerpenguins::penguins) +
  aes(x= body_mass_g, y= bill_depth_mm, color=species) + # if call color in the aes instead of geom_point, each species gets its own fitted line!
  geom_point() + # geom_point(aes(color=species))
  geom_smooth(method = "lm")  # fit a line to the data, for linear method="lm"

# Assign plot to an object and add layer to it
p <- ggplot(mauna) +
  aes(x=month, y=conc) +
  geom_line() + 
  scale_x_yearmonth(name="Year-Month")
p +
  geom_smooth(color="darkgreen")
  #geom_smooth(method = "lm", color="darkgreen")

# Fix it
library(gapminder)
ggplot(gapminder) +
  aes(x = gdpPercap, y = lifeExp, alpha = 0.1) +
  geom_point()

library(cars)
ggplot(cars) +
  geom_point(aes(x = speed, y = dist), color = "blue")

