# Clase 8

nominal <- c("D","M","R","B","E")
valor <- c(1,2,3,4,5)
rev_Valor <- rev(valor)
rev_Valor
calificaciones <- factor(
  x=1,
  rev_Valor,
  nominal,
  ordered = TRUE, #is.ordered(1)
)
calificaciones

help('levels')
levels(calificaciones)

factor(valor, labels = sort(labels(nominal)))

print(calificaciones)

str(calificaciones)

calificaciones[1]
 
########################################################

# Clase 9
# Review factor object

nominal_1 <- c("D","M","R","B","E")
valor_1 <- c(1,2,3,4,5)
rev_Valor_1 <- rev(valor)
rev_Valor_1
calificaciones_1 <- factor(
  x=1,
  valor_1,
  nominal_1,
  ordered = TRUE, #is.ordered(1)
)
calificaciones_1

# Matriz
matriz_datos <- matrix(seq(1,12), nrow = 3, ncol = 4)
print(matriz_datos)
vector_fila <- matriz_datos[1,]
vector_columna <- matriz_datos[,3]
vector_fila
vector_columna

# vector & dataframe
paises <- c("Mexico","Estados Unidos","Canada")
poblacion <- c(130.2, 328.2, 37.59)
continente <- c("America","America","America")
idioma <- c("Español","Ingles","Frances")
mi_df <- data.frame(paises, continente, idioma)
mi_lista <- list(paises, poblacion, mi_df)
mi_lista[[3]][2,] # print estados unidos
mi_lista[[3]]$paises # print columna paises

# factores y dataframes
nominal_1 <- c("F", "D", "C", "B", "A")
valor_1 <- c(1,2,3,4,5)
calificaciones_2 <- factor(
  x=1,
  valor_1,
  nominal_1,
  ordered = TRUE, #is.ordered(1)
)
#####################################################
nombre <- c("Ana", "Juan", "María", "Pedro", "Sofía")
calif <- c("F","A","A","B","C")
estudiantes <- data.frame(nombre, calif)
estudiantes
estudiantes$nombre
estudiantes$calif

