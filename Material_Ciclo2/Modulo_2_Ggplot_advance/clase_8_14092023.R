# Clase 8

# Steps to use ggthemeassist

if (!requireNamespace("devtools", quietly = TRUE))
  install.packages("devtools")

devtools::install_github("calligross/ggthemeassist")

library(dplyr)
library(ggplot2)
library(plotly)
library(gapminder)



g<- gapminder %>% 
  filter(year == 2007) %>% 
  ggplot(aes(x = gdpPercap, y = lifeExp,
             size = pop, text=sprintf("País: %s<br>Exp. de vida: %s<br>PIB per Cápita: %s<br>Población: %s<br>%s", country, lifeExp, gdpPercap, pop, continent))) +
  geom_point(col = "royalblue2") +
  labs(  x="PIB percápita ($US)", 
         y="Esp. de vida", 
         size="Población") +
  theme_minimal()

g + theme(plot.title = element_text(family = "mono")) +labs(title = "Relación PIB percapita ($US) vs Esperanza de Vida") # underline, select addings/ gg theme assist

