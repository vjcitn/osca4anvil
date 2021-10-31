
#' base names of packages
#' @return character() vector 
#' @examples
#' packs()
#' @export
packs = function() c("OSCA", "OSCA.basic", "OSCA.workflows", 
   "OSCA.intro", "OSCA.multisample", "OSCA.advanced")

#' URL builder for github repos
#' @param x basename of package
#' @return character(1) URL
#' @export
make_url = function(x) paste("https://github.com/OSCA-source/", x, ".git", sep="")

#' use gert to clone all packages
#' @importFrom gert git_clone
#' @note runs `gert::git_clone` with path set to value of `getwd()`
#' @return invisibly the result of `git_clones` in a list
#' @export
clone_osca = function() {
  jnk = lapply(packs(), function(x) gert::git_clone( make_url(x), path=x ) )
  invisible(unlist(jnk))
}


