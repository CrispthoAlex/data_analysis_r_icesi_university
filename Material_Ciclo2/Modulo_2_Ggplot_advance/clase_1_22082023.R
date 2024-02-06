# Class 1 - 22082023
install.packages("gapminder")
library(gapminder)
install.packages("ggplot2")
library(ggplot2)
install.packages("dplyr")
library(dplyr)


# workshop 1

# data main

gdpPercap_data <- gapminder %>%
  group_by(continent)

# data set
life_data_2007_continent <- gapminder %>%
  filter(year == "2007")
  # %>%  group_by(continent)

# Distribution graphic
life_data_2007_continent %>%
  ggplot(aes(x = lifeExp, fill = continent)) +
  geom_histogram(
    colour="black"
    ) +
  labs( y = "Frequency",
        x = "Life Expect") + 
  theme_minimal()

# Distribution + density graphic
life_data_2007_continent %>%
  ggplot(aes(x = lifeExp)) +
  geom_histogram(aes(y=..density..), colour="black") +
  geom_density(
    alpha=.3, fill="#FB9900"
  ) +
  labs( y = "Density",
        x = "Life Expect") + 
  theme_minimal()


# Evolution graphic
#data
gapminder %>%
  ggplot(
      #aesthetics
       aes( y = gdpPercap, x = lifeExp, colour = continent)
       ) +
  #geometries
  geom_line() +
  #geom_point(alpha = 0.7) +
  geom_smooth(method = NULL, se = T) +
  #facets
  facet_wrap(~continent, scales = "free") +
  #labels
  labs(
    title = "Per capita GDP", y = "gdpPercap",
    x = "lifeExp", colour = "Continent"
    ) +
  #themes
  theme_minimal() +
  theme(
    axis.text = element_text(size = 7),
    legend.position = "bottom"
    )

