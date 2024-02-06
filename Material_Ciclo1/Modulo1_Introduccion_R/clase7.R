## Clase 7

#Load  library
library(gapminder)

#Show data
head(gapminder, 10)
tail(gapminder, 10)
table(gapminder$country)
nrow(gapminder)
ncol(gapminder)
# Incorrect with year, in this case
summary(gapminder[, c("year","lifeExp","pop","gdpPercap")])
# Correct without year, in this case
# c indicates column
summary(gapminder[, c(,"lifeExp","pop","gdpPercap")])
year_char <- as.character(gapminder$year)
year_char
str(year_char)
class(year_char)
# check variables or columns from a table
data_variables <- names(gapminder)

# apply extension to save the table in variable
baseFinalFile<-'C:/Users/Holberton/CrispthoferRincon/R_certificado_2023/Material_Ciclo1/tipos_de_formato_cargar_archivos-20230302/base_final'

# read as .txt
base_finaltxt <- read.table(paste0(baseFinalFile,".txt"), header = TRUE)
# read as .csv
base_finalcsv <- read.table(paste0(baseFinalFile,".csv"), header = TRUE, sep = ",")

# read xls files
# download
install.packages("readxl")
# load package
library(readxl)

# WORKHOME
# read as .xls | .xlsx
base_finalxls <- read_excel(paste0(baseFinalFile,".xlsx"))

base_finalRdata <- read.table(paste0(baseFinalFile, ".Rdata"))
