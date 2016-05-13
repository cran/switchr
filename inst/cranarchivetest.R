library(switchr)

removeLib("rcpparmtest")
switchTo("rcpparmtest")
man = PkgManifest(name="RcppArmadillo", type="cran")
sman = SessionManifest(man, c(RcppArmadillo="0.6.100.0.0"))

install_packages(sman)


                       
