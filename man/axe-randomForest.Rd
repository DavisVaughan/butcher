% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/randomForest.R
\name{axe-randomForest}
\alias{axe-randomForest}
\alias{axe_call.randomForest}
\alias{axe_ctrl.randomForest}
\alias{axe_env.randomForest}
\title{Axing an randomForest.}
\usage{
\method{axe_call}{randomForest}(x, verbose = FALSE, ...)

\method{axe_ctrl}{randomForest}(x, verbose = FALSE, ...)

\method{axe_env}{randomForest}(x, verbose = FALSE, ...)
}
\arguments{
\item{x}{A model object.}

\item{verbose}{Print information each time an axe method is executed.
Notes how much memory is released and what functions are
disabled. Default is \code{FALSE}.}

\item{...}{Any additional arguments related to axing.}
}
\value{
Axed randomForest object.
}
\description{
randomForest objects are created from the \code{randomForest}
package, which is used to train random forests based on Breiman's
2001 work. The package supports ensembles of classification and
regression trees.
}
\examples{
# Load libraries
suppressWarnings(suppressMessages(library(parsnip)))
suppressWarnings(suppressMessages(library(rsample)))
suppressWarnings(suppressMessages(library(rpart)))
suppressWarnings(suppressMessages(library(randomForest)))

# Load data
set.seed(1234)
split <- initial_split(kyphosis, props = 9/10)
spine_train <- training(split)

# Create model and fit
randomForest_fit <- rand_forest(mode = "classification",
                                mtry = 2,
                                trees = 2,
                                min_n = 3) \%>\%
  set_engine("randomForest") \%>\%
  fit_xy(x = spine_train[,2:4], y = spine_train$Kyphosis)

out <- butcher(randomForest_fit, verbose = TRUE)

# Another randomForest object
wrapped_rf <- function() {
  some_junk_in_environment <- runif(1e6)
  randomForest_fit <- randomForest(mpg ~ ., data = mtcars)
  return(randomForest_fit)
}

# Remove junk
cleaned_rf <- axe_env(wrapped_rf(), verbose = TRUE)

# Check size
lobstr::obj_size(cleaned_rf)

}
