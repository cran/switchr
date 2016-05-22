### R code from vignette source 'switchrvign.Rnw'

###################################################
### code chunk number 1: switchrvign.Rnw:45-49
###################################################
library(switchr)
switchrBaseDir(file.path(tempdir(), ".switchr"))
switchrNoUnload(TRUE)
options(width=40, repos = c(CRAN="http://cran.rstudio.com"))


###################################################
### code chunk number 2: switchrvign.Rnw:56-57
###################################################
switchTo("vign1")


###################################################
### code chunk number 3: switchrvign.Rnw:67-73
###################################################
switchBack()
txtcon = textConnection("txt", "w", local=TRUE)
sink(txtcon, type="message")
switchTo("vign1")
sink(NULL, type="message")
print(txt,width=30)


###################################################
### code chunk number 4: switchrvign.Rnw:84-85
###################################################
switchBack()


###################################################
### code chunk number 5: switchrvign.Rnw:105-107 (eval = FALSE)
###################################################
## ### Not Run
## removeLib("mylibrary")


###################################################
### code chunk number 6: switchrvign.Rnw:126-130
###################################################
man = PkgManifest(name = "fastdigest", 
    url = "https://github.com/gmbecker/fastdigest",
    type = "git")
man


###################################################
### code chunk number 7: switchrvign.Rnw:137-140
###################################################
man2 = GithubManifest("gmbecker/fastdigest", 
     "gmbecker/RCacheSuite")
man2


###################################################
### code chunk number 8: switchrvign.Rnw:151-154
###################################################
man3 = GithubManifest(redland = "ropensci/redland-bindings/R/redland")
man



###################################################
### code chunk number 9: switchrvign.Rnw:163-165 (eval = FALSE)
###################################################
## ## NOT RUN due to peculiarities of CRAN build system wrt installed.packages()
## lman = libManifest()


###################################################
### code chunk number 10: switchrvign.Rnw:179-181 (eval = FALSE)
###################################################
## ## NOT RUN
## switchTo("vign2", seed = lman)


###################################################
### code chunk number 11: switchrvign.Rnw:198-199
###################################################
makeSeedMan()


###################################################
### code chunk number 12: switchrvign.Rnw:206-209 (eval = FALSE)
###################################################
## ## NOT RUN for vignette efficiency reasons (avoid installation)
## ## sinfo is a character string containing sessionInfo() output
## switchTo("sinfolib", seed = sinfo)


###################################################
### code chunk number 13: switchrvign.Rnw:228-230 (eval = FALSE)
###################################################
## ## NOT RUN
## install_packages("RCacheSuite", man2)


###################################################
### code chunk number 14: switchrvign.Rnw:236-241 (eval = FALSE)
###################################################
## ## NOT RUN
## install_packages("fastdigest", 
##                  versions = c(fastdigest= "0.5-0"),
##                  man = man2)
##                      


###################################################
### code chunk number 15: switchrvign.Rnw:266-268
###################################################
oldman = cranPkgVersManifest(pkg = "randomForest", vers = "4.6-5")
oldman


###################################################
### code chunk number 16: switchrvign.Rnw:277-278
###################################################
manifest_df(oldman)$url


###################################################
### code chunk number 17: switchrvign.Rnw:287-289
###################################################
oldman2 = rVersionManifest("3.1.1")
oldman2


###################################################
### code chunk number 18: switchrvign.Rnw:296-297
###################################################
head(manifest_df(oldman2)$url)


###################################################
### code chunk number 19: switchrvign.Rnw:310-312 (eval = FALSE)
###################################################
## ## NOT RUN
## switchrNoUnload(TRUE)


