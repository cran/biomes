## ----setup, include=FALSE-----------------------------------------------------
Sys.setenv(OPENBLAS_NUM_THREADS = "1")
Sys.setenv(OMP_NUM_THREADS      = "1")
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(biomes)
data(biomes_example)

run_raster <- isTRUE(as.logical(Sys.getenv("NOT_CRAN", "false")))
if (run_raster) {
  run_raster <- tryCatch({ biomes_download(quiet = TRUE); TRUE },
                         error = function(e) FALSE)
}

## ----eval = run_raster--------------------------------------------------------
# classified <- biomes_classify(biomes_example, scheme = 1)
# biomes_tab(classified)

## ----eval = run_raster && requireNamespace("dplyr", quietly = TRUE)-----------
# library(dplyr)
# 
# classified |>
#   distinct(species, Biome_Inventory_layer_01_name) |>
#   biomes_tab()

## ----eval = run_raster && all(vapply(c("sf","ggplot2","viridis","tidyterra","cowplot"), requireNamespace, logical(1), quietly = TRUE)), fig.width = 7, fig.height = 10, fig.alt = "Ranking, occurrence map and biome-class composition"----
# biomes_visualise(biomes_example)               # rank + map + barplot

## ----eval = run_raster && all(vapply(c("sf","ggplot2","viridis","tidyterra"), requireNamespace, logical(1), quietly = TRUE)), fig.width = 7, fig.height = 4, fig.alt = "Occurrence map over biome scheme 1"----
# # just the map, for a fixed scheme
# biomes_visualise(biomes_example, scheme = 1, panels = "map")

## ----eval = FALSE-------------------------------------------------------------
# p <- biomes_visualise(biomes_example, scheme = 1, panels = "map", legend = FALSE)
# ggplot2::ggsave("biome_map.jpg", p, width = 13, height = 8, dpi = 600)

## ----eval = FALSE-------------------------------------------------------------
# res <- biomes_full(x = biomes_example, plot = "all")   # scheme = "best"
# res$scheme     # the chosen biome scheme number
# res$table      # records per biome class
# res$plot       # the combined figure (rank + map + barplot)

## ----eval = FALSE-------------------------------------------------------------
# res <- biomes_full(x = biomes_example, plot = c("rank", "map", "barplot"))
# res$map        # just the map panel, on its own
# res$barplot    # just the barplot panel

