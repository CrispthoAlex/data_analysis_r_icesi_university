# Excercise 2

load("saber_11.Rdata")
datos_2016_2021
head(datos_2016_2021)
tail(datos_2016_2021)
names(datos_2016_2021)
# Chequeo tipo de dato por variable
unique(datos_2016_2021$COLE_NOMBRE_ESTABLECIMIENTO)
## usando posiciones
unique(datos_2016_2021[15])
unique(datos_2016_2021[12])

# 1)
# a) La variable COLE_NATURALEZA registra si el colegio es de carácter oficial o no oficial.
datos_2016_2021$COLE_NATURALEZA
#¿Cuál es la clase de la variable COLE_NATURALEZA?.
# Char
#¿Esta variable es cuantitativa o cualitativa?.
# Cualitativa
#¿Un gráfico de barras es adecuado para representar gráficamente esta variable?
# Si, variabe categorica.

# b. Si el gráfico de barras es adecuado entonces realice gráfico de barras 
# para la variable COLE_NATURALEZA empleando la función "geom_barr()" para 
# los años 2020 y 2021, esto para el municipio de su preferencia, para el 
# filtro del municipio emplee la variable COLE_MCPIO_UBICACION.

unique(datos_2016_2021$COLE_MCPIO_UBICACION)
grafico_colenaturaleza_bventura <- datos_2016_2021 %>%
  filter(ANIO == c(2020, 2021), COLE_MCPIO_UBICACION == "BUENAVENTURA") %>%
  ggplot(aes(x = COLE_NATURALEZA)) +
  geom_bar(fill = "#305000") +
  labs( title = "Naturaleza Colegios en B/Ventura\nSaber 11 2020 a 2021",
        y = "Número",
        x = "Naturaleza Colegio") +
  theme_minimal()
grafico_colenaturaleza_bventura # graphic print

# c. Ahora realice el mismo gráfico de barras pero expresado en porcentajes, 
# recuerde lo visto en clase. ¿Qué puedes decir de este gráfico?
grafico_colenaturaleza_percentage <- datos_2016_2021 %>%
  filter(ANIO == c(2020, 2021), COLE_MCPIO_UBICACION == "BUENAVENTURA") %>%
  ggplot(aes(x = COLE_NATURALEZA, y = 100*(..count..)/sum(..count..))) +
  geom_bar(fill = "#305000") +
  labs( title = "Naturaleza Colegios en B/Ventura\nSaber 11 2020 a 2021",
        y = "%",
        x = "Naturaleza Colegio") +
  theme_minimal()
grafico_colenaturaleza_percentage # graphic print

# d. Modifica el color de las barras del gráfico anterior ((emplea el 
# color "royalblue4"), agregale un título y emplea un tema (capa theme_) para 
# mejorar tu gráfico.
grafico_colenaturaleza_color <- datos_2016_2021 %>%
  filter(ANIO == c(2020, 2021), COLE_MCPIO_UBICACION == "BUENAVENTURA") %>%
  ggplot(aes(x = COLE_NATURALEZA, y = 100*(..count..)/sum(..count..))) +
  geom_bar(fill = "royalblue4") +
  labs( title = "Naturaleza Colegios en B/Ventura\nSaber 11 2020 a 2021",
        y = "%",
        x = "Naturaleza Colegio") +
  theme_minimal()
grafico_colenaturaleza_color # graphic print

# e. Realiza el mismo ejercicio pero emplea la variable COLE_JORNADA. 
# ¿Qué puedes decir de este gráfico?
grafico_colenaturaleza_jornada <- datos_2016_2021 %>%
  filter(ANIO == c(2020, 2021), COLE_MCPIO_UBICACION == "CALI") %>%
  ggplot(aes(x = COLE_JORNADA)) +
  geom_bar(position = "fill") +
  labs( title = "Naturaleza Colegios en CALI\nSaber 11 2020 a 2021",
        y = "%",
        x = "Naturaleza Colegio") +
  theme_light()
grafico_colenaturaleza_jornada # graphic print

# f. Ahora realiza el mismo ejercicio pero emplea la variable 
# COLE_NATURALEZA Y COLE_JORNADA en un mismo gráfico, mapea 
# la variable naturaleza en el eje X y  COLE_JORNADA en el 
# color de relleno del gráfico.  ¿Qué puedes decir de este gráfico?
grafico_colenaturaleza_mapVars <- datos_2016_2021 %>%
  filter(ANIO == c(2020, 2021), COLE_MCPIO_UBICACION == "CALI") %>%
  ggplot(aes(x = COLE_NATURALEZA, fill = COLE_JORNADA)) +
  geom_bar(position = "fill") +
  labs( title = "Naturaleza Colegios en CALI\nSaber 11 2020 a 2021",
        y = "%",
        x = "Naturaleza Colegio") +
  theme_light()
grafico_colenaturaleza_mapVars # graphic print

# g. Realice el mismo tipo gráfico del punto anterior pero en esta 
# ocasión cree subgráficos para cada uno de los municipios

grafico_colenaturaleza_subgraph <- datos_2016_2021 %>%
  # filter(ANIO == c(2020, 2021)) %>%
  ggplot(aes(x = COLE_NATURALEZA, 
             y = 100*(..count..)/sum(..count..), 
             fill = COLE_JORNADA)) +
  geom_bar(position = "fill") +
  facet_wrap(~COLE_MCPIO_UBICACION) + 
  labs( title = "Naturaleza Colegios por Municipio
        Saber 11",
        y = "Valor",
        x = "Naturaleza Colegio") +
  theme_light()
grafico_colenaturaleza_subgraph # graphic print

# Gráfico boxplot

# a) Empleando la geometria "geom_boxplot()", crea un 
# diagrama de cajas (bloxplot) empleando las varibles 
# "PUNT_LECTURA_CRITICA" y "COLE_MCPIO_UBICACION". 
# ¿Qué puedes decir a partir del gráfico?.
grafico_colenaturaleza_boxplot <- datos_2016_2021 %>%
  ggplot(aes(x = COLE_MCPIO_UBICACION, y = PUNT_LECTURA_CRITICA)) +
  geom_boxplot(fill = "yellow", col = "red") +
  #facet_wrap(~COLE_MCPIO_UBICACION) + 
  labs( title = "Puntaje Lectura Critica por Municipio
Saber 11 2020 a 2021",
        y = "Puntuaje",
        x = "Municipio") +
  theme_light()
grafico_colenaturaleza_boxplot # graphic print

# b. ¿Cuál es el código que genera este gráfico?
grafico_colenaturaleza_box2 <- datos_2016_2021 %>%
  # filter(ANIO == c(2020, 2021)) %>%
  ggplot(aes(x = FAMI_ESTRATOVIVIENDA, y = PUNT_LECTURA_CRITICA)) +
  geom_boxplot(fill = "lightblue", col = "blue") +
  facet_wrap(~COLE_MCPIO_UBICACION) + 
  labs( title = "Puntaje Lectura Critica por Estrato Vivienda
  por Municipio - Saber 11",
        y = "PUNT_LECTURA_CRITICA",
        x = "FAMI_ESTRATOVIVIENDA") +
  theme_minimal()
grafico_colenaturaleza_box2 # graphic print

# c. ¿Cuál es el código que genera este gráfico?
grafico_colenaturaleza_box3 <- datos_2016_2021 %>%
  # filter(ANIO == c(2020, 2021)) %>%
  ggplot(aes(x = ESTU_GENERO, y = PUNT_LECTURA_CRITICA)) +
  geom_boxplot(fill = "lightblue", col = "blue") +
  facet_wrap(~COLE_MCPIO_UBICACION) +
  # lims(y=c(40, 100)) + 
  labs( title = "Puntaje Lectura Critica por Genero Estudiante por Municipio - Saber 11",
        y = "PUNT_LECTURA_CRITICA",
        x = "ESTU_GENERO") +
  theme_minimal()
grafico_colenaturaleza_box3 # graphic print
