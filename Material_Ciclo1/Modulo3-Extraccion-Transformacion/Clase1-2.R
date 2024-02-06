# cargar paquete
# install.packages("dplyr")
library(dplyr)

# El operador pipe

# El operador pipe ( %> %) permite encadenar resultados rápidamente,
# de manera que se pueden ejecutar varios comandos de manera fácil e 
# intuitiva.

r1 <- sqrt(49)
r2 <- log(r1)
log(sqrt(49))

#  %>% solo se puede ejecutar con libreria dplyr

49 %>%
  sqrt() %>%
  log()
  # se calcula la raíz cuadrada
  # se calcula el log log() %>%

# Este operador se puede generar en la consola o en un script 
# presionando las teclas command + shift + M 


base <- read.csv("SABERTYT20162.csv",  sep=";")
class(base) # "data.frame"

baseSaber2016 <- as_tibble(base)
class(baseSaber2016) # "tbl_df"     "tbl"        "data.frame"


# filter()
# Para emplear esta función se requieren dos argumentos. 
# El primero es el objeto con los datos, que típicamente 
# se pasa empleando el opera- dor %> %. Y el segundo 
# argumento es la condición que deben cumplir las
# observaciones que pasarán el filtro.


baseSaber2016$ESTU_DEPTO_RESIDE
base_Valle_F<- baseSaber2016 %>%
  # Filtro 1
  filter(ESTU_DEPTO_RESIDE == "VALLE") %>% 
  # Filtro 2
  filter(ESTU_GENERO == "F")

base_F_CC <- filter(baseSaber2016,
                    ESTU_DEPTO_RESIDE == "VALLE"  &
                      ESTU_GENERO == "F" &
                      ESTU_TIPODOCUMENTO == "CC" )

# Queremos extraer no solamente los datos del año 2007 para dos departamentos.
# En este caso podemos emplear el operador %in % y la lista de los departamentos.

valle_cauca_f <- baseSaber2016 %>%
  filter(ESTU_DEPTO_RESIDE %in% c("VALLE", "CAUCA")) %>% 
  filter(ESTU_GENERO == "F" )

## Ordenar observaciones

# Ascendete
base_Valle<- baseSaber2016 %>%
  filter(ESTU_DEPTO_RESIDE == "VALLE") %>% 
  arrange(ESTU_GENERO)

# Descendente
base_Valle<- baseSaber2016 %>%
  filter(ESTU_DEPTO_RESIDE == "VALLE") %>% 
  arrange(desc(ESTU_GENERO))

##Resumir casos (group_by() summarise())

# El verbo n() cuenta cuántos casos hay por grupo.

base_departamento<- baseSaber2016 %>% 
  filter( ESTU_GENERO == "F") %>% 
  group_by(ESTU_DEPTO_RESIDE) %>% 
  summarise(total = n()) %>% 
  arrange(desc(total))


###################################################
# EJERCICIO EN CLASE
load("Victimas.Rdata")
base_Victimas <- as_tibble(base)

# Check base
base_Victimas

baseVictimasEtnia <- base_Victimas %>%
  group_by(ETNIA) %>% 
  summarise(total = n()) %>%
  arrange(desc(total))

baseVictimasDiscapacidad <- base_Victimas %>%
  group_by(DISCAPACIDAD) %>% 
  summarise(total = n()) %>%
  arrange(desc(total))

baseVictimasEtnia

baseVictimasDiscapacidad

########
# 04 mayo 2023

######## Filtrar por Negro o Afrocolombia con Discapacidad multiple
victimas_NARP_Multiple <- base_Victimas %>%
  filter( ETNIA == "Negro(a) o Afrocolombiano(a)") %>% 
  filter(DISCAPACIDAD == "Multiple")

victimasTotal_NARP_Multiple <- victimas_NARP_Multiple %>%
  group_by(SEXO) %>% 
  summarise(total = n()) %>%
  arrange(desc(total))

# Filtrar por Negro o Afrocolombia con Discapacidad multiple Hombre
victimasM_NARP_Multiple <- victimas_NARP_Multiple  %>% 
  filter(SEXO == "Hombre")

# Filtrar por Negro o Afrocolombia con Discapacidad multiple Hombre Total
victimasM_Total_NARP_Multiple <- victimasM_NARP_Multiple  %>% 
  group_by(SEXO) %>% 
  summarise(total = n()) %>%
  arrange(desc(total))

# Filtrar por Negro o Afrocolombia con Discapacidad multiple Mujer
victimasF_NARP_Multiple <- victimas_NARP_Multiple  %>% 
  filter(SEXO == "Mujer")

# Filtrar por Negro o Afrocolombia con Discapacidad multiple Mujer Total
victimasF_Total_NARP_Multiple <- victimasF_NARP_Multiple  %>% 
  group_by(SEXO) %>% 
  summarise(total = n()) %>%
  arrange(desc(total))


# Con la base de víctimas

base_vic_CICLO_VITAL<- base_Victimas %>% 
  filter( ESTADO_DEPTO == "Valle del Cauca") %>% 
  group_by(CICLO_VITAL) %>% 
  summarise(Promedio = mean(EVENTOS),
            Observaciones = n(),
            Eventos_Total = sum(EVENTOS)) %>% 
  arrange(desc(Observaciones))

# Mutate. Usar para crear nuevas variables
base_vic_CICLO_VITAL_Percentage <- base_vic_CICLO_VITAL %>%
  mutate(porcentaje = Observaciones / Eventos_Total * 100)

###############
baseNueva_Victimas <- base_Victimas  %>% 
  select('VIGENCIA', 'HECHO','ESTADO_DEPTO')
#%>% na.omit()
baseNueva_Victimas_NoNA <- na.omit(base_Victimas)  %>% 
  select('VIGENCIA', 'HECHO','ESTADO_DEPTO')

baseVictimasDepto <- base_Victimas %>% 
  filter(ESTADO_DEPTO == "Amazonas") %>% 
  group_by(SEXO) %>% 
  summarise(Promedio = mean(EVENTOS)) %>% 
  arrange(desc(Promedio))

help(summarise)
