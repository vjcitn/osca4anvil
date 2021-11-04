#' run all code in book vignettes in an OSCA.* component
#' @importFrom knitr purl
#' @param x path to OSCA.* component base folder
#' @param exclude character() defaults to `index.Rmd` which would not be compiled in standard usage
#' @param purge logical(1) if TRUE, will clean objects produced from global environment and run gc()
#' @export
run_vignettes_code = function(x, exclude="index.Rmd", purge=TRUE) {
  owd = getwd()
  on.exit(setwd(owd))
  setwd(paste0(x, "/inst/book"))
  todo = dir(patt="Rmd$")
  if (!is.null(exclude)) todo = setdiff(todo, exclude)
  ps = lapply(todo, knitr::purl)
  action = function(x) source(x, echo=TRUE)
  if (purge) action = function(x) {source(x, echo=TRUE); try(rm(list=ls())); gc()}
  chk = lapply(ps, function(x) try(action(x)))
  invisible(hk)
}
  

