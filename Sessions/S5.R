library(tidyverse)
library(ggplot2)
library(gapminder)

ggplot(gapminder) +
  aes(x=gdpPercap, y=lifeExp) +
  geom_point(color='skyblue', alpha=0.7, shape=20) +
  scale_x_continuous(name="GDP per Capita", trans="log10", 
                     labels=scales::dollar_format()) +
  theme_bw() +
  ylab("Life Expectancy")

