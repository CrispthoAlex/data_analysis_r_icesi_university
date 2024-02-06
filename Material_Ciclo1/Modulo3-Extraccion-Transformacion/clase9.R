#Crea un data frame llamado "ventas" con la siguiente estructura y datos:
library(dplyr)
# PIPE %>% <- ctrl + shift +  m

# producto: "A", "B", "C", "A", "B" , "C".
# region: "Norte", "Sur", "Norte", "Sur", "Norte", "Sur".
# cantidad: 10, 15, 8, 12, 6, 9.
# precio_unitario: 20, 25, 18, 22, 28, 16.

producto <- c("A", "B", "C", "A", "B" , "C")
region <- c("Norte", "Sur", "Norte", "Sur", "Norte", "Sur")
cantidad <- c(10, 15, 8, 12, 6, 9)
precio_unitario <- c(20, 25, 18, 22, 28, 16)

ventas <- data.frame(producto, region, cantidad, precio_unitario)

#Filtra las filas del data frame para mostrar solo las ventas de la región "Norte".

ventasNorte <- ventas %>%
  filter(region == "Norte")

#Ordena el data frame por la columna "producto" en orden descendente.

ordenventas <- ventas %>%
  arrange(desc(producto))

#Agrega una nueva columna llamada "ventas_totales" que contenga 
#la multiplicación de la columna "cantidad" y "precio_unitario".

ventas <- ventas %>%
  mutate(ventas_totales = cantidad * precio_unitario)

#Agrupa el data frame por la columna "producto" y muestra la suma total 
#de "ventas_totales" para cada producto.

ventas_por_producto <- ventas %>%
  group_by(producto) %>%
  summarise(ventas_totales = sum(ventas_totales))

#Calcula el promedio de la columna "precio_unitario" para todas las ventas.

ventas_promedio <- ventas %>%
  summarise(prom = mean(precio_unitario))
