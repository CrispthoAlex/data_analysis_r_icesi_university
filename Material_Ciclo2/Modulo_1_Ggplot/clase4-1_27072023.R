# clase 4_1 27072023

# Load libraries
library(ggplot2)
library(gapminder)
library(dplyr)
# load data
data("gapminder")

# Graphic
ggplot(gapminder,
       aes(x=gdpPercap, y=lifeExp)) +
  geom_point()

# Graphic + limits axis X (1)
ggplot(gapminder,
       aes(x=gdpPercap, y=lifeExp)) +
  geom_point() +
  lims(x=c(0,30000))

# Graphic + limits axis X (2)
ggplot(gapminder,
       aes(x=gdpPercap, y=lifeExp)) +
  geom_point() +
  scale_x_continuous(lims(x=c(10000,30000)))
  
# Graphic + limits axis X & y
ggplot(gapminder,
       aes(x=gdpPercap, y=lifeExp)) +
  geom_point() +
  lims(x=c(0,30000), y=c(40, 80))

# Graphic + limits axis X & y + facets
ggplot(gapminder,
       aes(x=gdpPercap, y=lifeExp)) +
  geom_point() +
  facet_wrap(~continent) + 
  lims(x=c(0,30000), y=c(40, 80))

# Bar graphic (1)
gapminder %>%
  filter(year== 2007, continent == c("Americas")) %>%
  ggplot( aes(x=country, y= gdpPercap)) +
  geom_bar(stat="identity") +
  labs(x="país", y="PIB percápita ($US)") +
  theme_minimal(base_size = 10 ) + 
  # turn axis
  coord_flip()

# Bar graphic (2)
gapminder %>%
  filter(year== 2007, continent == c("Americas")) %>%
  arrange(gdpPercap) %>%
  # add a variable named country - factor => cualitative
  mutate(country=factor(country, country)) %>%
  # code to graphic values VVV
  ggplot( aes(x=country, y= gdpPercap)) +
  geom_bar(stat="identity") +
  labs(x="país", y="PIB percápita ($US)") +
  theme_minimal(base_size = 10 ) + 
  # turn axis
  coord_flip()

# load tidyverse
install.packages("tidyverse")
library(tidyverse)

# coordinates layer
ggplot(gapminder, 
       aes(x= gdpPercap, y= lifeExp)) +
  geom_point() +
  facet_grid(~continent) +
  scale_x_log10() +
  coord_fixed(ratio=0.1)

# theme layer
ggplot(gapminder, 
       aes(x= gdpPercap, y= lifeExp)) +
  geom_point() +
  facet_grid(~continent) +
  scale_x_log10() +
  theme_minimal()
