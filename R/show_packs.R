#' view a datatable of packages involved in book
#' @param vers character(1) bioconductor version assumed in use
#' @export
show_packs = function(vers="3.13") {
 if (vers=="3.13") DT::datatable(scpkginfo_3.13, escape=FALSE, options=list(pageLength=7))
 else stop("only supporting vers == 3.13 at this time")
}
