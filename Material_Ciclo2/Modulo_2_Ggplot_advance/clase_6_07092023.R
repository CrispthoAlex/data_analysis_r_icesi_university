# Clase 6
library(gapminder)
library(plotly)

gapminder_2007 <- subset(gapminder, year == 2007)

# 1) Hacer un histograma interactivo de la esperanza de vida al nacer de los
# datos de Gapminder para el año 2007

life_exp_histogram_2007 <- gapminder_2007 %>%
  ggplot(aes(
    x = lifeExp,
    fill = continent
  )) +
  geom_histogram() +
  theme_minimal() +
  labs(
    title = "Histograma de la Esperanza de Vida en 2007",
    x = "Esperanza de Vida",
    y = "Frecuencia"
  )

ggplotly(life_exp_histogram_2007)

# 2) Hacer un diagrama de barras interactivo del número de países por
# continente para el año 2007

#Option 1

continent_countries <- table(gapminder_2007$continent)
continent_countries

continent_count <- data.frame(
  Continent = names(continent_countries),
  Count = as.numeric(continent_countries)
  )

continent_graph <- continent_count %>%
  ggplot(aes(
    #x = Continent,
    x = Count,
    text = paste(
      Continent, ": ", Count, " paises"
    ),
    fill = Continent
  )) +
  geom_bar() +
  theme_minimal() +
  labs(
    title = "Número de Países por Continente en 2007",
    x = "Continente",
    y = "Número de Países"
  )

ggplotly(continent_graph)

# Option 2
continent_graph_2 <- plot_ly(continent_count, 
                             x = ~Continent, y = ~Count, 
                             type = "bar",
                             marker = list(
                               color = rainbow(
                                 length(continent_count$Continent)
                                 )
                               ),
                             text = ~paste(
                               Continent, ": ", "\n", Count, " países"
                               )
                             )
continent_graph_2 <- continent_graph_2 %>%
  layout(
    title = "Número de Países por Continente en 2007",
    xaxis = list(title = "Continente"),
    yaxis = list(title = "Número de Países")
  )
continent_graph_2

# 3) Hacer un boxplot interactivo de la esperanza de vida de los países por 
# continente para el año 2007

lifeexp_box_plot_2007 <- plot_ly(
  gapminder_2007, 
  x = ~continent, y = ~lifeExp, 
  type = "box", color = ~continent
  )

lifeexp_box_plot_2007 <- lifeexp_box_plot_2007 %>%
  layout(
    title = "Boxplot de la Esperanza de Vida por Continente en 2007",
    xaxis = list(title = "Continente"),
    yaxis = list(title = "Esperanza de Vida")
    #barmode = "group"
  )
lifeexp_box_plot_2007

# 4) Mostrar la evolución de PIB per cápita de los países de Oceanía en un 
# gráfico interactivo.

oceania_data <- subset(gapminder, continent == "Oceania")

oceania_line_plot <- plot_ly(
  data = oceania_data,
  x = ~year, y = ~gdpPercap,
  type = "scatter", mode = "lines+markers",
  color = ~country,
  text = ~country
  )

oceania_line_plot <- oceania_line_plot %>%
  layout(
    title = "Evolución del PIB Per Cápita en Oceanía",
    xaxis = list(title = "Año"),
    yaxis = list(title = "PIB Per Cápita"),
    showlegend = TRUE
  )
oceania_line_plot

# 5) Mostrar la relación del PIB per cápita, la esperanza de vida al nacer y
# la población por país para el año 2007 de forma interactiva

gdpPercap_scatter_plot <- plot_ly(
  gapminder_2007,
  x = ~gdpPercap, y = ~lifeExp, 
  text = ~country, size = ~pop,
  sizes = c(10, 1000), 
  color = ~continent, 
  colors = "Set1", 
  marker = list(opacity = 0.7)
  )

gdpPercap_scatter_plot <- gdpPercap_scatter_plot %>%
  layout(
    title = "Relación entre PIB Per Cápita, Esperanza de Vida y Población por País (2007)",
    xaxis = list(title = "PIB Per Cápita"),
    yaxis = list(title = "Esperanza de Vida"),
    showlegend = TRUE
  )

gdpPercap_scatter_plot
