load("EvalsegSem.RData")

# p1 hallar valor
valor <- datos1[291, 1]
datos1[291,1]


# p2 número de observaciones
library(readxl);
library(dplyr)
basep2 <- read.csv("archivo1.csv")
# observaciones 506


# p3 tipo de dato
library(MASS)

data("birthwt")
class(birthwt$ui)
# integer


#p4 número de variables
data("birthwt")
class(birthwt$ui)
# variables 10


#p5 maximo de gdpPercap para Oceania 1977
library(gapminder)
data("gapminder")

oceania_1977 <- gapminder %>%
  filter(continent == "Oceania", year== 1977)

oceania_max_gdpPercap <- max(oceania_1977$gdpPercap)


# p6 promedio de lifeExp para Africa 1977
africa_1977 <- gapminder %>%
  filter(continent == "Africa", year== 1977)

mean(africa_1977$lifeExp)

