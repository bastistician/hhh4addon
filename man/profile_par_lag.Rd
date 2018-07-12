% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hhh4_new.R
\name{profile_par_lag}
\alias{profile_par_lag}
\title{Estimating the lag decay parameter of an \code{hhh4_lag} model using profile likelihood}
\usage{
profile_par_lag(stsObj, control, check.analyticals = FALSE, range_par,
  use_update = TRUE)
}
\arguments{
\item{stsObj, control, check.analyticals}{As in \code{surveillance::hhh4}, but \code{control}
allows for some additional arguments}
}
\value{
A list with two elements: \code{best_mod} is the \code{hhh4lag} fit for the best value
of \code{par_lag}; \code{cov} is an extended covariance matrix for the regression parameters
which also includes par_lag. It is obtained via numerical differentiation using
\code{numDeriv:::hessian}

In this modified version of \code{surveillance::hhh4}, distributed lags can be specified by
additional elements in the \code{ar} and \code{ne} parts of \code{control}:
\itemize{
  \item{\code{funct_lag}}{ Function to calculate the a matrix of distributed lags from a matrix of first lags.
   Currently only geometric lags (\code{hhh4addon:::geometric_lag}) are available and set as default, see Details.
  The function has to take the following arguments:
  \itemize{
  \item{\code{lag1}}{ Matrix containing the first lags which would be used in a standard \code{hhh4} model.}
  \item{\code{par_lag}}{ A scalar parameter to steer \eqn{u_q}. For the geometric lags this is the un-normalized weight of the first lag.}
  \item{\code{max_lag}}{ Maximum number of lags.}
  \item{\code{sum_up}}{ Specifies how detailed the output of the function is - only for internal use.}
  }}
  \item{\code{max_lag}}{ Specification of the \code{max_lag} argument passed to funct_lag} to compute the lags.
}
Unlike in \code{hhh4_lag} the par_lag argument for \code{funct_lag} is not specified directly
by the user; instead it is estimated from the data using profile likelihood.
}
\description{
Wrapper around \code{hhh4_lag} to allow for profile likelihood estimation of the scalar parameter
governing the lag structure. \code{hhh4_lag} can fit models with fixed lag decay parameter; \code{fit_par_lag} loops
around it and tries a set of possible parameters provided in the argument \code{range_par}. NOTE: this will
soon replace \code{fit_par_lag} which does the same, but using a grid over \code{par_lag} instead of
\code{optim}.
}