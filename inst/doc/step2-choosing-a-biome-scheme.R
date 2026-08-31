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
# ranking <- biomes_rank(biomes_example, verbose = FALSE)
# best    <- attr(ranking, "best_scheme")
# best
# head(ranking)

## ----eval = run_raster--------------------------------------------------------
# r_veg <- biomes_rank(biomes_example, scheme_type = "vegetation", verbose = FALSE)
# attr(r_veg, "best_scheme")
# 
# table(biomes_information$scheme_type)   # how many schemes per group

## ----eval = run_raster && requireNamespace("ggplot2", quietly = TRUE), fig.width = 7, fig.height = 5----
# biomes_visualise(biomes_example, panels = "rank")

