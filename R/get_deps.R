#' use an installer to obtain all dependencies of an OSCA.* book component
#' @importFrom remotes local_package_deps
#' @param x path to an OSCA.* package
#' @param installer a function link BiocManager::install (default)
#' @note Uses setwd to run in the base folder of the package
#' @export
get_deps = function(x, installer=BiocManager::install) {
  owd = getwd()
  on.exit(setwd(owd))
  setwd(x)
  installer(remotes::local_package_deps(dependencies=TRUE))
}

