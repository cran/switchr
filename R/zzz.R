.domessage = function(msg) message(msg)
.onLoad = function(libname, pkgname) {
    ns = asNamespace(pkgname)

    delayedAssign("BiocRelease", tryCatch(BiocVers(getBiocReleaseVr()),
                                          error = function(x) {
                                       NULL
                                 }),
                  eval.env = ns,
                  assign.env = ns)
    delayedAssign("develVers",  getBiocDevelVr(),
                  assign.env = ns)
    
    delayedAssign("BiocDevel", tryCatch(BiocVers(getBiocDevelVr()),
                                        error = function(x) {
                                   NULL
                               }
                                   ), eval.env = ns,
                  assign.env = ns)
    delayedAssign("getBiocYaml", doyamlsetup(),
                  assign.env = ns)

    delayedAssign("defaultBiocRepos", getBiocReposFromRVers(), 
                  assign.env = ns)

    
    namespaceExport(ns, c("BiocRelease", "BiocDevel"))
}


