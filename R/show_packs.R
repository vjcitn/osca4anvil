#' view a datatable of packages involved in book
#' @importFrom DT datatable
#' @param vers character(1) bioconductor version assumed in use
#' @export
show_packs = function(vers="3.13") {
 if (vers=="3.13") DT::datatable(osca4anvil::scpkginfo_3.13[,c("pkg_link", "Description")], escape=FALSE, options=list(pageLength=7))
 else stop("only supporting vers == 3.13 at this time")
}
