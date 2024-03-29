% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/accessors.R
\docType{methods}
\name{archive_timing}
\alias{archive_timing}
\alias{archive_timing,SwitchrParam-method}
\alias{archive_timing,SwitchrParam}
\alias{archive_timing<-}
\alias{archive_timing<-,SwitchrParam-method}
\alias{archive_timing<-,SwitchrParam}
\title{archive_timing}
\usage{
archive_timing(x)

\S4method{archive_timing}{SwitchrParam}(x)

archive_timing(x) <- value

\S4method{archive_timing}{SwitchrParam}(x) <- value
}
\arguments{
\item{x}{A SwitchrParam object}

\item{value}{The new number of seconds to wait}
}
\value{
When getting, the number of seconds to wait,
when setting, a new, updated SwitchrParam object.
}
\description{
Get or set the number of seconds to wait after trying to
retrieve a file from the CRAN Archive.

This is intended to stop intermittent install failures
due to failing to retrieve files that *are* in the
archive but are not downloading properly when a larger
number of packages is being retrieved.
}
