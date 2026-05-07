#!/usr/bin/env bash
set -euo pipefail

quarto render codigo/manual_data_wrangling_r_completo_v2.qmd
quarto render codigo/manual_did_r_referencia.qmd
quarto render codigo/manual_rdd_r_completo.qmd
quarto render examenes_tipo/resolucion_examen_pap_sintetico_v3.qmd
