# Instalar y cargar la librería EBImage si es necesario
if (!require(EBImage)) {
  install.packages("BiocManager")
  BiocManager::install("EBImage")
}
library(EBImage)

# Parámetros
milimetros_por_pixel <- 0.021167  # Escala obtenida a partir de 1200 dpi

# Crear la secuencia de números con incrementos de 30
indices <- seq(from = 0, to = 1950, by = 30)

# Crear los nombres de los archivos
imagenes <- paste0("imagenes_bacteria", "/", "frame_", indices, ".png")
# Crear un dataset vacío
resultados_or <- data.frame(Tiempo = numeric(),
                            Perimetro = numeric(),
                            Area = numeric())

# Bucle a través de todas las imágenes
for (i in seq_along(imagenes)) {
  # Cargar la imagen usando EBImage
  img <- readImage(imagenes[i])
  
  # Convertir a escala de grises
  img_gray <- channel(img, "gray")
  
  # Binarizar la imagen usando un umbral (ajusta si es necesario)
  umbral <- otsu(img_gray) 
  img_bin <- img_gray > umbral
  
  # Calcular el perímetro (píxeles en los bordes)
  perimetro_img <- bwlabel(img_bin)
  perimetro_pixels <- computeFeatures.shape(perimetro_img)[, "s.perimeter"]
  
  # Convertir el perímetro de píxeles a micrómetros
  perimetro_milimetros <- sum(perimetro_pixels) * milimetros_por_pixel
  
  # Calcular el área basada en el perímetro asumiendo forma circular
  area_milimetros2 <- (perimetro_milimetros^2) / (4 * pi)
  
  # Calcular el tiempo en horas
  tiempo_horas <- (i-1)*5 # Cada imagen representa 5 horas
  
  # Guardar los resultados en el dataset
  resultados_or <- rbind(resultados_or, 
                         data.frame(Imagen = imagenes[i],
                                    Tiempo = tiempo_horas, 
                                    Perimetro = perimetro_milimetros, 
                                    Area = area_milimetros2))
}

# Guardar los resultados en un archivo CSV
write.csv(resultados_or, "resultados_bacteria.csv", row.names = FALSE)
message("Resultados guardados en 'resultados_bacteria.csv'")

