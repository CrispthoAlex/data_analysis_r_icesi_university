# Clase 18 Abril 2023

setwd("C:/Users/Holberton/CrispthoferRincon/R_certificado_2023/Material_Ciclo1/Moulo2-Limpieza_Preparacion_Exploración")
# carga de base de datos
load("basetaller.RData")

# Check tipo de data en base
sapply(base,class)

# cambiar el tipo de dato
base$ID <- as.character(base$ID)

# revisar duplicados
table(duplicated(base))

# suma de datos duplicados
sum(duplicated(base))
# suma de datos no duplicados. ! negar duplicados
sum(!duplicated(base))

#################################
# Base sin duplicados
# option 1
basesinduplicados<-base[!duplicated(base),]
# option 2
filterbase <- unique(base, by = "ID")
filterbase

################################
# check missing data
table(is.na(base))
colSums(is.na(base))
inspectdf::inspect_na(base)

datos_sinna<- na.omit(base)
datos_sinna

###############################
# new data without missing data
missingData <- colSums(is.na(base))
missingData

# convert to data frame
missingData <-as.data.frame(missingData)

# create a new column con los nombres de variables missing
missingData$nombres <- rownames(missingData)

# Get percentage by missing data
missingData$per <- missingData$missingData/nrow(base)

# filter missing data by percentage of missing data
missingData<-subset(missingData, per < 0.05)

#########################################
# create a new base without a X percentage of missing data
baseFilterNew <-base[, colnames(base)%in%missingData$nombre]
baseFilterNew

# Install diplyr
install.packages("dplyr")
# load libry dplyr
library(dplyr)
