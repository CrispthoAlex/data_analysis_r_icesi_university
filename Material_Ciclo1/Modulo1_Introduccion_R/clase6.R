# Clase 6 - 02 febr 2023
# Packages install
install.packages("gapminder")
data("HairEyeColor")

data(package = "gapminder")
class(gapminder)
head(gapminder, 10) # first ten result (data)
tail(gapminder, 10) # last ten result (data)

# Addition level - country -continent - year
table(gapminder)
table(gapminder$country)
table(gapminder$continent)
nrow(gapminder)
ncol(gapminder)

# metadata
str(gapminder)

# Numeric summary
summary(gapminder[, c(3:6)])
summary(gapminder[, c("year","lifeExp","pop","gdpPercap")])
# vector without file extension
baseFinalFile<-'C:/Users/Holberton/CrispthoferRincon/R_certificado_2023/Material_Ciclo1/tipos_de_formato_cargar_archivos-20230302/base_final'
# view table
read.table(paste0(baseFinalFile,".txt"), header = TRUE)

# apply extension to save the table in variable
# read as .txt
base_finaltxt <- read.table(paste0(baseFinalFile,".txt"), header = TRUE)
# read as .csv
base_finalcsv <- read.table(paste0(baseFinalFile,".csv"), header = TRUE)

# read xls files
install.packages("readxl")
library(readxl)

# WORKHOME
# read as .xls | .xlsx
base_finalxls <- read_excel(paste0(baseFinalFile,".xlsx"))
