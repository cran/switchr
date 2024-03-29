% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/findCtx.R
\name{switchrBaseDir}
\alias{switchrBaseDir}
\title{Get or set the base directory for switchr libraries}
\usage{
switchrBaseDir(value)
}
\arguments{
\item{value}{A new value for the base directory}
}
\value{
The current base directory for switchr to create context-specific
library paths under (\emph{after} setting it if \code{value} is not missing).
}
\description{
Get or set the base directory for switchr libraries
}
\details{
If \code{value} is missing, the current base directory
is returned. Otherwise the \code{value} is set as the default directory
and returned.
}
