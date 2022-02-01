# osca4anvil

## Simple approach

This Dockerfile is used to produce dockerhub: vjcitn/osca4anvil:3.14.0
```
FROM us.gcr.io/anvil-gcr-public/anvil-rstudio-bioconductor:3.14.0
RUN Rscript -e 'BiocManager::install("Bioconductor/AnVIL")'
RUN Rscript -e 'AnVIL::install(c("gert", "remotes", "DropletUtils", "BiocFileCache", "knitr", "DT"))'
RUN Rscript -e 'BiocManager::install(c("vjcitn/osca4anvil"), ask=FALSE, update=FALSE); osca4anvil::clone_osca(); lapply(osca4anvil::packs(), osca4anvil::get_deps, installer=AnVIL::install)'
simple support for OSCA in AnVIL for Bioc 3.13/3.14
```

## Approach using a default cloud environment in AnVIL

basic ideas - note caveats at end

1) `osca4anvil::clone_osca()` will clone OSCA, OSCA.intro, OSCA.advanced, OSCA.basic, OSCA.workflows, OSCA.multisample into
current folder, with a specified branch

2) `lapply(osca4anvil::packs(), osca4anvil::get_deps, installer=AnVIL::install)` will install all dependencies of all these cloned packages

3) `lapply(osca4anvil::packs(), run_vignettes_code)` will `purl` each vignette (except for index.Rmd) and run all the code.

After this process, it should be possible to select a book chapter and knit or purl to get the intermediate objects, without
any installations.

Caveats: It is not clear that these processes should be done in a single session.  Specifically, part 3 may exhaust an 8 core 30 GB machine.

Part 3 is intended mainly as a check.

It may be possible to help the user with a shiny app.
