#' build HTML anchor for CRAN package pages
#' @param x character(1) package name
#' @export
wr_cran = function(x) sprintf("<a href='https://CRAN.R-project.org/package=%s'>%s</a>", x, x)

#' build HTML anchor for Bioconductor package pages
#' @param x character(1) package name
#' @param vers character(1) tag for a version, defaults to '3.13'
#' @export
wr_bioc = function(x, vers="3.13") sprintf("<a href='https://bioconductor.org/packages/%s/bioc/html/%s.html'>%s</a>", vers, x, x)

#' build HTML anchor for Bioconductor experiment package pages
#' @param x character(1) package name
#' @param vers character(1) tag for a version, defaults to '3.13'
#' @export
wr_bioc_expt = function(x, vers="3.13") sprintf("<a href='https://bioconductor.org/packages/%s/data/experiment/html/%s.html'>%s</a>", vers, x, x)
