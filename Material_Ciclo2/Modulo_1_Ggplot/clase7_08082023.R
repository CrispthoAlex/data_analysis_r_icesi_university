# clase 7
library(dplyr)
library(gapminder)
library(ggplot2)
# Getting data
g_barras_datos <- gapminder %>%
  group_by(year, continent) %>%
  summarise(paises = n()) %>%
  mutate(prop_paises = 100 * paises/sum((paises)))

ggplot(g_barras_datos,
       aes(
         x = as.character(year), # type int => char
         y = prop_paises,
         fill= continent
       )) +
  geom_bar(position= "dodge", stat= "identity") +
  labs(y= "% paises", x = "Año", fill= "continentes") +
  theme_minimal()
