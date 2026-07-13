# Paletas de colores para graficos en R
# ------------------------------------------------------------
# Este script define varios vectores de colores en formato HEX.
# Puedes usarlos directamente en ggplot2, base R u otras librerias.
#
# Ejemplo con ggplot2:
#   scale_color_manual(values = paleta_causal)
#   scale_fill_manual(values = paleta_causal)

# Paleta principal: contrastada y sobria para apuntes academicos
paleta_causal <- c(
  azul = "#1F77B4",
  naranja = "#FF7F0E",
  verde = "#2CA02C",
  rojo = "#D62728",
  morado = "#9467BD",
  marron = "#8C564B"
)

# Paleta para distinguir grupos de tratamiento y control
paleta_tratamiento <- c(
  control = "#4E79A7",
  tratamiento = "#E15759",
  antes = "#76B7B2",
  despues = "#F28E2B"
)

# Paleta secuencial para intensidades, rankings o mapas de calor
paleta_secuencial <- c(
  "#F7FCFD",
  "#E0ECF4",
  "#BFD3E6",
  "#9EBCDA",
  "#8C96C6",
  "#8C6BB1",
  "#88419D",
  "#6E016B"
)

# Paleta divergente para efectos positivos y negativos
paleta_divergente <- c(
  negativo_fuerte = "#B2182B",
  negativo_medio = "#EF8A62",
  neutro = "#F7F7F7",
  positivo_medio = "#67A9CF",
  positivo_fuerte = "#2166AC"
)

# Paleta apta para daltonismo, inspirada en Okabe-Ito
paleta_daltonismo <- c(
  negro = "#000000",
  naranja = "#E69F00",
  azul_claro = "#56B4E9",
  verde = "#009E73",
  amarillo = "#F0E442",
  azul = "#0072B2",
  bermellon = "#D55E00",
  rosa = "#CC79A7"
)

# Paleta discreta para muchas categorias
paleta_categorias <- c(
  "#264653",
  "#2A9D8F",
  "#E9C46A",
  "#F4A261",
  "#E76F51",
  "#6D597A",
  "#355070",
  "#B56576",
  "#457B9D",
  "#A8DADC"
)

# Lista con todas las paletas para acceder por nombre
paletas <- list(
  causal = paleta_causal,
  tratamiento = paleta_tratamiento,
  secuencial = paleta_secuencial,
  divergente = paleta_divergente,
  daltonismo = paleta_daltonismo,
  categorias = paleta_categorias
)

# Funcion auxiliar opcional para previsualizar una paleta en base R
ver_paleta <- function(paleta) {
  n <- length(paleta)
  old_par <- par(no.readonly = TRUE)
  on.exit(par(old_par))
  par(mar = c(1, 1, 2, 1))
  image(
    x = seq_len(n),
    y = 1,
    z = matrix(seq_len(n), nrow = n),
    col = unname(paleta),
    axes = FALSE,
    xlab = "",
    ylab = "",
    main = deparse(substitute(paleta))
  )
  text(seq_len(n), 1, labels = names(paleta), cex = 0.8)
}
