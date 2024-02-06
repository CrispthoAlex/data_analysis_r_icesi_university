# clase 3
install.packages("readxl")
library(readxl)

victimas <- read_xlsx("victimas_29082023.xlsx")
victimas

# Realizar un gráfico de barras y un lollipop de la variable
# SEXO de las víctimas. ¿Cuál de estos dos recomienda usar?
# ¿Por qué?

victimas1 <- victimas %>%
  group_by(SEXO) %>%
  tally()

# bar
ggplot(
  victimas, aes(x = SEXO)
) +
  geom_bar()


# lollipop
ggplot(
  victimas1, aes(x = SEXO, y = n)
) +
  geom_segment(
    aes(
      x = SEXO,
      xend = SEXO,
      y = 0,
      yend = n)
  ) + 
  geom_point()

#### DUMBELL ###### 

library(ggplot2)
library(gapminder)
library(dplyr)
library(tidyr)

install.packages("plotly")
library(plotly)
install.packages("reshape")
library(reshape)


pop_evo_graph <- gapminder %>%
  # get data
  filter( continent=="Africa" & year==2007 |
            continent=="Africa" & year==1952) %>%
  select(country, year, lifeExp) %>%
  pivot_wider(names_from = year, values_from = lifeExp) %>%
  ggplot() + 
  geom_segment( aes(x=country,
                    xend=country, y=`1952`, yend=`2007`),
                color="grey") +
  # points
  geom_point( aes(x=country, y=`1952`, color="1952"), size=3) +
  geom_point( aes(x=country, y=`2007`,color="2007"), size=3 ) +
  # coordenates
  coord_flip()+
  scale_color_manual(values = c(`1952` = "#f1a340",
                                `2007`= "#998ec3"))
  
pop_evo_graph

