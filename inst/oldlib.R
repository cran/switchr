txt = "R version 3.0.2 (2013-09-25)
Platform: x86_64-unknown-linux-gnu (64-bit)

locale:
 [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
 [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
 [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
 [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
 [9] LC_ADDRESS=C               LC_TELEPHONE=C            
[11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       

attached base packages:
[1] tools     parallel  methods   stats     graphics  grDevices utils    
[8] datasets  base     

other attached packages:
 [1] HTSeqGenie.gne_3.12.1 JUNKIE_0.8.3          rhdf5_2.6.0        
 [4] rjson_0.2.13          HTSeqGenie_3.12.1     gmapR_1.4.2        
 [7] rtracklayer_1.22.0    Cairo_1.5-2           hwriter_1.3        
[10] BiocParallel_0.4.1    ShortRead_1.20.0      Rsamtools_1.14.1   
[13] lattice_0.20-24       Biostrings_2.30.1     GenomicRanges_1.14.3
[16] XVector_0.2.0         IRanges_1.20.5        BiocGenerics_0.8.0 
[19] getopt_1.20.0        

loaded via a namespace (and not attached):
 [1] AnnotationDbi_1.24.0    BatchJobs_1.1-1135      BBmisc_1.4     
 [4] Biobase_2.22.0          biomaRt_2.18.0          bitops_1.0-6   
 [7] brew_1.0-6              BSgenome_1.30.0         codetools_0.2-8
[10] DBI_0.2-7               digest_0.6.3            fail_1.2       
[13] foreach_1.4.1           GenomicFeatures_1.14.2  grid_3.0.2     
[16] iterators_1.0.6         latticeExtra_0.6-26     Matrix_1.1-0   
[19] plyr_1.8                RColorBrewer_1.0-5      RCurl_1.95-4.1 
[22] RSQLite_0.11.4          sendmailR_1.1-2         stats4_3.0.2   
[25] VariantAnnotation_1.8.5 VariantTools_1.4.5      XML_3.98-1.1   
[28] zlibbioc_1.8.0
"

.libPaths("~/lib3.0.2")
 library(devtools)
## install_github("gmbecker/switchr")
library(switchr)
thing = strsplit(txt, "\n")[[1]]

prsed = parseSessionInfoString(thing)
vdf = rbind(prsed@attached, prsed@loaded)
names(vdf) = c("name", "version")


pubpkgs = vdf$name[!vdf$name %in% c("JUNKIE", "HTSeqGenie.gne", "HTSeqGenie")]
library(BiocInstaller)
biocpkgs = available.packages(contrib.url(biocinstallRepos()[1]))[,"Package"]

inbioc = pubpkgs %in% biocpkgs
srctype = sapply(inbioc, function(x) if(x) "bioc" else "cran")

## manifest = PkgManifest(name = c("JUNKIE", "HTSeqGenie.gne", "HTS),
##                        url= c("http://resscm/bioinfo/projects/R/trunk/JUNKIE/",
##                               "http://resscm/bioinfo/projects/NGS_pipeline/HTSeqGenie.gne/releases/HTSeqGenie.gne_3.12.1.tar.gz"),
##                        type = c("svn", "tarball"), branch = "trunk")


manifest = PkgManifest(name = "JUNKIE",
                       url= "http://resscm/bioinfo/projects/R/trunk/JUNKIE/",
                              
                       type = "svn", branch = "trunk")



man = PkgManifest(name = pubpkgs, type = srctype, branch = "trunk")

vdf2 = vdf[!grepl("HTSeqGenie", vdf$name),]
sman = SessionManifest(c(manifest, man), vdf2)

res = lazyRepo(sman, scm_auths = list(bioconductor = c("readonly", "readonly"), resscm = c("resgran", "resgran")), dir = "~/repoFor3.0.2")
