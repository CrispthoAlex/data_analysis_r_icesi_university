##Clase 7 ejercicio 2 limpieza Guiado

setwd("D:/Usuarios/1144057197/Universidad Icesi (@icesi.edu.co)/Maria Paula Ocampo Arango - Certificaciones/Modulo2/Clase7")

# Contexto

#Se cuenta con datos de salarios de diversos roles en diferentes países, 
#pueden encontrar una descripción de las variables de la base de datos en el 
#siguiente link (https://www.kaggle.com/datasets/ruchi798/data-science-job-salaries?resource=download)

#Antes de realizar un informe para obtener conclusiones sobre características de estos salarios, 
#es importante verificar la calidad de los datos. Para lo anterior, resuelva las siguientes preguntas: 
  
  # Pregunta 1. 
#Verifique la clase de cada una de las variables y constate si tienen la clase correcta. 
#De no ser así, modifiquelas. Además, mencione qué tipo de variable es cada una.

# Primero se carga la base de datos
load("basetaller.RData")

# Luego se verifica que la base haya quedado bien cargada. Esto puede realizarse mediante los comandos head(movies) y tail(movies)


sapply(base,class)

#Se utiliza este comando para ver solo la información sobre la clase de las variables. De aquí, y con base en la información proporcionada inicialmente (diccionario de variables),
#se concluye que las variables están bien.


# Pregunta 2 
#Revise los casos de datos duplicados 

## duplicados
sum(duplicated(base))


# Pregunta 3 
#Existen Valores perdidos o campos vacíos para la base de datos, ¿Cuántos ?
#  ¿cómo los corregirían? (No es necesario corregirlos, solo mencionarlo) }
## vacíos
table(is.na(base))
colSums(is.na(base))
inspectdf::inspect_na(base)

#Se encuentran diferentes campos vacíos en 4 variables, 
#como probablemente no podamos verificar los datos crudos, 
#lo mejor será trabajar con estos campos vacíos.
#Sea no trabajar con alguna de las variables 


# Pregunta 4
#Cree una nueva base de datos que no tenga valores perdidos, ¿qué puede decir?
datos_sinna<- na.omit(base)


#De lo anterior, tenemos que la base de datos perdería 27 observaciones (filas) 
#lo que corresponde al 46% de los datos, aspecto que en nuestro caso no es recomendable. 

# Pregunta 5 

#Teniendo en cuenta lo anterior, vamos a crear una base llamada base1 que solo 
#tenga solo aquellas columnas que tienen menos del 10% de los datos con missing
#¿con cuántas variables me quedo ?

#Número de NA por columna:
MISSING<-colSums(is.na(base))
#Veamos que tiene base
MISSING
#Convertimos el objeto MISSING en un data frame
MISSING<-as.data.frame(MISSING)
#Creamos una columna en MISSING con los nombres de las filas que se llame nombre l
MISSING$nombre<-rownames(MISSING)
#Obtenemos el porcentaje de valores perdidos por fila
MISSING$per<-MISSING$MISSING/nrow(base)
#Dejamo solo aquellas filas (recuerde que son las columnas de sabertyt) que tienen menos del 50% de datos sin NA
MISSING<-subset(MISSING, per<0.1)


#Dejamos en sabertyt solo aquellas columnas que tienen menos del 50% de los datos con missing
base1<-base[, colnames(base)%in%MISSING$nombre]


# Después de realizar este proceso temrminamos con 9 variables. 





# INCONSISTENCIAS


# Pregunta 6

#Verifique que no haya valores inconsistentes entre las variables, en caso de encontrar valores inconsistentes, solucionelo cómo mejor le parezca con la información que tiene.

#Dos variables parecen ser las más razonables para evaluar inconsistencia. Salario y salario en dólares.
#Evaluemos primero los salarios en dólares en ambas columnas.

library(dplyr)
base2 = filter(base, salary_currency == "USD") %>% mutate(iguales = salary-salary_in_usd)

unique(base2$iguales)

#Hay 16 datos con inconsistencia en los salarios. En este caso lo mejor es ponerles NA a esos datos.


base[base$salary_currency == "USD" & base$salary-base$salary_in_usd !=0, c("salary","salary_in_usd")] <- NA


#Al revisar los datos la variable remote_ratio, se encuentran unas inconsistencias pues hay valores por fuera del diccionario de variables.

table(base$remote_ratio)

#Se encontraron 7 valores en 150 lo que se encuentra por fuera de los rangos permitidos de la variable, en ese caso lo mejor es no tomar en cuenta estos valores.

