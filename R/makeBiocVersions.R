
##lifted from biocLite.R
biocrepos <- NULL

##' @title biocReposForVers
##'
##' @description Generate the URLs of the repositories associated with
##' a specific Bioconductor release
##'
##' @param version The Bioconductor release to generate URLs for.
##' @note This function will only work if some version of Bioconductor (>2.9)
##' was installed when switchr was installed. It will return NULL otherwise.
##' @return the repositories associated with the specified Bioconductor version.
##' @export
biocReposForVers = function(version) {
    bioc = getBiocRepos(trim = FALSE)
    if(is.null(bioc))
        return(NULL)
    else
        ret = gsub("(.*)/[[:digit:]\\.]+/(.*)", sprintf("\\1/%s/\\2", version), bioc)
    ret = trim_potential_bioc_repos(ret)
    ret
}



##' @title BiocVers
##' @description A constructor for creating a RepoSubset object for a
##' specified release of Bioconductor, which includes only the
##' BiocInstaller package.
##' @param version The version of Bioconductor
##' @param name The default name for switchr libraries created with this object
##' @param repos The urls of the Bioconductor repositories. these will be
##' modified automatically to match the specified version
##' @return A RepoSubset object for the specified release of Bioconductor,
##' which contains only the BiocInstaller or BiocManager package, as
##' appropriate for that version.
##' @export
BiocVers = function(version = getBiocReleaseVr(),
                    name = paste("BioC", version, sep="_"),
                    repos  = biocReposForVers(version)) {

    if(is.null(repos))
        stop("I don't know where the bioconductor repositories are. Unable to proceed")
    if(numeric_version(version) < "2.9")
        stop("Bioconductor versions earlier than 2.9 did not have a BiocInstaller package. Use switchTo(biocReposForVers(<version>), packages = <packages you want>, name = <name you want>) for this.")
    if(numeric_version(version) < "3.7")
        RepoSubset(repos, pkgs = "BiocInstaller", default_name = name)
    else
        RepoSubset(repos, pkgs = "BiocManager", default_name = name)
}

##' @title  BiocRelease
##'
##' @description An object representing the current Bioc release. Can be passed to switchTo.
##' @rdname BiocRelease
##' @aliases BiocRelease
BiocRelease = NULL

##' @title BiocDevel
##'
##' @description An object representing the current Bioc devel version. Can be passed to switchTo.
##' @rdname BiocDevel
##' @aliases BiocDevel
BiocDevel = NULL
