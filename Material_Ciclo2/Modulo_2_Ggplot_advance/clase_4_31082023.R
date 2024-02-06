# clase 4


install.packages("treemapify")
library(treemapify)
library(dplyr)
library(ggplot2)
library(gapminder)

# example
ggplot(df, aes(area = valor, fill = grupo, label = valor)) +
  geom_treemap()

#

gapminder %>%
  filter(year == 1952) %>%
  ggplot(aes(area = pop, label = country)) +
  geom_treemap() +
  geom_treemap_text()

gapminder %>%
  filter(year == 1952) %>%
  ggplot(aes(area = pop, label = country, fill = lifeExp)) +
  geom_treemap() +
  geom_treemap_text() +
  theme_minimal() +
  theme(legend.position = "bottom")


