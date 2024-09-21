library(ggplot2)
library(plotly)
g1 <- ggplot(resultados_1, aes(x = Tiempo)) +
  # Líneas sólidas tanto para el perímetro como el área
  geom_line(aes(y = Perimetro, color = "Perímetro"), linewidth = 1.5) +
  geom_line(aes(y = Area, color = "Área"), linewidth = 1.5) +
  
  # Escalas adecuadas para el perímetro y el área
  scale_y_continuous(
    name = "Perímetro (milímetros)",
    sec.axis = sec_axis(~., name = "Área (milímetros cuadrados)")
  ) +
  
  # Títulos y etiquetas
  labs(
    title = "Crecimiento de la Bacteria a lo Largo del Tiempo",
    subtitle = "Comparación entre el Perímetro y el Área",
    x = "Tiempo (horas)"
  ) +
  
  # Personalización de colores más vibrantes
  scale_color_manual(
    values = c("Perímetro" = "#0072B2", "Área" = "lightblue"),  # Azul vibrante y naranja intenso
    name = "Medición"
  ) +
  
  # Mejoras estéticas en el tema
  theme_minimal(base_size = 15) +  # Base más grande para mejor legibilidad
  theme(
    plot.title = element_text(hjust = 0.5, size = 20, face = "bold", family = "Arial"),
    plot.subtitle = element_text(hjust = 0.5, size = 14, family = "Arial"),
    axis.title.y.left = element_text(color = "#0072B2", size = 14, face = "bold"),
    axis.title.y.right = element_text(color = "lightblue", size = 14, face = "bold"),
    axis.text = element_text(size = 12, family = "Arial"),
    legend.position = "top",
    legend.title = element_blank(),
    legend.text = element_text(size = 14),
    panel.grid.major = element_line(color = "gray90"),
    panel.grid.minor = element_blank(),
    plot.background = element_rect(fill = "#f5f5f5"),  # Fondo claro
    panel.background = element_rect(fill = "#ffffff")  # Fondo de panel blanco
  )

g1 <- ggplotly(g1)

g1