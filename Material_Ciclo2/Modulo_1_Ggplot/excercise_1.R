#TALLER 1 CAPA GEOMETRÍA 
#GEOMETRIA PARA MOSTRAR DISTRIBUCIÓN GRAFICOS DE DENSIDAD E HISTOGRAMA

library(ggplot2)
library(readxl)
library(dplyr)
datos <- read_excel("ingresos.xlsx", sheet = 1)
#Taller 1 - Clase 1

#CAPA GEOMETRIA

#####
#1 Gráfico de densidad
#####
#a Gráfico de densidad básico
grafico_ingresos_1 <- ggplot(datos, aes(x = ingresos_1)) + geom_density()
grafico_ingresos_1  

datos_1 <- read_excel("ingresos.xlsx", sheet = 2)
grafico_ingresos_2 <- ggplot(datos_1, aes(x = ingresos_2)) + geom_density()
grafico_ingresos_2

grafico_ingresos_3 <- ggplot(datos, aes(x = ingresos_3)) + geom_density()
grafico_ingresos_3

grafico_ingresos_4 <- ggplot(datos, aes(x = ingresos_4)) + geom_density()
grafico_ingresos_4

grafico_ingresos_5 <- ggplot(datos, aes(x = ingresos_5)) + geom_density()
grafico_ingresos_5



#b cambiar color de relleno y de línea de trazado de la densidad 
grafico_ingresos <- ggplot(datos, aes(x = ingresos_1)) + 
  geom_density(color="#3182bd", fill = "#9ecae1")
grafico_ingresos  

#####
#2 Histograma
#####

#Grafico Histograma
#a Realice un gráfico empleando geom_histogram 
grafico_histo <- ggplot(datos, aes(x = ingresos_1)) +  geom_histogram() 
grafico_histo 

#b Cambia el color del borde de las barras

grafico_histo <- ggplot(datos, aes(x = ingresos_1)) + geom_histogram(col = "#ccece6") 
grafico_histo

#c Cambia el color de relleno de las barras
grafico_histo <- ggplot(datos, aes(x = ingresos_1)) + geom_histogram(col = "#ccece6",
                                                                     fill= "#41ae76") 
grafico_histo

# Contiune Pto 1
# c . Ahora al gráfico anterior adicionalmente agrega un relleno semitransparente.
# Ahora cambiar el tipo de la línea de trazado de la densidad emplea:Ahora cambiar el tipo de la línea de trazado de la densidad emplea:
#  linetype="dashed"
# De acuerdo con lo visto en clase analiza la capa donde debes ubicar este argumento.

grafico_ingresos_1 <- ggplot(datos, aes(x = ingresos_1)) + 
  geom_density(fill="violet",
               alpha=0.4, # alpha => transparency,
               linetype="dashed"
               )
grafico_ingresos_1

# d. Ahora realiza un gráfico de densidad con la variable "ingresos_1" pero en esta 
# ocasión por grupo empleando la variable "genero" (Para analizar este punto recuerda 
# lo visto en clase).
grafico_ingresos_1_by_genre <- ggplot(datos, aes(x = ingresos_1, color = genero)) + 
  geom_density(
    fill="blue",
    # alpha=0.4, # alpha => transparency,
    linetype="twodash"
  )
grafico_ingresos_1_by_genre

#e. Ahora al gráfico de densidad realizado en el punto (d), cambia el color de la línea 
# de la densidad. Emplea:
#  scale_color_manual(values=c("#999999", "#E69F00"))
# Adiciona este argumento después de la capa de geometría. Qué resultado obtuviste? 
# Intenta modificar los colores empleando los colores base o diferentes colores de la 
# paleta de colores https://colorbrewer2.org/#type=sequential&scheme=BuGn&n=3

grafico_ingresos_1_by_genre <- ggplot(datos, aes(x = ingresos_1, color = genero)) + 
  geom_density(
    fill="blue",
    #alpha=0.4, # alpha => transparency,
    # linetype="twodash"
  ) +
  scale_color_manual(values=c("#999999", "#E69F00"))

grafico_ingresos_1_by_genre

#f. Ahora realiza un al gráfico de densidad con la misma variable "ingresos_1" 
#con relleno de la densidad. Adicionalmente, emplea un relleno semitransparente  
#alpha=0.4. Nota: El color de relleno se puede cambiar empleando los grupos!

grafico_ingresos_1_by_genre <- ggplot(datos, aes(x = ingresos_1, color = genero)) + 
  geom_density(
    fill="blue",
    alpha=0.4, # alpha => transparency,
    # linetype="twodash"
  ) +
  scale_color_manual(values=c("#999999", "#E69F00"))

grafico_ingresos_1_by_genre

# g. Ahora realiza un gráfico igual que el  anterior y en esta ocasión modifica
# el color de relleno de la densidad. Emplea: 
# scale_fill_manual(values=c("#999999", "#56B4E9")).

grafico_ingresos_1_by_genre <- ggplot(datos, aes(x = ingresos_1, color = genero)) + 
  geom_density(
    #fill="blue",
    #alpha=0.4, # alpha => transparency,
    # linetype="twodash"
  ) +
  scale_fill_manual(values=c("#e6550d50", "#56B4E950"))

grafico_ingresos_1_by_genre

#h. Ahora modifica el color de las línea de densidad
grafico_ingresos_1_by_genre <- ggplot(datos, aes(x = ingresos_1, color = genero)) + 
  geom_density(
    #fill="blue",
    #alpha=0.4, # alpha => transparency,
    # linetype="twodash"
  ) +
  scale_color_manual(values=c("black", "#E69F00")) +
  scale_fill_manual(values=c("#e6550d", "#56B4E9"))

grafico_ingresos_1_by_genre
