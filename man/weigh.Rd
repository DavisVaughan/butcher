% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/weigh.R
\name{weigh}
\alias{weigh}
\title{Weigh the object.}
\usage{
weigh(x, threshold = 0, units = "MB", ...)
}
\arguments{
\item{x}{A model object.}

\item{threshold}{The minimum threshold desired for model component
size to display.}

\item{units}{The units in which to display the size of each component
within the model object of interest. Defaults to \code{MB}. Other
options include \code{KB} and \code{GB}.}

\item{...}{Any additional arguments for weighing.}
}
\value{
Tibble with weights of object components in decreasing magnitude.
}
\description{
Evaluate the size of each element contained in a model object.
}
\examples{
simulate_x <- matrix(runif(1e+6), ncol = 2)
simulate_y <- runif(dim(simulate_x)[1])
lm_out <- lm(simulate_y ~ simulate_x)
weigh(lm_out)
}
