#!/usr/bin/env Rscript

setwd("C:/Users/ignac/OneDrive/Documentos/GitHub/apuntes/")
dirs <- paste0(getwd(),"/", c("codigo", "examenes_tipo"))

missing_dirs <- dirs[!dir.exists(dirs)]
if (length(missing_dirs) > 0) {
  stop(
    "No existen las carpetas esperadas: ",
    paste(missing_dirs, collapse = ", "),
    call. = FALSE
  )
}

qmd_files <- unlist(
  lapply(
    dirs,
    list.files,
    pattern = "\\.qmd$",
    recursive = TRUE,
    full.names = TRUE
  ),
  use.names = FALSE
)

qmd_files <- sort(normalizePath(qmd_files, winslash = "/", mustWork = TRUE))

if (length(qmd_files) == 0) {
  message("No se encontraron archivos .qmd en: ", paste(dirs, collapse = ", "))
  quit(status = 0)
}

if (!requireNamespace("quarto", quietly = TRUE)) {
  stop(
    "El paquete de R 'quarto' no está instalado. Instálalo con install.packages('quarto').",
    call. = FALSE
  )
}

message("Archivos .qmd encontrados: ", length(qmd_files))

errors <- list()

for (qmd_file in qmd_files) {
  rel_file <- normalizePath(qmd_file, winslash = "/", mustWork = TRUE)
  rel_file <- sub(
    paste0("^", normalizePath(getwd(), winslash = "/", mustWork = TRUE), "/?"),
    "",
    rel_file
  )

  message("\nRenderizando: ", rel_file)

  tryCatch(
    {
      quarto::quarto_render(
        input = qmd_file,
        output_format = "html"
      )
      message("OK: ", sub("\\.qmd$", ".html", rel_file))
    },
    error = function(e) {
      errors[[rel_file]] <<- conditionMessage(e)
      message("ERROR: ", rel_file)
      message(conditionMessage(e))
    }
  )
}

if (length(errors) > 0) {
  message("\nFallaron ", length(errors), " renderizados:")
  for (file in names(errors)) {
    message("- ", file, ": ", errors[[file]])
  }
  quit(status = 1)
}

message("\nRenderizado completado correctamente.")
