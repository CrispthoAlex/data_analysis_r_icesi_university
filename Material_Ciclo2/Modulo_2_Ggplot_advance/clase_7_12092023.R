# Clase 7

library(ggplot2)
library(plotly)

## Forma 1

p <- ggplot(mtcars, aes(x = disp, y= am, color = as.factor(cyl)))+
  geom_point()

p <- ggplot(mtcars,
            aes(
              x = disp, y= am, color = as.factor(cyl),
              text= paste("Displacment: ", disp, "<br>",
                          "Automatic: ", am, "<br>",
                          "Number of cylinders: ", cyl, "<br>",
                          "mpg: ", mpg, sep = "")
              )
            ) +
  geom_point()

ggplotly(p, tooltip = c("text"))

## Forma 2

p <- ggplot(mtcars,
            aes(
              x = disp, y= am, color = as.factor(cyl),
              text= sprintf(
                "Displacment: %s<br>Automatic: %s<br>Number of cylinders: %s<br>mpg: %s<br>",
                disp, am, cyl, mpg
                )
              )
            ) +
  geom_point()

ggplotly(p, tooltip = "text")

## Histograma

library(ggplot2)
library(dplyr)
library(gapminder)
library(plotly)

# 1) Hacer un histograma interactivo de la esperanza de vida al nacer de
# los datos de Gapminder para el año 2007.
# En el cuadro interactivo solo debe aparecer "Cantidad: "

ggplotly(gapminder %>% 
           filter(year == 2007) %>%
           ggplot(
             aes(
               x=lifeExp,
               fill= continent,
               text=sprintf("Cantidad: %s observacion (es)", ..count..) # ..count.., special format
               )
             ) +
           geom_histogram() +
           labs( y="Frecuencia", 
                 x="Exp. de vida") +
           theme_minimal(), tooltip = "text")


# 2. Hacer un diagrama de barras interactivo del número de países por
# continente para el año 2007
# En el cuadro interactivo debe aparecer "Cantidad:"

## Gráfico de barras

ggplotly(gapminder %>% 
           filter(year == 2007) %>% 
           ggplot(
             aes(
               x = continent,
               fill= continent,
               text=sprintf("Paises: %s", ..count..) # country count
               )
             ) +
           geom_bar() +
           labs( y="Frecuencia", 
                 x="Continente") +
           theme_minimal(), tooltip = "text")


# 3. Hacer un boxplot interactivo de la esperanza de vida de los países por
# continente para el año 2007
# ¿Qué se le puede cambiar al cuadro interactivo?
## Boxplot

#don´t update

ggplotly(gapminder %>%
           filter(year == 2007) %>% 
           ggplot(
             aes(
               x = continent, y = lifeExp #, color= continent
               )
             ) +
           geom_boxplot(fill = "yellow", 
                        col = "royalblue4" ) +
           labs(
             y="Esperanza de vida al nacer",
             x="Continente"
             ) +
           theme_minimal(),
         tooltip = "text")


# 4. Mostrar la evolución de PIB per cápita de los países de Oceanía 
# en un gráfico interactivo.
# Muestren en el cuadro interactivo el año, el PIB per cápita, el país 
# y el continente

## Gráfico de líneas

ggplotly(gapminder %>%
           filter(continent=="Oceania") %>%
           ggplot(
             aes(
               x = year, y =gdpPercap,
               color = country,
               text=sprintf(
                 "Año: %s<br>PIB per cápita: %s<br>País: %s<br>%s", year, gdpPercap, country, continent
                 )
               )
             ) +
           geom_line(
             aes(group=1)
             ) +
           labs(
             y="PIB percápita ($US)",
             x="Año", color = "País"
             ) +
           theme_minimal(),
         tooltip = "text")


# 5. Mostrar la relación del PIB per cápita, la esperanza de vida al nacer
# y la población por país para el año 2007 de forma interactiva
# Mostrar en el cuadro interactivo: País, esperanza de vida, PIB per cápita,
# población y continente

## Gráfico de burbujas

ggplotly(gapminder %>% 
           filter(year == 2007) %>%
           ggplot(
             aes(
               x = gdpPercap,
               y = lifeExp,
               col= country,
               size = pop,
               text= sprintf(
                 "País: %s<br>Exp. de vida: %s<br>PIB per Cápita: %s<br>Población: %s<br>%s", country, lifeExp, gdpPercap, pop, continent
                 )
               )
             ) +
           geom_point(
             #col = "royalblue2"
             ) +
           labs(
             x="PIB percápita ($US)",
             y="Esp. de vida",
             size="Población"
             ) +
           theme_minimal() +
           theme(
             legend.position = "bottom",
             axis.text.x = element_text(size = 7, angle = 45)
           ),
         tooltip = "text"
         )


