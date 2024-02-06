#### Partes de R Studio ####

## Consola: Es el espacio en el que se ejecutan las órdenes que damos a R a través de la línea de código
## Script: Es un archivo en el cual podemos guardar las líneas de código (lista de comandos) que ejecutaremos o hemos ejecutado.
## Workspace: Es un espacio en el que se guardan los objetos creados en una sesión de R.
## Dispositivo Gráfico: Es la ventana en la que se muestran los gráficos realizados

#### Primeros pasos en R ####

# Es importante mencionar que los comandos se dividen en dos grandes tipos:

# * Asignaciones: Piden a R que guarde el resultado de una orden en un elemento que llamaremos objeto.
# R es sensible a mayus o minus
help('seq');
x <- seq(from=10,to=1,by=-1);
z <- rev(seq(from=1,to=10,by=1));
x <- (10:1);
y <- rep(x,3);
nombre <- "Maria"

## * Expresiones: Son una orden que se da a R de ejecutar una o muchas tareas empleando típicamennte objetos y parámetros (de ser necesarios).
## Funciones: lo que va dentro de la función son sus argumentos (separados por ,)

print("Bienvenidos")
help("seq")

# Operaciones básicas
x<- 4
y <- 2
x+y
sum(x,y)
z <- x^2 + y^4
sqrt(z)

#Esta función nos permite ver en la consola el nombre de los objetos que hemos creado
objects()

# Operaciones de relación y lógicos

## R también permite comparar dos objetos y determinar si estos son iguales, diferentes, etc.
x == y & x >= y
x != y
x <= y
w <- x == y

#### CLASES DE OBJETOS ####

# numeric: números reales o decimales
# Ejemplo:

x<- 1.5
class(x)

# integer: números enteros
# Ejemplo:

x<- 1
class(x)
x<-as.integer(x)
class(x)

# complex: números complejos
# Ejemplo:

x<- 2 + 3i
class(x)

# character: caracteres
# Ejemplo:
x<- "Maria"
class(x)

# logical: resultados lógicos (TRUE o FALSE)
x<- FALSE
class(x)
y<- TRUE
class(y)
w <- x == y

class(w)

# factor:
f <- factor(x=1, levels=c(1,2,3,4), labels=c("M","R","B","E"), ordered = ordered(1))
m <- factor(1, c(1,2,3,4), c("M","R","B","E"), ordered = ordered(1))
class(f)
class(m)
help('factor')

# Cambiar el tipo de objeto
# Ejemplo:
x<-1
class(x)
x<-as.character(x)
class(x)

#Otras funciones para cambios
as.numeric()
as.integer()
as.logical()
as.complex()
as.factor()

#### OBJETOS COMPUESTOS ####

# Vectores: Los elementos que los componen tienen la misma clase
# Ejemplo:
edad<-c(10,30,45,60)
help('c')
class(edad)
nombres<-c("Maria","Lina","Jesús","Sandra")
class(nombres)
sexo<-c("F","F","M","F")
class(sexo)

# listas: Los elementos que las componen pueden ser de diferentes tipos y clases
# Ejemplo:
l1 <- list(edad,nombres,sexo)

# Este tipo de objetos tendrá diferentes compartimientos (slots) uno para cada objeto que conforma la lista. Los slots
# se pueden acceder empleando los corchetes cuadrados ([]) para determinar el número del slot que se quiere acceder.

l1[2]

# O de esta manera para entrar a las posiciones de los elementos que componen a los objetos dentro de la lista.
l1[[2]][2]

l1[[1]][3]
l1[[2]][4]

class(l1)
# matrix: matriz
# Ejemplo:

# matrix(data , nrow , ncol, byrow = FALSE)
m1 <- matrix( c(1, 2, 3, 3, 4, 5), nrow = 2, ncol = 3, byrow = TRUE)

# array: colección de objetos
# Transformando datos


# data.frame: base de datos
# Ejemplo:
tabla <- data.frame(edad, nombres, sexo)

str(tabla)
tabla$edad<-as.character(tabla$edad)
str(tabla)
tabla$nombres[2]
