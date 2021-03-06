% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lr_utils.R
\name{limit_weight}
\alias{limit_weight}
\title{Limit Weights Function}
\usage{
limit_weight(switch_data, lower_limit, upper_limit)
}
\arguments{
\item{switch_data}{The data.table contains weight column}

\item{lower_limit}{The user defined minimum possible weight}

\item{upper_limit}{The user defined maximum possible weight}
}
\description{
This function truncate the weights using user defined limits
}
