library(EBImage)

frame <- "0"
nombre_archivo <- paste0("video_4/imagenes_bacteria/frame_", frame, ".png")
img <- readImage(nombre_archivo)

# Parámetros
micrometros_por_pixel <- 0.021167  # Escala obtenida a partir de 1200 dpi

# Convertir a escala de grises
img_gray <- channel(img, "gray")

# Binarizar la imagen usando un umbral (ajusta si es necesario)
umbral_prueba <- otsu(img_gray)
img_bin <- img_gray > 0.12

# Calcular el perímetro (píxeles en los bordes)
perimetro_img <- bwlabel(img_bin)
perimetro_pixels <- computeFeatures.shape(perimetro_img)[, "s.perimeter"]

# Convertir el perímetro de píxeles a micrómetros
perimetro_milimetros <- sum(perimetro_pixels) * milimetros_por_pixel

# Calcular el área basada en el perímetro asumiendo forma circular
area_milimetros2 <- (perimetro_milimetros^2) / (4 * pi)

cat("Área frame ", frame, ":", area_milimetros2, "mm²\n")
cat("Perímetro frame", frame, ":", perimetro_milimetros, "mm\n")

# Mostrar la imagen binarizada
display(img_bin)
