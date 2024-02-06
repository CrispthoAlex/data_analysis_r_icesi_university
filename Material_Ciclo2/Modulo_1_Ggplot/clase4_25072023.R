#TALLER 2 CLASE 2

#CAPA FACET

#La base "ingresos.xlsx", contiene las variables "ingresos_1", "ingresos_2", "ingresos_3", "ingresos_4", "ingresos_5" 
#que contiene los ingresos percibidos por 5 grupos de población y el "genero".

#En el taller 1 en el punto a representaste un gráfico de densidad para cada una de las variables
#de ingreso de las poblaciones y las pegaste de forma manual en el tablero de miro.  Ahora:

#a Realiza un gráfico de densidad y agrega la capa facet en el en que los subgraficos serán los gráfico de densidad de
#las distribuciones de ingresos de cada uno de los grupos de población (ingresos_1", "ingresos_3", "ingresos_4", "ingresos_5).

#Nota: Ten en cuenta la función vista en clase (melt).
library(ggplot2)
library(readxl)
library(dplyr)
install.packages("reshape2")
library(reshape2)#Libreria para poder usar la función melt

datos <- read_excel("ingresos.xlsx", sheet = 1)
datos_largo <- melt(datos, id.vars = "genero")
# clase de dato
class(datos_largo)
ggplot(
  # data layer
  datos_largo, 
  # aesthetic layer
  aes(value)) +
  # geometry layer
  geom_density(color="darkblue", fill="lightblue") + 
  # facets layer - subgraphics
  facet_wrap(~variable, scales = "free")

#Además como ya conoces otras funciones, agrega títulos 
#y modifica los nombres de los ejes de las variables en tu visualización.

ggplot(datos_largo, aes(value)) + 
  geom_density(color="darkblue", fill="lightblue", ) + 
  facet_wrap(~variable, scales = "free") +
  # titles and 
  labs(title = "Distribuciones de ingresos de la población 1, 3, 4 y 5",
       caption = "Fuente: Elaboración propia") +
  # rename axis
  xlab("Ingresos") +
  ylab("densidad")


#Pero hay algo más que puedes mejorar..., cambia los nombres de los 
#subtitulos en tu gráfico 
#Puedes realizar este cambio de diferentes maneras, una forma ráida y fácil es
#modificar la variable empleando la función "recode" del paquete "dplyr"
datos_largo$variable <- recode(datos_largo$variable,
                               "ingresos_1" = "Poblacion 1",
                               "ingresos_3" = "Poblacion 2",
                               "ingresos_4" = "Poblacion 3",
                               "ingresos_5" = "Poblacion 4")

ggplot(datos_largo, aes(value)) + 
  geom_density(color="darkblue", fill="lightblue", ) + 
  facet_wrap(~variable, scales = "free") +
  labs(title = "Distribuciones de ingresos de la población 1, 3, 4 y 5",
       caption = "Fuente: Elaboración propia") +
  xlab("Ingresos") +
  ylab("densidad")
#Nuestro gráfico ha mejorado mucho más, parece un gráfico profesional!!!! 