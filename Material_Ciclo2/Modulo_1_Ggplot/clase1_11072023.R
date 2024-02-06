## Installing Ggplot
install.packages("ggplot2")
library(ggplot2)
library(dplyr) # to use glimpse function
library(gapminder)

install.packages("glimpse")
gapminder
data("gapminder")
glimpse(gapminder)
str(gapminder)
names(gapminder)
## Graphic
## layers to graphic, data + aesthetic + geometry
ggplot(gapminder,
       aes( x= gdpPercap, y=lifeExp, col=year, size=pop, shape=continent
  )) + geom_point()

geom_histogram()
geom_bar()
geom_line()
geom_density()
geom_boxplot()


#### Exercise
# Graphics the gdpPercap variable

ggplot(gapminder, aes( x= gdpPercap )) + geom_histogram()

## Add color to the geom_histogram() argument
ggplot(gapminder, aes( x= gdpPercap )) + geom_histogram(col="#f03b20", fill="#feb24c")


## Exercise MIRO

#1 Gráfico de densidad:
  
#  La base "ingresos.xlsx", contiene las variables "ingresos_1", "ingresos_2", 
# "ingresos_3", "ingresos_4", "ingresos_5" que contiene los ingresos percibidos
# por 5 grupos de población y el "genero".

# load readxl
library(readxl)
# load data
data <- read_excel("ingresos.xlsx")

# a. Usando la función "ggplot()" usa los datos para representar un gráfico de
# densidad utilizando la función "geom_density" (capa de geometría) para cada
# una de las variables de ingreso de las poblaciones. Pega en el tablero de
# miro las 5 gráficas realizadas.  ¿Qué analizas en cada una de ellas?


listVariables <- list(names(data))
listVariables
data_ingresos2 <- read_excel("ingresos.xlsx", sheet = 2);
# base code
ggplot(data, aes(x= ingresos_1)) + geom_density(col="#31b354", fill="#a03f20")
ggplot(data_ingresos2, aes(x= ingresos_2)) + geom_density(col="#31b354", fill="#a03f20")
ggplot(data, aes(x= ingresos_3)) + geom_density(col="#31b354", fill="#a03f20")
ggplot(data, aes(x= ingresos_4)) + geom_density(col="#31b354", fill="#a03f20")
ggplot(data, aes(x= ingresos_5)) + geom_density(col="#31b354", fill="#a03f20")

for (i in listVariables) { ggplot(data, aes(x= i)) + geom_density()}

#  b. Ahora, al gráfico de densidad realizado en el punto anterior con la 
# variable "ingresos_1", cambia el color de línea y el color de relleno de la 
# densidad, empleando los colores de tu preferencia.
# Puedes emplear los colores de: https://colorbrewer2.org/#type=sequential&scheme=BuGn&n=3

ggplot(data, aes(x= ingresos_1)) + geom_density(col="#31a354", fill="#f03b20")

# a. Realice un histograma empleando la función "geom_histogram()" (capa de
# geometría) para la variable "ingresos_1".

# b. Ahora al gráfico anterior, cambia el color del borde de las barras

# c. Ahora al gráfico anterior, cambia el color del relleno de las barras

ggplot(data, aes(x= ingresos_1)) + geom_histogram(col="black", fill="#a20d01")


