### Ejercicio clase 3####

#Fije el directorio


setwd("C:/Users/Holberton/CrispthoferRincon/R_certificado_2023/Material_Ciclo1/Moulo2-Limpieza_Preparacion_Exploración");

### Librerias

### Cargue los datos ###

sabertyt<-read.table("SABERTyT20162.csv", sep=";",quote = "",header=T,fill = T, stringsAsFactors = F, na.strings = "")

#DUPLICADOS######

#¿Hay observaciones duplicadas?
table(duplicated(sabertyt));

#Eliminar observaciones duplicadas: No


#### VALORES PERDIDOS ########
# Valores perdidos
table(is.na(sabertyt)) ### sabemos que cantidad de filas hay con datos perdidos y la cantidad de filas sin datos perdidos
colSums(is.na(sabertyt)) ### Reviso los faltantes de cada columna 

install.packages("inspectdf") ##Instalación de paquete
library(inspectdf) ## llamar paquete
checkNA <- inspect_na(sabertyt) ## Nos permite mostrar cantidad y porcentaje de perdidos por variable
checkNA
#Encuentre las filas que tienen algun valor perdido: 
na.sabertyt<-sabertyt[!complete.cases(sabertyt),]
na.sabertyt
# 53042 obs y 105 variables. Es decir, todas los datos tienen al mensi un dato perdido

# Cree una nueva base de datos que no tenga valores perdidos 

sabertyt_sinna<- na.omit(sabertyt) #0 observaciones, en todas las filas hay al menos un missing value
### En este caso no tienen sentido borrar pues nos quedaríamos sin base de datos


#Elimine las variables con un alto porcentaje de valores perdidos
sabertyt$ESTU_ETNIA<-NULL

#Eliminar columna columna es muy lento, por eso vamos a :

## Crear una base para tratar los missing values, 

#Número de NA por columna:
MISSING<-colSums(is.na(sabertyt))
#Veamos que tiene MISSING
MISSING
#Convertimos el objeto MISSING en un data frame
MISSING<-as.data.frame(MISSING)
#Creamos una columna en MISSING con los nombres de las filas que se llame nombre l
MISSING$nombre<-rownames(MISSING)
#Obtenemos el porcentaje de valores perdidos por fila
MISSING$per<-MISSING$MISSING/nrow(sabertyt)
#Dejamo solo aquellas filas (recuerde que son las columnas de sabertyt) que tienen menos del 50% de datos sin NA
MISSING<-subset(MISSING, per<0.5)


#Dejamos en sabertyt solo aquellas columnas que tienen menos del 50% de los datos con missing
sabertyt<-sabertyt[, colnames(sabertyt)%in%MISSING$nombre]


table(sabertyt$ESTU_ESTADO)

##FILTRO para hacer enfásis
#Dejamos solo los resultados de los estudiantes con estu_Estado publicar
sabertyt<-subset(sabertyt, ESTU_ESTADO=="PUBLICAR")


#Volvemos a ver cuántos valores perdidos hay por columna
MISSING<-colSums(is.na(sabertyt))
MISSING<-as.data.frame(MISSING)
MISSING$nombre<-rownames(MISSING)
MISSING$per<-(MISSING$MISSING/nrow(sabertyt))*100
MISSING<-subset(MISSING, per<0.5)


### CORRESPODENCIA ENTRE VARIABLE Y SU TIPO 
str(sabertyt)
#Si solo quiero saber que clase de variables son:
sapply(sabertyt, class)
#Revise el diccionario de variables y corrija las que considere

sabertyt$ESTU_TIPODOCUMENTO<-as.factor(sabertyt$ESTU_TIPODOCUMENTO)
sabertyt$ESTU_NACIONALIDAD<-as.factor(sabertyt$ESTU_NACIONALIDAD)
sabertyt$ESTU_EXTERIOR<-as.factor(sabertyt$ESTU_EXTERIOR)
sabertyt$ESTU_ESTADOCIVIL<-as.factor(sabertyt$ESTU_ESTADOCIVIL)
sabertyt$ESTU_GENERO<-as.factor(sabertyt$ESTU_GENERO)
sabertyt$ESTU_MCPIO_RESIDE<-as.factor(sabertyt$ESTU_MCPIO_RESIDE)
sabertyt$ESTU_DEPTO_RESIDE<-as.factor(sabertyt$ESTU_DEPTO_RESIDE)
sabertyt$ESTU_AREA_RESIDE<-as.factor(sabertyt$ESTU_AREA_RESIDE)

#Transformar una por una es muy lento, es mejor utilizar la función lapply. Búsquela.
names(sabertyt)
sabertyt[,c(17:32,34:35,37:45,51,53,54:62,64,65,67,79,83,88)]<-lapply(sabertyt[,c(17:32,34:35,37:45,51,53,54:62,64,65,67,79,83,88)],as.factor)

#Tranformar la variable estu_fechanacimiento de tipo de dato carácter a tipo de dato fecha.
sabertyt$ESTU_FECHANACIMIENTO<-as.Date(sabertyt$ESTU_FECHANACIMIENTO,format="%d/%m/%Y")
names(sabertyt)

#Transformar las respectivas variables a entero
sabertyt[,c(33,36,69,80)]<-lapply(sabertyt[,c(33,36,69,80)],as.integer)

#La variable inse es númerica, tal vez usted tenga el mismo problema que yo y es que el decimal está denotado con una coma; sin embargo, en R el decimal se lee con un punto.
#Por ese motivo primero tiene que cambiar la coma por un punto empleando la función gsub
sabertyt$INSE<-gsub(",",".",sabertyt$INSE)
#Después convierte la variable al formato númerico:
sabertyt$INSE<-as.numeric(sabertyt$INSE)

#### ERROR DE DIGITACION 

#No hay

### VALORES ATÍPICOS
#Revise la función boxplot.stat y comprenda sus componentes
boxplot.stats(sabertyt$INSE)
boxplot.stats(sabertyt$INSE)$out
boxplot.stats(sabertyt$MOD_COMUNI_ESCRITA_PUNT)$out
boxplot.stats(sabertyt$MOD_INGLES_PGREF)$out
boxplot.stats(sabertyt$MOD_COMUNI_ESCRITA_PGREF)$out
boxplot.stats(sabertyt$MOD_INGLES_PUNT)$out
boxplot.stats(sabertyt$MOD_RAZONA_CUANTITAT_PUNT)$out
boxplot.stats(sabertyt$MOD_COMPETEN_CIUDADA_PUNT)$out
boxplot.stats(sabertyt$MOD_COMPETEN_CIUDADA_PUNT)$out

#¿Tiene valores atípicos?
#¿Qué debe hacer con esos valores?
#La próxima clase discutiremos las respuestas a estas preguntas.
