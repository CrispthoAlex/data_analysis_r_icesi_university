# cargar paquete
# install.packages("dplyr")
# install.packages("plyr")
library(dplyr)
library(plyr)

# Filtrar base Icfes

datos_2023 <- filter(data_icfes, COLE_MCPIO_UBICACION  %in% c("CALI",
                                                              "SAN ANDRÉS DE TUMACO", "PUERTO TEJADA", "QUIBDÓ" ,"BUENAVENTURA"), 
                     ANIO %in% c(2017, 2018, 2019, 2020, 2021), 
                     PERIODO %in% c(20171,20181, 20191, 20201, 20211))

# El verbo rename() permite cambiar el nombre de una o más variables. 
# ANIO, nombre en la base 


datos_2023 <- as_tibble(datos_2023)
datos_2023_rename <- dplyr::rename(datos_2023, AÑO = ANIO)


# mirando solo los nombres de las variables
names(datos_2023_rename)


# para pasar todos los nombres de las variables a solo minúsculas
datos_2023_tolower1 <- rename_with(datos_2023, tolower )
# para pasar todos los nombres de las variables a solo mayúscula
datos_2023_upper1 <- rename_with(datos_2023, toupper)


# contiene punto a mayúscula.
datos_2023_upper2 <- rename_with(datos_2023_tolower1, toupper, contains("_"))
# mirando solo los nombres de las variables 

# transmute() 
# select() y mutate(). Es decir, nos permite seleccionar un conjunto de 
# variables al mismo tiempo que se crean otras nuevas.

datos_2023_t <- transmute(datos_2023, PERIODO,
                          ESTU_GENERO, DESEMP_MATEMATICAS,
                          SUMA = PUNT_INGLES + PUNT_MATEMATICAS)


obj1 <- transmute(datos_2023, PERIODO,
                  ESTU_GENERO, 
                  DESEMP_MATEMATICAS)


obj2 <- transmute(datos_2023, PERIODO,
                  DESEMP_INGLES, 
                  DESEMP_LECTURA_CRITICA,
                  DESEMP_C_NATURALES)
obj5 <- transmute(datos_2023, PERIODO)

# Unamos los dos objetos empleando el verbo bind_cols y como argumentos los dos objetos.

obj4 <- bind_cols(obj1, obj2)

# para combinar los dos objetos en uno solo, usaremos el verbo bind_rows() 
obj3 <- bind_rows(obj1, obj2)

# Clase 3 09/Mayo 2023

#1. Escoja un municipio de su interés y cree un nuevo data.frame que tenga las 
#variables desempeño, género y una variable adicional que sea la suma de estos desempeños.
#¿Qué conclusiones puede sacar de esta nueva base?

#names(datos_2023)

datos_2023_muncipios <- datos_2023 %>%
  mutate(
    desempeno =
      datos_2023$DESEMP_LECTURA_CRITICA +
      datos_2023$DESEMP_C_NATURALES +
      datos_2023$DESEMP_MATEMATICAS +
      datos_2023$DESEMP_SOCIALES_CIUDADANAS
    ) %>%
  filter(COLE_MCPIO_UBICACION == 'QUIBDÓ') %>%
  select(
    'ESTU_RESIDE_MCPIO',
    'ESTU_GENERO',
    'DESEMP_LECTURA_CRITICA',
    'DESEMP_MATEMATICAS',
    'DESEMP_C_NATURALES',
    'DESEMP_SOCIALES_CIUDADANAS',
    'desempeno'
  )

# Borra una columna
# datos_2023_muncipios <- datos_2023_muncipios %>% select(-c(desempeno))

# Clase 4 11/Mayo 2023

#2. Filtre la base por un año que sea de su interés, renombre la variable ESTU_GENERO POR genero.
#Agrupe este base por género y luego calcule la media del puntaje matemáticas

# a)
base_2023_filter <- filter(datos_2023, ANIO == '2021')
base_2023_filter <- dplyr::rename(base_2023_filter, ESTU_GENERO = genero)

# b)  
base_2021_by_genero_mat <- base_2023_filter %>% 
  group_by(genero) %>% summarise(
    media = mean(PUNT_MATEMATICAS)
  )
base_2021_by_genero_mat

help("summarise")
help("group_by")

