### R code from vignette source 'switchrvign.Rnw'

###################################################
### code chunk number 1: switchrvign.Rnw:45-48
###################################################
library(switchr)
switchrBaseDir(file.path(tempdir(), ".switchr"))
options(width=40, repos = c(CRAN="http://cran.rstudio.com"))


###################################################
### code chunk number 2: switchrvign.Rnw:55-56
###################################################
switchTo("vign1")


###################################################
### code chunk number 3: switchrvign.Rnw:66-72
###################################################
switchBack()
txtcon = textConnection("txt", "w", local=TRUE)
sink(txtcon, type="message")
switchTo("vign1")
sink(NULL, type="message")
print(txt,width=30)


###################################################
### code chunk number 4: switchrvign.Rnw:83-84
###################################################
switchBack()


###################################################
### code chunk number 5: switchrvign.Rnw:120-124
###################################################
man = PkgManifest(name = "fastdigest", 
    url = "https://github.com/gmbecker/fastdigest",
    type = "git")
man


###################################################
### code chunk number 6: switchrvign.Rnw:131-134
###################################################
man2 = GithubManifest("gmbecker/fastdigest", 
     "gmbecker/RCacheSuite")
man2


###################################################
### code chunk number 7: switchrvign.Rnw:145-148
###################################################
man3 = GithubManifest(redland = "ropensci/redland-bindings/R/redland")
man



###################################################
### code chunk number 8: switchrvign.Rnw:157-159
###################################################
lman = libManifest()
lman


###################################################
### code chunk number 9: switchrvign.Rnw:173-175 (eval = FALSE)
###################################################
## ## NOT RUN
## switchTo("vign2", seed = lman)


###################################################
### code chunk number 10: switchrvign.Rnw:193-195 (eval = FALSE)
###################################################
## ## NOT RUN
## install_packages("RCacheSuite", man2)


###################################################
### code chunk number 11: switchrvign.Rnw:201-206 (eval = FALSE)
###################################################
## ## NOT RUN
## install_packages("fastdigest", 
##                  versions = c(fastdigest= "0.5-0"),
##                  man = man2)
##                      


###################################################
### code chunk number 12: switchrvign.Rnw:231-233
###################################################
oldman = cranPkgVersManifest(pkg = "randomForest", vers = "4.6-5")
oldman


###################################################
### code chunk number 13: switchrvign.Rnw:242-243
###################################################
manifest_df(oldman)$url


###################################################
### code chunk number 14: switchrvign.Rnw:252-254
###################################################
oldman2 = rVersionManifest("3.1.1")
oldman2


###################################################
### code chunk number 15: switchrvign.Rnw:261-262
###################################################
head(manifest_df(oldman2)$url)


###################################################
### code chunk number 16: switchrvign.Rnw:277-281 (eval = FALSE)
###################################################
## ## NOT RUN
## switchrDontUnload(c("knitr", "evaluate", "digest", "formatR", "highr", 
##                     "markdown", "stringr"))
## 


