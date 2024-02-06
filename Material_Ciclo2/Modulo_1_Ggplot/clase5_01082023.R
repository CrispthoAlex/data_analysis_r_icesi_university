# Clase 5

library(gapminder)
library(ggplot2)
library(dplyr)

# Absolute frequency
gapminder %>%
  filter(year == 2007) %>%
  ggplot(aes(x = lifeExp)) +
  geom_histogram(fill = "violet") +
  labs( y = "Frecuencia",
        x = "Expectativa de vida") + 
  theme_dark()

# Relative frequency (%)
grafico_procentaje <- gapminder %>%
  filter(year == 2007) %>%
  ggplot(aes(x = continent, y = 100*(..count..)/sum(..count..))) +
  geom_bar(fill = "violet") +
  labs( title = "Distribución de los paises por continente para el año 2027",
        y = "Porcentaje (%)",
        x = "Continente") + 
  theme_dark()
grafico_procentaje # graphic print

# Boxplot graphic
grafico_boxplot <- gapminder %>%
  filter(year == 2007) %>%
  ggplot(aes(x = continent, y = lifeExp)) +
  geom_boxplot(fill = "blue", col = "yellow") +
  labs( y = "Expectativa de vida",
        x = "Continente") + 
  theme_dark()
grafico_boxplot # graphic print
