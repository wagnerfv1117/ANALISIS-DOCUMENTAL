# Lee un archivo CSV llamado "archivo.csv" y almacena los datos en un dataframe
datos <-read.csv("/home/wagner/Documents/PROYECTOS DATASCIENCE/PROYECTOS R/ANALISIS DOCUMENTAL/documentos-gepol.csv")

# Muestra las primeras filas del dataframe para verificar que se haya cargado correctamente
head(datos)

#Limpieza del dataframe en la columna sobrante
datos <- datos[, -which(names(datos) == "X")]
head(datos)

#Analisis descriptivo del dataframe
#resumen
summary(datos)

describe(datos)# antes que nada activar la función - "library(psych)"

# Seleccionar columna de interés para el analisis
columna <- datos$Cantidad

# Crear un histograma de los datos que se van analizar
columna_cantidad <- datos$Cantidad

# Crea un histograma
hist(columna_cantidad,
     main = "Histograma Documentos producidos en GEPOL",    # Título del gráfico
     xlab = "Cantidad",                  # Etiqueta del eje x
     ylab = "Frecuencia",               # Etiqueta del eje y
     col = "blue",                      # Color de las barras
     border = "black",                  # Color del borde de las barras
     xlim = c(min(columna_cantidad), max(columna_cantidad)),  # Rango del eje x
     breaks = 20)                       # Número de intervalos (barras)


#Graficar la media
# Carga la librería ggplot2 si aún no lo has hecho
library(ggplot2)

# Crea un histograma con ggplot2
histograma <- ggplot(data = datos, aes(x = Cantidad)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  labs(x = "Valores", y = "Frecuencia") +
  theme_minimal()

# Calcula la media de la columna Cantidad
media <- mean(datos$Cantidad)

# Agrega una línea vertical para marcar la media en el histograma
histograma_con_media <- histograma +
  geom_vline(xintercept = media, color = "red", linetype = "dashed", size = 1) +
  annotate("text", x = media + 2, y = 3, label = paste("Media =", round(media, 2)), color = "red")

# Visualiza el histograma con la media
print(histograma_con_media)


# Cargar la biblioteca ggplot2
library(ggplot2)

# Crear un gráfico de barras
ggplot(datos, aes(x = Mes, y = Cantidad)) +
  geom_bar(stat = "identity", fill = "aquamarine") +
  labs(title = "Cantidad documentos producidos en GEPOL",
       x = "Mes",
       y = "Cantidad")

