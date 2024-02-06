#CLASE 3 Continuación ggplot2

############################
#1. Instalación del paquete 
############################
#install.packages("ggplot2")
library(ggplot2)

############################
#2. Cargar los datos
############################

#cargar paquete
#install.packages("gapminder")
library(gapminder)
data("gapminder")

dispersion_graphic <- ggplot(
  # data layer
  gapminder, 
  # aesthetic layer
  aes(x = gdpPercap, y = lifeExp) #x = gdpPercap, y = lifeExp
  )  +
  # geometry layer
  geom_point()


#Capa Estadísticas
#Al gráfico de dispersión se le puede agregar una línea de tendencia 
#que permita al lector ver la relación entre las variables.

dispersion_graphic +
  # facets layer - sub graphic
  facet_wrap(~continent) +
  # Stats layer
  #stat_smooth()
  stat_smooth(method = "lm", se = F, col= "yellow")


# stat_smooth() agrega recta de regresión se puede escoger diferentes suavizaciones 
#además muestra los intervalos de confianza

#Ahora el gráfico agregando tanto la capa de faceta como de estadística
dispersion_graphic +
  # facets layer - sub graphic
  facet_wrap(~year) +
  # Stats layer
  #stat_smooth()
  stat_smooth(method = "lm", se = F, col= "yellow")

dispersion_graphic +
  # facets layer - sub graphic
  facet_wrap(~continent) +
  # Stats layer
  #stat_smooth()
  stat_smooth(method = "lm", se = F, col= "yellow")

#se=F no mostrar errores estádar
#Col= yellow

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp))  +
  geom_point() +
  facet_wrap(.~continent) + 
  stat_smooth(method ="lm", se = F, col="red") 

#Otros linea de regresión también se puede por 

dispersion_graphic + 
  geom_jitter() + scale_x_log10() + stat_smooth(method ="lm", se =F, col="red") 

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, col = continent)) + 
  # geometry layer
  geom_point() + 
  # stats layer
  stat_smooth(method ="lm", se =F, col="red") +
  # scales layer
  scale_x_log10() + 
  # add regression line by continent
  geom_smooth(aes(group = continent), method = "lm", se = FALSE, linetype = 1)
#Este código nos permite sacar la regresión por continente


# Capa Escalas Hace alusión a los ejes
#cambiemos escala a logartimica
pp <- ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) + geom_point() +
  facet_wrap(.~continent) + scale_x_log10() 
pp
#se ve mejor con una escala logaritmica
#scale_y_log10() 
#scale_x_continuous()
#scale_x_discrete()

#Otras funciones de esta capa...
#Incluir un título del gráfico.
#Para lo anterior se usa la función labs().
#labs (title,subtitle,caption )
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) +
  geom_point() +
  facet_wrap(~continent)+ scale_x_log10() +
  labs(title = "Relación entre el PIB per cápita y al expectativa de vida por continente",
       subtitle = "1952-2007" ,
       caption = "Fuente: Datos de gapminder") 
#' para mac funciona tambien    

#Modificar el nombre de los ejes en el gráfico.
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) +
  geom_point() +
  facet_wrap(~continent)+ scale_x_log10() +
  labs(title = "Relación entre el PIB per cápita y al expectativa de vida por continente",
       subtitle = "1952-2007" ,
       caption = "Fuente: Datos de gapminder") +
  xlab("PIB per cápita (en miles)") +
  ylab("Expectativa de vida")

#También puede incluir el nombre de los ejes en labs()
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) +
  geom_point() +
  facet_wrap(~continent)+ scale_x_log10() +
  labs(x = "PIB per cápita (en miles)", y = "Expectativa de vida", 
       title = 'Relación entre el PIB per cápita y al expectativa de vida por continente') 
