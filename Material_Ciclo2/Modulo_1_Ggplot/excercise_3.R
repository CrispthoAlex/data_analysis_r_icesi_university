# Ejercicio 3
library(readxl)
library(ggplot2)
library(dplyr)
gini_evol <- read_xlsx("gini_evol.xlsx")

### Gráfico de líneas  para mostrar evolución

# La base gini_evol.xlsx contiene información sobre la desigualdad 
# (coeficiente de gini) de seis ciudades de Colombia
# (Barranquilla A.M., Bogotá, Bucaramanga A.M., Cali A.M., Medellín A.M.,
# Pasto, Nacional) para el periodo 2015-2021.

# a. Cuál es la clase de las variables "ciudad" y "2015"?. Utiliza 
# la función: str. Utiliza la función: class.
class(gini_evol$ciudad)
str(gini_evol$ciudad)
# [1] "character"

class(gini_evol$"2015")
# [1] "numeric"

# b. Este tipo de gráfica es adecuada para mostrar la evolución en el tiempo
# de esta métrica de desigualdad?
# Si, no?, por qué?

  # Si, me permite visualizar la evolución del coeficiente gini

#c. La información de la base es suficiente y apropiada para realizar
# la gráfica? Por qué?.

  # Sería adecuado manejar un formato extendido o largo para mejor manejo 
  # y visualización de la data

# d. La información se podría transformar, reorganizar. Cómo?
  
# Se puede reorganizar de la sgte forma:

library(reshape2)
help(reshape)

gini_evol_formated <- melt(
  gini_evol,
  id.vars = "ciudad",
  variable.name = "Año",
  value.name = "Gini")

# e. Realiza una gráfica de líneas que muestre la evolución en el 
# tiempo para la ciudad de tu preferencia.

str(gini_evol_formated)
fav_city <- "Cali A.M."
class(fav_city)

gini_evol_formated %>%
  filter(ciudad == "Cali A.M.") %>%
  ggplot(
    aes(
      x = Año,
      y = Gini,
      group = ciudad
      )
  ) + 
  geom_line() +
  labs(
    title = "Evolución anual de Coeficiente de Gini \npara la ciudad de Cali",
    x = "Año", y = "Coeficiente de Gini"
    ) +
  theme_minimal()

#f. Realiza una gráfica de líneas que muestre la evolución en el tiempo 
# para  todas las ciudades.
# Qué puedes analizar en esta gráfica?. Por qué crees que se da ese 
# comportamiento en el 2020? Cómo puedes mejorarla?

gini_evol_formated %>%
  # filter(ciudad == "Cali A.M.") %>%
  ggplot(
    aes(
      x = Año,
      y = Gini,
      group = ciudad,
      color = ciudad
    )
  ) + 
  geom_line() +
  geom_point(shape = 23, size = 2) +
  theme_minimal() +
  theme(legend.position = "bottom") +
  labs(
    title = "Evolución anual de Coeficiente de Gini \npor ciudad",
    x = "Año", y = "Coeficiente de Gini"
    )


### Gráfico de barras agrupadas para mostrar evolución

# a. Realice un gráfico de barras que muestre la evolución desde el 2016
# hasta el 2021 del número de estudiantes evaluados por naturaleza del colegio
# para el municipio de PASTO.

load("datos_saber_11.RData")

# quantify the data. Cualitative to quantitative
evo_estudiantes <- datos_2016_2021 %>%
  filter( COLE_MCPIO_UBICACION == "PASTO" ) %>%
  group_by(ANIO, COLE_NATURALEZA) %>%
  summarise(count = n()) %>%
  mutate(Prop_count = 100*count/sum(count))

evo_estudiantes_graph <- evo_estudiantes %>%
  ggplot(
    aes( 
      x = ANIO,
      y = count,
      fill = COLE_NATURALEZA)
  ) +
  geom_bar(position = "dodge", stat = "identity") +
  theme_minimal()

evo_estudiantes_graph

# b. Agrega etiquetas a este gráfico empleando geom_text().

evo_estudiantes_graph_tags <- evo_estudiantes %>%
  ggplot(
    aes( 
      x = ANIO,
      y = count,
      fill = COLE_NATURALEZA)
  ) +
  geom_bar(position = "dodge", stat = "identity") +
  # add labels
  geom_text( 
    aes(label=count),
    vjust=-0.2, color= "blue",
    position= position_dodge(0.9),
    size= 3
    ) +
  theme_minimal()

evo_estudiantes_graph_tags


# Gráfico de barras agrupadas

# El archivo victimas_2021.xlsx contiene la información de la base de datos
# de la unidad de vícitmas por hecho victimizante con corte a Diciembre del
# 2021 para los municipios de Buenaventura, Cali, Quibdó y Suarez

victimas_data <- read_xlsx("victimas_2021.xlsx")

# a. Cuál es la clase de la variable PARAM_HECHO. Qué tipo de variable es
# PARAM_HECHO Cualitativa (categorías del hecho victimizante)

class(victimas_data$PARAM_HECHO)
# [1] "numeric"


  
# b. Crea un gráfico de barras donde muestres la frecuencia de los tipos de 
# hechos victimizantes. Según la gráfica cuál es el tipo de hecho victimizante
# más común y el menos común?

victimas_data$PARAM_HECHO <- as.factor(victimas_data$PARAM_HECHO)

victimas_data %>%
  ggplot(
    aes(x= PARAM_HECHO, fill = PARAM_HECHO)
  ) +
  geom_bar() + #position = "jitter") +
  # theme(legend.position = "top") +
  theme_minimal()
  

# c. Ahora crea un gráfico de barras donde que permita observar la ETNIA y el
# SEXO.  ¿Puedes mejorar el gráfico?

victimas_etnia_sexo <- victimas_data %>%
  group_by(ETNIA, SEXO) %>%
  # Count etnic por each sex
  summarise(sexo_count = n()) %>% 
  # Create a new variable with relative frequency
  mutate(Prop_sexo = 100 * sexo_count/sum(sexo_count))

victimas_etnia_sexo %>%
  ggplot(
    aes(x= SEXO, fill = ETNIA)
  ) +
  geom_bar() + #position = "jitter") +
  # theme(legend.position = "top") +
  theme_minimal()

  
# d. modifica el ángulo de los titulos del eje x y así evita la superposición
# de los textos


# e. Ahora renombra las categorias del eje x por unos nombres más cortos



# Gráfico de columnas apiladas

# a. Convierte tu gráfico en un gráfico de columnas apiladas



