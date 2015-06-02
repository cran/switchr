library(switchr)
x = defaultRepos()
biocpkgs = c(available.packages(contrib.url(x[1]))[,"Package"], "SummarizedExperiment")


man = PkgManifest(name = biocpkgs, url = makeBiocSVNURL(biocpkgs), type = "svn")



repo = lazyRepo("rtracklayer", man, dir = "~/localcheckoutest", verbose=TRUE)


