# Instalar el paquete si no lo tienes
#install.packages("qrencoder")

# Cargar la librería
library(qrencoder)

# Ruta del archivo .html, si es local usa 'file:///'
html_file <- "https://valentinalujan12.github.io/Poster/Poster/archivo_apoyo.html
"

# Generar el código QR
qr <- qrencode(html_file)

# Guardar como imagen
png("qr_code.png", width = 480, height = 480)
par(mar = c(0, 0, 0, 0))  # Quitar márgenes del gráfico
plot(as.raster(qr), axes = FALSE)
dev.off()
