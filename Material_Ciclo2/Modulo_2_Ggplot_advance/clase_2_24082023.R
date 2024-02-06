# clase 2

library(gapminder)
library(ggplot2)
library(dplyr)

# datos
head(gapminder)
data_graph <- ggplot(filter(gapminder, year == "1952" & continent == "Asia"))

# aesthetic

ggplot(
  filter(
    gapminder, year == "1952" & continent == "Asia"
    ),
  aes(x = pop, y = country)
  )

# geometry

ggplot(
  filter(gapminder, year == "1952" & continent == "Asia"),
  aes(x = pop, y = country)
) +
  geom_point()

# geometry
ggplot(
  filter(gapminder, year == "1952" & continent == "Asia"),
  aes(x = pop, y = country, color = country)
) +
  geom_segment(
    aes(
      x = 0,
      xend = pop,
      y = country,
      yend = country
        )
  ) +
  geom_point()


## Exercise - miro 2

# Hacer un diagrama de lollipop para la variable expectativa
# de vida para un año (a elección).

install.packages("plotly")
library(plotly)

graph <- ggplot(
  filter(gapminder, year == "2002"),
  aes(x = country, y = lifeExp, color = country, text= lifeExp)
) +
  geom_segment(
    aes(
      x = country,
      xend = country,
      y = 0,
      yend = lifeExp
    )
  ) +
  geom_point() +
  labs(
    title = "Expectativa de vida para el año 2002", x = "Continente",
    y = "Expectativa de vida", colour = "Continente"
  ) +
  #themes
  theme_minimal() +
  theme(
    axis.text = element_text(size = 7, angle = 90),
    legend.position = "bottom"
  )
graph
ggplotly(graph, tooltip="text")


# Hacer un lollipop para el número de países por continente

## Get country number
gapminder %>%
  group_by(continent) %>%
  summarise(nb_country = n_distinct(country))

data_nb_country <- as.data.frame(gapminder %>% 
  group_by(continent) %>%
  summarise(nb_country = n_distinct(country))
)
data_nb_country

## Get nb country graph
nb_country_graph <- data_nb_country %>%
  ggplot(
    aes(
      x = nb_country,
      y = continent,
      color = continent,
      text= nb_country
    )) +
  geom_segment(
    aes(
      x = 0,
      xend = nb_country,
      y = continent,
      yend = continent,
    )) +
  geom_point(size=4) +
  labs(
    title = "Cantidad Paises por Continente", x = "Numero de Paises",
    y = "Continente", colour = "Continente"
  ) +
  theme_minimal()
nb_country_graph
## Add tag
ggplotly(nb_country_graph, tooltip="text")

  
  
