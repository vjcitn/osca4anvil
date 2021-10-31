
#' ensure that sce.pbmc can be created
#' @importFrom DropletUtils read10xCounts
#' @importFrom BiocFileCache BiocFileCache bfcrpath
#' @param curcache defaults to BiocFileCache::BiocFileCache(ask=FALSE)
#' @export
make_pbmc = function(curcache=BiocFileCache::BiocFileCache(ask=FALSE)) {
  exprs.data <- BiocFileCache::bfcrpath(curcache, file.path(
    "http://cf.10xgenomics.com/samples/cell-vdj/3.1.0",
    "vdj_v1_hs_pbmc3",
    "vdj_v1_hs_pbmc3_filtered_feature_bc_matrix.tar.gz"))
  untar(exprs.data, exdir=tempdir())
  DropletUtils::read10xCounts(file.path(tempdir(), "filtered_feature_bc_matrix"))
}
