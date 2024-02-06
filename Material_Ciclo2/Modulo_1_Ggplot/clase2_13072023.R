# Clase 2 13072023

library(ggplot2)
library(gapminder)
data("gapminder")
library(dplyr)

datos_1 <- gapminder %>%
  filter(year== 2007) %>%
  ggplot(aes(x=lifeExp)) + 
  geom_histogram(fill="yellow", color="red")
datos_1
# cambio en geom layer
datos_2 <- gapminder %>%
  filter(year== 2007) %>%
  ggplot(aes(x=lifeExp)) + 
  geom_histogram(
    fill="yellow",
    color="red",
    alpha=0.7, # alpha => transparency
    bins = 10, # bar number to show
    binwidth = 0.5 # width bars
    )
datos_2

# save graphics
ggsave(datos_1, file = "datos_1-with-code.png")
ggsave(datos_2, file = "datos_2-with-code.png")

# Facets layer
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) + 
         geom_point() +
         facet_wrap(~year)

ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) + 
  geom_point() +
  facet_wrap(~continent)

# Exercise


