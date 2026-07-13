# Guia rapida de geoms en ggplot2
# ------------------------------------------------------------
# Un "geom" indica que tipo de capa visual queremos dibujar:
# puntos, lineas, barras, histogramas, cajas, areas, etiquetas, etc.
#
# Estructura basica:
#   ggplot(datos, aes(x = variable_x, y = variable_y)) +
#     geom_...(argumentos)
#
# Instala ggplot2 si hace falta:
#   install.packages("ggplot2")

library(ggplot2)

# Datos de ejemplo incluidos en R
datos <- mtcars
datos$cyl <- factor(datos$cyl)

# 1. geom_point(): nube de puntos
# Util para ver relaciones entre dos variables cuantitativas.
ggplot(datos, aes(x = wt, y = mpg, color = cyl)) +
  geom_point(size = 3, alpha = 0.8) +
  labs(
    title = "geom_point(): relacion entre peso y consumo",
    x = "Peso del coche",
    y = "Millas por galon",
    color = "Cilindros"
  )

# 2. geom_smooth(): tendencia o ajuste
# Se suele combinar con puntos para resumir la relacion media.
ggplot(datos, aes(x = wt, y = mpg)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = TRUE, color = "#D62728") +
  labs(
    title = "geom_smooth(): recta de tendencia",
    x = "Peso del coche",
    y = "Millas por galon"
  )

# 3. geom_line(): lineas
# Apropiado para series temporales o variables ordenadas.
serie <- data.frame(
  mes = 1:12,
  ventas = c(12, 15, 14, 18, 22, 25, 24, 27, 30, 31, 35, 38)
)

ggplot(serie, aes(x = mes, y = ventas)) +
  geom_line(linewidth = 1.1, color = "#1F77B4") +
  geom_point(size = 2, color = "#1F77B4") +
  labs(
    title = "geom_line(): evolucion mensual",
    x = "Mes",
    y = "Ventas"
  )

# 4. geom_col(): barras con valores ya calculados
# Usalo cuando el eje y ya contiene el valor que quieres representar.
resumen_cyl <- data.frame(
  cilindros = c("4", "6", "8"),
  media_mpg = as.numeric(tapply(datos$mpg, datos$cyl, mean))
)

ggplot(resumen_cyl, aes(x = cilindros, y = media_mpg, fill = cilindros)) +
  geom_col(width = 0.7) +
  labs(
    title = "geom_col(): media de mpg por cilindros",
    x = "Cilindros",
    y = "Media de mpg"
  )

# 5. geom_bar(): barras contando observaciones
# A diferencia de geom_col(), calcula automaticamente frecuencias.
ggplot(datos, aes(x = cyl, fill = cyl)) +
  geom_bar() +
  labs(
    title = "geom_bar(): numero de coches por cilindros",
    x = "Cilindros",
    y = "Frecuencia"
  )

# 6. geom_histogram(): distribucion de una variable continua
# Agrupa los valores en intervalos o bins.
ggplot(datos, aes(x = mpg)) +
  geom_histogram(bins = 8, fill = "#2CA02C", color = "white") +
  labs(
    title = "geom_histogram(): distribucion del consumo",
    x = "Millas por galon",
    y = "Frecuencia"
  )

# 7. geom_density(): densidad suavizada
# Alternativa suavizada al histograma.
ggplot(datos, aes(x = mpg, fill = cyl)) +
  geom_density(alpha = 0.35) +
  labs(
    title = "geom_density(): distribucion suavizada por grupos",
    x = "Millas por galon",
    y = "Densidad",
    fill = "Cilindros"
  )

# 8. geom_boxplot(): cajas y bigotes
# Resume mediana, dispersion y posibles valores atipicos por grupo.
ggplot(datos, aes(x = cyl, y = mpg, fill = cyl)) +
  geom_boxplot(alpha = 0.8) +
  labs(
    title = "geom_boxplot(): consumo por cilindros",
    x = "Cilindros",
    y = "Millas por galon"
  )

# 9. geom_violin(): distribucion por grupo
# Muestra la forma de la distribucion, no solo sus cuantiles.
ggplot(datos, aes(x = cyl, y = mpg, fill = cyl)) +
  geom_violin(alpha = 0.7) +
  geom_boxplot(width = 0.12, fill = "white", alpha = 0.8) +
  labs(
    title = "geom_violin(): forma de la distribucion por grupo",
    x = "Cilindros",
    y = "Millas por galon"
  )

# 10. geom_text() y geom_label(): etiquetas
# Sirven para anotar puntos o valores concretos.
datos_etiquetas <- head(datos[order(datos$mpg, decreasing = TRUE), ], 5)

ggplot(datos, aes(x = wt, y = mpg)) +
  geom_point(alpha = 0.55) +
  geom_label(
    data = datos_etiquetas,
    aes(label = rownames(datos_etiquetas)),
    size = 3,
    fill = "white"
  ) +
  labs(
    title = "geom_label(): anotacion de observaciones destacadas",
    x = "Peso del coche",
    y = "Millas por galon"
  )

# Resumen orientativo:
# - geom_point(): relaciones entre variables numericas.
# - geom_line(): evolucion ordenada o temporal.
# - geom_col(): barras con valores ya calculados.
# - geom_bar(): recuentos automaticos.
# - geom_histogram(): distribuciones con intervalos.
# - geom_density(): distribuciones suavizadas.
# - geom_boxplot(): comparacion de dispersion por grupos.
# - geom_violin(): forma completa de la distribucion por grupos.
# - geom_smooth(): tendencias o ajustes.
# - geom_text()/geom_label(): anotaciones.
