# Apuntes

Pagina de GitHub Pages para consultar apuntes de teoria, codigo y examenes tipo.

## Render local

Para regenerar los HTML desde los archivos Quarto:

```bash
./render.sh
```

Hace falta tener Quarto y R disponibles en el sistema, junto con los paquetes usados en los `.qmd`.

## Publicacion

El workflow `.github/workflows/publish.yml` instala R, Quarto y los paquetes necesarios, renderiza los `.qmd` a `.html` y publica el repositorio en GitHub Pages.

En GitHub, configura Pages con:

- Source: `GitHub Actions`
- Workflow: `Publish GitHub Pages`

