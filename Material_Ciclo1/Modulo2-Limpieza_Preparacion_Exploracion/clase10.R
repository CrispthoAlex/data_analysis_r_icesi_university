# Clase 10 - 21 Marzo 2023
getwd()
ls()
baseTest <- read.csv('Base1.csv', fileEncoding = "UTF-8")

head(baseTest, 10) # primeros n datos
tail(baseTest)

class(baseTest)
str(baseTest)
dim(baseTest) # dimension de la base rowxcol

class(baseTest$ESTU_TIPODOCUMENTO) # obtener el tipo de dato de una variable especifica

baseTest$DESEMP_LECTURA_CRITICA <- as.factor(baseTest$DESEMP_LECTURA_CRITICA)

class(baseTest$DESEMP_LECTURA_CRITICA)

baseTest$DESEMP_LECTURA_CRITICA
baseTest$PUNT_LECTURA_CRITICA[20]

# nombres de columna
names(baseTest)

# crear columna
baseTest$PRUEBA <- 'Saber11'
baseTest$PRUEBA
baseTest

# Variable suma col 12[PUNT_LECTURA_CRITICA] y 13[PUNT_MATEMATICAS]
sumapuntaje <- baseTest$PUNT_LECTURA_CRITICA + baseTest$PUNT_MATEMATICAS
sumapuntaje[12]
# sumar una columna
sum(baseTest$PUNT_GLOBAL)
help(colSums)
sumapuntaje_rowcol <- rowSums(baseTest[, 12:13])
sumapuntaje_rowcol
# verficación de igualdad en los resultados de los dos metodos
sumapuntaje_rowcol == sumapuntaje

###################################
# Clase 11, 23 marzo 2023
# Estadistica
sd(baseTest$PUNT_GLOBAL) # desviación estandar
mean(baseTest$PUNT_GLOBAL) # media o promedio de datos
median(baseTest$PUNT_GLOBAL) # punto medio/ mitad de los datos
max(baseTest$PUNT_GLOBAL) # valor maximo
min(baseTest$PUNT_GLOBAL) # valor minimo

summary(baseTest$PUNT_GLOBAL) # resumen de datos
help(hist)
hist(
  baseTest$PUNT_GLOBAL,
  include.lowest = TRUE,
  main = paste("Histograma de ", names(baseTest)[17] ),
  axes = TRUE,
  col='green'
)

# instalación de paquete para calcular moda y sus variedades
install.packages("modeest")
library(modeest)

# Ejercicio Miro (https://miro.com/app/board/uXjVMbfG4WM=/)
filterGenere <- function(genero) {
  return ({
    which(baseTest$ESTU_GENERO == genero)
  })
}
filterGenere('F')
columnSelected <- 'PUNT_GLOBAL'
baseTest$PUNT_GLOBAL
baseFem <- baseTest[filterGenere('F'),]
baseFem
baseMasc <- baseTest[filterGenere('M'),]
baseMasc
names(baseTest)[17]
summary(baseFem)
summary(baseMasc)

##############################################################
# Histograma mujeres
puntajeGlobalMujeres_Histo <- hist(
  baseFem$PUNT_GLOBAL,
  include.lowest = TRUE,
  main = paste("Histograma de ", columnSelected," de Mujeres"),
  axes = TRUE,
  col='#e7298a'
  #xlab= "Puntaje Global",
  #ylab= "Frecuencia",
)

# Histograma hombres
puntajeGlobalHombres_Histo <- hist(
  baseMasc$PUNT_GLOBAL,
  include.lowest = TRUE,
  main = paste("Histograma de ", names(baseTest)[17]," de Hombres"),
  axes = TRUE,
  col='#fe9929'
  #ylab= 'Frecuencia',
  #xlab= 'Puntaje Global',
)

# print
puntajeGlobalMujeres_Histo
puntajeGlobalHombres_Histo

# Bases cruzadas
tabla_Fem_Ubicacion_Matematicas <- table(baseFem$COLE_AREA_UBICACION, baseFem$DESEMP_MATEMATICAS)
tabla_Masc_Ubicacion_Matematicas <- table(baseMasc$COLE_AREA_UBICACION, baseMasc$DESEMP_MATEMATICAS)

###############
prop.table(tabla_Fem_Ubicacion_Matematicas, 1)
prop.table(tabla_Masc_Ubicacion_Matematicas, 1)

addmargins(tabla_Fem_Ubicacion_Matematicas)
addmargins(tabla_Masc_Ubicacion_Matematicas)


###############################################
###############################################
# Clase 12, 28 de Marzo 2023

# create base
baseTest <- read.csv('Base1.csv', fileEncoding = "UTF-8")

# variable names
names(baseTest)

baseFem[c('ESTU_MCPIO_RESIDE', 'COLE_NOMBRE_SEDE', 'DESEMP_MATEMATICAS')]

baseTest[c("ESTU_TIPODOCUMENTO","ESTU_GENERO", "ESTU_NACIONALIDAD")]
####### SubBase #####

# por genero
subBase_Genero<-subset(baseTest, subset=ESTU_GENERO == "F")

# por puntaje
subBase_Puntaje <-subset(baseTest, subset=PUNT_GLOBAL > 200)

# seleccionando columnas especificas
subBase_ColumnasyPuntaje <- subset(
    baseTest, 
    subset=PUNT_GLOBAL > 200, 
    select = c("ESTU_TIPODOCUMENTO", "PUNT_GLOBAL" , "ESTU_GENERO")
    )
subBase_ColumnasyPuntaje

#######
# Ejercicio en clase

#--------------------------------------------------------
# (1)
prueba2 <- subset(
  baseTest,
  subset = baseTest$PUNT_LECTURA_CRITICA >= 80 & baseTest$PUNT_MATEMATICAS >= 80,
  select = c("COLE_NOMBRE_SEDE", "PUNT_GLOBAL" , "ESTU_GENERO")
)
prueba2
help(subset)

#--------------------------------------------------------
# (2)
dim(prueba2) # => [1] 27  3

#--------------------------------------------------------
# (3)
prueba2_Generos <- table(prueba2$ESTU_GENERO)
prueba2_Generos # F= 13,  M= 14
dim(prueba2_Generos) # => [1] 2

#---------------------------------------------------------

tabla_ColGenero <- table(prueba2$COLE_NOMBRE_SEDE, prueba2$ESTU_GENERO)
# sum(tabla_ColGenero)

#--------------------------------------------------------

prueba2_F <- prueba2[which(prueba2$ESTU_GENERO == 'F'),]
prueba2_F
dim(prueba2_F) # => [1] 13  3
prueba2_M <- prueba2[which(prueba2$ESTU_GENERO == 'M'),]
prueba2_M
dim(prueba2_M) # => [1] 14  3

#--------------------------------------------------------

# (4)
# a)
prueba2_Colegios <- table(prueba2$COLE_NOMBRE_SEDE)
prueba2_Colegios
dim(prueba2_Colegios)

# b)
maxColegio <- names(prueba2_Colegios)[
  which(prueba2_Colegios == max(prueba2_Colegios),
  arr.ind = TRUE)[, 1]
  ]

maxColegio
# [1] "COL BOLIVAR", "COLEGIO BILINGUE DIANA OESE"

# (5)
names(baseTest)

puntaje_Global <- names(baseTest)[17]

hist(
  prueba2$PUNT_GLOBAL,
  #include.lowest = TRUE,
  main = paste("Histograma de ", puntaje_Global),
  # xlab = puntaje_Global, '# Estudiantes',
  #axes = TRUE,
  col='violet',
  border = "blue"
)

help(hist)

# Set working directory
setwd("C:/Users/Holberton/CrispthoferRincon/R_certificado_2023/Material_Ciclo1/Moulo2-Limpieza_Preparacion_Exploración")
