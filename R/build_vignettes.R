#' run all code in book vignettes in an OSCA.* component
#' @importFrom knitr purl
#' @param x path to OSCA.* component base folder
#' @param exclude character() defaults to `index.Rmd` which would not be compiled in standard usage
#' @export
run_vignettes_code = function(x, exclude="index.Rmd") {
  owd = getwd()
  on.exit(setwd(owd))
  setwd(paste0(x, "/inst/book"))
  todo = dir(patt="Rmd$")
  if (!is.null(exclude)) todo = setdiff(todo, exclude)
  ps = lapply(todo, knitr::purl)
  chk = lapply(ps, function(x) try(source(x, echo=TRUE)))
  invisible(hk)
}
  

