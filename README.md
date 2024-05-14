# osca4anvil

## Approach using a default cloud environment in AnVIL

basic ideas - note caveats at end

1) `osca4anvil::clone_osca()` will clone OSCA, OSCA.intro, OSCA.advanced, OSCA.basic, OSCA.workflows, OSCA.multisample into
current folder, with a specified branch

2) `lapply(osca4anvil::packs(), osca4anvil::get_deps, installer=function(x) BiocManager::install(x, ask=FALSE))` will install all dependencies of all these cloned packages

3) `lapply(osca4anvil::packs(), run_vignettes_code)` will `purl` each vignette (except for index.Rmd) and run all the code.

After this process, it should be possible to select a book chapter and knit or purl to get the intermediate objects, without
any installations.

Caveats: It is not clear that these processes should be done in a single session.  Specifically, part 3 may exhaust an 8 core 30 GB machine.

Part 3 is intended mainly as a check.

It may be possible to help the user with a shiny app.

The following steps work with sources from Bioconductor 3.19.
```
BiocManager::install("vjcitn/osca4anvil", ref="bioc319", ask=FALSE)
library(osca4anvil)
clone_osca(branch="RELEASE_3_19")
lapply(osca4anvil::packs(), osca4anvil::get_deps, installer=function(x) BiocManager::install(x, ask=FALSE))
```

Limited confirmation:
```
library(scRNAseq)
sce.416b <- LunSpikeInData(which="416b")
library(AnnotationHub)
ens.mm.v97 <- AnnotationHub()[["AH73905"]]
chr.loc <- mapIds(ens.mm.v97, keys=rownames(sce.416b),
keytype="GENEID", column="SEQNAME")
is.mito <- which(chr.loc=="MT")
library(scuttle)
df <- perCellQCMetrics(sce.416b, subsets=list(Mito=is.mito))
low.lib <- isOutlier(df$sum, type="lower", log=TRUE)
table(low.lib)
```
