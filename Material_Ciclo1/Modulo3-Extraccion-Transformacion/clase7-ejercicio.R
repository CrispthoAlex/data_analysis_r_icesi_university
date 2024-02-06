#EJERCICIO CLASE 7
#saber11Base <- 
library('dplyr')
load("saber11.Rdata")


#Con la base de datos saber11, sacar el promedio del puntaje de matemáticas 
#para todos los años por género (F y M).
#Cree un objeto de series de tiempo con estas nuevas bases y grafíquelas.

# Promedio Femenino / año
meanMatSaber11_F <- datos_2023 %>%
  filter(ESTU_GENERO == 'F') %>%
  group_by(ANIO) %>%
  summarise(prom = mean(PUNT_MATEMATICAS))

# Promedio Masculino / año  
meanMatSaber11_M <- datos_2023 %>%
  filter(ESTU_GENERO == 'M') %>%
  group_by(ANIO) %>%
  summarise(prom = mean(PUNT_MATEMATICAS))

# TS por genero
# Se selecciona la columna 2 correspondiente al promedio
# F
meanMatSaber11_F.ts <- ts(meanMatSaber11_F[,2], start = c(2017,1), ) #frecuency = ?
# M
meanMatSaber11_M.ts <- ts(meanMatSaber11_M[,2], start = c(2017,1), ) #frecuency = ?
meanMatSaber11_F.ts
meanMatSaber11_M.ts

library(xts)

#Periocidad de la serie
periodicity(meanMatSaber11_F.ts);
periodicity(meanMatSaber11_M.ts);

#Gráfica de la serie
ts.plot(meanMatSaber11_F.ts[,1],
        main = 'Promedio Anual Matematica Femenino
        Pruebas Saber 11 (2017 - 2021)')

ts.plot(meanMatSaber11_M.ts[,1],
        main = 'Promedio Anual Matematica Masculino
        Pruebas Saber 11 (2017 - 2021)')

ts.plot( meanMatSaber11_F.ts, meanMatSaber11_M.ts,
         gpars = list(col = c("green", "orange")),
         main = 'Promedio Anual Femenino (Verde) vs Masculino (Naranja)
         Pruebas Saber 11 (2017 - 2021)', type= "b"
         )

# NATURALES
# Femenino
meanNatuSaber11_F <- datos_2023 %>%
  filter(ESTU_GENERO == 'F') %>%
  group_by(ANIO) %>%
  summarise(prom = mean(PUNT_C_NATURALES))
# Masculino
meanNatuSaber11_M <- datos_2023 %>%
  filter(ESTU_GENERO == 'M') %>%
  group_by(ANIO) %>%
  summarise(prom = mean(PUNT_C_NATURALES))

# TS por genero
# Se selecciona la columna 2 correspondiente al promedio
# F
meanNatuSaber11_F.ts <- ts(meanNatuSaber11_F[,2], start = c(2017,1), ) #frecuency = ?
# M
meanNatuSaber11_M.ts <- ts(meanNatuSaber11_M[,2], start = c(2017,1), ) #frecuency = ?
meanNatuSaber11_F.ts
meanNatuSaber11_M.ts

#Gráfica de la serie
ts.plot(meanNatuSaber11_F.ts[,1],
        main = 'Promedio Anual Naturales Femenino Pruebas Saber 11 (2017 - 2021)')

ts.plot(meanNatuSaber11_M.ts[,1],
        main = 'Promedio Anual Naturales Masculino Pruebas Saber 11 (2017 - 2021)')

ts.plot( meanNatuSaber11_F.ts, meanNatuSaber11_M.ts,
         gpars = list(col = c("green", "orange")),
         main = 'Promedio Anual Femenino (Verde) vs Masculino (Naranja)
         Pruebas Saber 11 (2017 - 2021)'
)

# Matematicas vs Naturales
ts.plot( meanNatuSaber11_F.ts, meanNatuSaber11_M.ts, meanMatSaber11_F.ts, meanMatSaber11_M.ts,
         xlab="Año", ylab="Puntaje",
         gpars = list(col = c("green", "orange", "violet", "blue")),
         main = 'Promedio Anual  Pruebas Saber 11 (2017 - 2021)
         Matematicas (F-Verde, M-Naranja) vs Naturales (F-Violeta, M-Azul)',
         type= "b"
)

#Con la base de datos víctimas, sacar el promedio de los eventos para todos los 
  # años por género (F y M).
  #Cree un objeto de series de tiempo con estas nuevas bases y grafíquelas.
  
load('Victimas.Rdata')

baseHechosProm_F <- base %>%
  filter(SEXO == 'Mujer') %>%
  group_by(VIGENCIA) %>%
  summarise(Promedio = mean(EVENTOS))

baseHechosProm_M <- base %>%
  filter(SEXO == 'Hombre') %>%
  group_by(VIGENCIA) %>%
  summarise(Promedio = mean(EVENTOS))

# Objeto de series. TS por genero
# Se selecciona la columna 2 correspondiente al promedio
# F
baseHechosProm_F.ts <- ts(baseHechosProm_F[,2], start = c(1985,1), ) #frecuency = ?
# M
baseHechosProm_M.ts <- ts(baseHechosProm_M[,2], start = c(1985,1), ) #frecuency = ?

# Check
baseHechosProm_F.ts
baseHechosProm_M.ts

#Periocidad de la serie
periodicity(baseHechosProm_F.ts);
periodicity(baseHechosProm_M.ts);

#Gráfica de la serie
ts.plot(baseHechosProm_F.ts[,1],
        main = 'Promedio Eventos Victimas Femenino  (1985-01-01 to 2023-01-01)')

ts.plot(baseHechosProm_M.ts[,1],
        main = 'Promedio Eventos Victimas Masculino (1985-01-01 to 2023-01-01)')

ts.plot( baseHechosProm_F.ts, baseHechosProm_M.ts,
         gpars = list(col = c("green", "orange")),
         main = 'Promedio Eventos Victimas
         Femenino (Verde) vs. Masculino (Naranja)
         (1985 - 2023)'
         )
#Agrupe la base de víctimas respecto a la vigencia, realice un análisis de 
  # acuerdo a sus interes.
# Cree un objeto de series de tiempo con esta nueva base y grafíquela.
