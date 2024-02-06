# clase 6
library(gapminder)
library(ggplot2)
install.packages("dplyr")
update.packages("dplyr")
library(dplyr)

install.packages("ggstatsplot")
install.packages("scales")
library(ggstatsplot)

# Graphic
diagrama_violines <- gapminder %>%
  filter(
    year == 2007, 
    continent %in% c("Africa","Americas", "Asia", "Europe")) %>%
  ggwithinstats(
    x = continent,
    y = lifeExp,
    bf.message = FALSE,
    results.subtitle = FALSE, 
    pairwise.comparisons = FALSE,
    xlab = "Continente",
    ylab = "Esperanza de vida",
    title = "Distribución de la Esperanza de vida por continente para el 2007") 
diagrama_violines


## Show data evolution

# Line graphic
# a)
gapminder %>% filter(country =="Colombia") %>%
  ggplot(aes(x=year, y=gdpPercap)) + 
  geom_line() +
  theme_minimal()

# b)
gapminder %>% 
  filter(country =="Colombia") %>%
  ggplot(
    aes(
      x = year,
      y = gdpPercap,
      label= round(gdpPercap,)
      )) + 
  geom_line() +
  #
  geom_text(vjust=-1.5) +
  theme_minimal()

# c
gapminder %>%
  filter(country == "Colombia") %>%
  ggplot(
    aes(
      x = year,
      y = gdpPercap,
      label = round(gdpPercap,))
  ) +
  geom_line() +
  geom_point() +
  geom_text(vjust=-1.5, size=3) +
  scale_x_continuous(
    breaks = seq(1952, 2007, by = 5)
    ) +
  theme_minimal()

# d
gapminder %>%
  filter(country %in% c("Colombia", "Peru", "Chile", "Mexico")) %>%
  ggplot(
    aes(x = year, y = gdpPercap, color = country)
  ) +
  geom_line() +
  geom_point() +
  theme_minimal() +
  theme(legend.position = "bottom")

# e
gapminder %>%
  filter(country %in% c("Colombia", "Peru", "Chile", "Mexico")) %>%
  ggplot(
    aes(x = year, y = gdpPercap, color = country)
  ) +
  geom_line() +
  scale_colour_manual(
    values = c("green", "blue", "yellow", "black")
    ) +
  theme_minimal() +
  theme(legend.position = "bottom")
  

