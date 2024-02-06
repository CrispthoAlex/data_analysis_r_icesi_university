library(readxl)
#la tasa de desempleo mensual de las 13 principales ciudades en Colombia (TD_13ciudades).
#El archivo también contiene series mensuales para las 13 principales ciudades de 
#Colombia el número de ocupados en miles de personas (Ocupados), los desocupados 
#(Desocupados) y los inactivos (Inactivos). Estos datos cubren el periodo enero 
#de 2001 a abril de 2019. 

# datosCOMP/
data <-read_excel("datosEmpleo.xlsx",
                  col_types = c("date", "numeric", "numeric",
                                "numeric", "numeric") )
data
class(data)

head(data)

tail(data)

#objeto de serie de tiempo de clase ts,
data.ts <- ts(data[,-1], start = c(2001,1), frequency = 12)
head(data.ts)

library(xts)

#Periocidad de la serie
periodicity(data.ts)

#Gráfica de la serie
ts.plot(data.ts[,1],
        main = "Tasa de desempleo mensual (13 ciudades)")



data.xts <- xts(data[,-1], order.by = data$mes)
class(xts)

#Si la columna mes no hubiese sido leída como una fecha, está se puede convertir a fecha 
#empleando la función as.Date.
data$mes <- as.Date(data$mes)
class(data$mes)

#Grafiquemos rápidamente la tasa de desempleo usando la función plot.xts de paquete xts.
plot.xts(data.xts$TD_13ciudades, main = "Tasa de desempleo mensual (13 ciudades)")
#Noten que este gráfico es mucho más estético que el anterior. Esta es una de las ventajas de los objetos xts.


TD.ts <- data.ts[,1]
head(TD.ts)
TD.xts <- data.xts$TD_13ciudades

#Antes de proceder a descomponer esta serie, carguemos la serie mensual de la 
#base monetaria sólo como un objeto ts.
Base <- read.csv("base.csv", sep=",")
Base <- ts(Base, start = c(1980, 1), frequency = 12)

ts.plot(Base)
