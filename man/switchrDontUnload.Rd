% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/flushSession.R
\name{switchrDontUnload}
\alias{switchrDontUnload}
\title{Get or set packages to not unload when flushing the system}
\usage{
switchrDontUnload(value, add = TRUE)
}
\arguments{
\item{value}{The packages to not unload when switching libraries.}

\item{add}{Should \code{value} be added to the existing list?}
}
\value{
the set of packages switchr will not attempt to unload which changing
contexts (after setting it, if \code{value} is missing)
}
\description{
Get or set packages which should NOT be unloaded when flushing the system,
e.g., when switching between libraries.
}
\note{
By default switchr will not attempt to unload any base packages,
itself, or any of its dependencies. Attempting to unload any of these
packages (e.g. \code{add=FALSE}) will result in undefined behavior and
is not recommended.
}
