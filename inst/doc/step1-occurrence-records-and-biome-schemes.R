## ----setup, include=FALSE-----------------------------------------------------
# Cap BLAS / OpenMP threads to 1 for the vignette build (avoids a
# non-deterministic OpenBLAS allocation error on Windows with R >= 4.6 during
# the raster extracts behind biomes_classify() / biomes_rank()).
Sys.setenv(OPENBLAS_NUM_THREADS = "1")
Sys.setenv(OMP_NUM_THREADS      = "1")

knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(biomes)
data(biomes_example)

# Chunks that need the ~36 MB biome raster run only when it can be fetched
# without burdening CRAN.
run_raster <- isTRUE(as.logical(Sys.getenv("NOT_CRAN", "false")))
if (run_raster) {
  run_raster <- tryCatch({ biomes_download(quiet = TRUE); TRUE },
                         error = function(e) FALSE)
}

## ----eval = FALSE-------------------------------------------------------------
# biomes_rank(occ, lon = "decimallongitude", lat = "decimallatitude")

## -----------------------------------------------------------------------------
data(biomes_example)
nrow(biomes_example)
head(biomes_example)

## ----eval = FALSE-------------------------------------------------------------
# occ <- biomes_occ(taxon = "Fagus sylvatica")

## ----eval = run_raster--------------------------------------------------------
# schemes <- biomes_get()
# schemes

## -----------------------------------------------------------------------------
data(biomes_information)
biomes_information[25, c("publication", "name_of_classification",
                         "scheme_type", "scheme_number")]

biomes_info(25)   # readable summary for biome scheme no. 25

