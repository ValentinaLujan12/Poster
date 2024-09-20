library(EBImage)

# Cargar una imagen de ejemplo
img <- readImage("Video3/imagenes_bacteria/frame_1920.png")

# Convertir a escala de grises
img_red <- channel(img, "red")
img_gray <- channel(img_red, "gray")

# Normalizar la imagen (opcional)
img_normalizada <- normalize(img_gray)

# Aplicar un umbral (puede ser global o adaptativo)
img_bin <- img_normalizada > 0.1  # Prueba diferentes valores de umbral

# Mostrar la imagen binarizada
display(img_bin, title = "Imagen Binarizada tras Normalización")



