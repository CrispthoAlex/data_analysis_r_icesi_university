# Clase 5 - Taller

library("ggplot2")
library("dplyr")
library(plotly)
library(scales)

# ¿Cómo ha variado el número de casos reportados de violencia doméstica en 
# Colombia por departamento entre el primer y último año disponible en la
# base de datos?

# convert and extract year
vic_dom_2010_2023 <- read.csv("raw_data.csv")
vic_dom_2010_2023

vic_dom_2010_2023$fecha_hecho <- as.Date(
  vic_dom_2010_2023$fecha_hecho, format = "%d/%m/%Y"
  )

vic_dom_2010_2023["anio"] <- format(
  vic_dom_2010_2023$fecha_hecho, format = "%Y"
  )

# Omit NA
vic_dom_2010_2023 <- na.omit(vic_dom_2010_2023)

vic_dom_2010_2023 <- vic_dom_2010_2023 %>%
  filter(departamento != "NO REPORTA" & 
           armas_medios != "-" &
           genero != "-")

##### data #####
vic_dom_depto <- vic_dom_2010_2023 %>%
  group_by(anio, departamento) %>%
  summarise(n = sum(cantidad, na.rm = T))
vic_dom_depto

##### helpers variables #####
# theme
theme_posi_angle <- theme(
  legend.position = "bottom",
  axis.text.x = element_text(size = 7, angle = 90)
)
# labels, title and text
log_cases_title_text <- labs(
  title = "Casos reportados de violencia doméstica en Colombia por departamento entre 2010 y 2023",
  x = "Año",
  y = "Cantidad"
)

cases_weapons_title_text <- labs(
  title = "Casos reportados de violencia doméstica en Colombia por medio (arma) usado(a) entre 2010 y 2023",
  x = "Año",
  y = "Cantidad"
)

genere_group_labels <- labs(
  title = "Composición de las víctimas por género y grupo de edad",
  x = "Grupo etario",
  y = "Cantidad"
)

log_cases_cauca <- labs(
  title = "Casos reportados de violencia doméstica en el departamento del Cauca entre 2010 y 2023",
  x = "Año",
  y = "Cantidad"
)


vic_dom_depto %>%
  ##### aesthetic #####
  ggplot(aes(
      x = anio, y = n,
      group = departamento,
      fill = departamento,
      )) +
  ##### geometry #####
  geom_area() +
  # Formatear el eje Y con formato de coma
  scale_y_continuous(labels = comma) +
  ##### theme #####
  theme_minimal() +
  theme_posi_angle +
  log_cases_title_text

# PTO 2. ¿Cómo ha cambiado la distribución del número de víctimas
# entre el primer y último año?

vic_dom_distri_graph <- vic_dom_depto %>%
    ##### aesthetic #####
  ggplot(aes(
    x = anio,
    y = n,
    group = departamento,
    color = departamento,
    text = n
  )) +
    ##### geometry #####
  geom_line() +
  geom_point() +
    ##### theme #####
  theme_minimal() +
  theme_posi_angle +
  log_cases_title_text

ggplotly(vic_dom_distri_graph, tooltip = "text")

# PTO 3. ¿Qué años fueron los que más hechos violentos se reportaron en el país?

vic_dom_2010_2023 %>%
  count(anio) %>% arrange(-n)


# PTO 4. ¿Cómo han ido evolucionando el número de casos de violencia 
# doméstica por medio usado?


armas_medios_vic_dom <- vic_dom_2010_2023 %>%
    ##### aesthetic #####
  ggplot(aes(
    x = anio, #y = cantidad, #group = departamento,
    fill = armas_medios,
  )) +
    ##### geometry #####
  geom_bar(
    aes(
      x = anio,
      #y = cantidad,
      color = armas_medios
    )) +
    ##### theme #####
  theme_minimal() +
  theme_posi_angle +
  cases_weapons_title_text
armas_medios_vic_dom

# filter(armas_medios != "NO REPORTA" & armas_medios != "NO REPORTADO") %>%
#ggplotly(armas_medios_vic_dom, tooltip = "text")

# PTO 5. ¿Cómo se componen las víctimas por género y grupo de edad?

# remove(data_nb_genere)


genere_group_composition_group <- vic_dom_2010_2023 %>%
  #filter(grupo_etario != "NO REPORTA" & 
  #         grupo_etario != "NO REPORTADO")
  group_by(genero) %>%
  ##### aesthetic #####
  ggplot(aes(
    x = grupo_etario, #y = cantidad
    fill = genero,
    text= after_stat(count)
  )) +
  ##### geometry #####
  geom_bar(
    aes(
      x = grupo_etario,
      #y = cantidad,
      color = genero
    )) +
  ##### theme #####
  theme_minimal() +
  theme_posi_angle +
  genere_group_labels

ggplotly(genere_group_composition_group, tooltip = "text")


# PTO 6 [CONTI. PTO 2]
# Muestre los anteriores resultados ahora filtrando por el departamento
# del Cauca. ¿Cuales son los cinco municipios que más hechos presentan 
# en el último año?

# a)
data_cauca_log_cases <- vic_dom_2010_2023 %>%
  filter(departamento == "CAUCA") %>%
  group_by(anio, municipio) %>%
  summarise(n = sum(cantidad, na.rm = T)) %>%
  ##### aesthetic #####
  ggplot(aes(
    x = anio,
    y = n,
    group = municipio,
    color = municipio,
    text = n
  )) +
    ##### geometry #####
  geom_line() +
  #geom_bar( aes(x = anio,#y = cantidad, color = municipio )) +
    ##### theme #####
  theme_minimal() +
  theme_posi_angle +
  log_cases_cauca

ggplotly(data_cauca_log_cases, tooltip = "text")

# b)
cauca_vic_dom_2023 <- vic_dom_2010_2023 %>%
  filter(departamento == "CAUCA" & anio == "2023") %>%
  group_by(anio, municipio) %>%
  summarise(n = sum(cantidad, na.rm = T)) %>%
  arrange(-n)

head(cauca_vic_dom_2023)

data_cauca_log_lastyear <- head(cauca_vic_dom_2023) %>%
  ##### aesthetic #####
  ggplot(aes(
    x = anio, y = n,
    color = municipio,
    #group = municipio,
    text = n
  )) +
  ##### geometry #####
  geom_point() +
  ##### theme #####
  theme_minimal() +
  theme_posi_angle +
  log_cases_cauca

ggplotly(data_cauca_log_lastyear, tooltip = "text")
