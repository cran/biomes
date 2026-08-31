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
# head(classified)

## ----eval = run_raster--------------------------------------------------------
# table(classified$Biome_Inventory_layer_01_name, useNA = "ifany")

## ----eval = run_raster--------------------------------------------------------
# # Several schemes at once, one column per scheme
# biomes_classify(biomes_example, scheme = c(1, 25)) |> head(3)
# 
# # Keep both the raster value and the biome-class name
# biomes_classify(biomes_example, scheme = 1, value = "both") |> head(3)
# 
# # Return only the classification columns (drop the input)
# biomes_classify(biomes_example, scheme = 1, append = FALSE) |> head(3)
# 
# # Keep NA for off-map points instead of the "no_biome" label
# class_na <- biomes_classify(biomes_example, scheme = 1, na = NA)
# sum(is.na(class_na$Biome_Inventory_layer_01_name))

