% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data_manipulation.R
\name{data_manipulation}
\alias{data_manipulation}
\title{Data Manipulation Function}
\usage{
data_manipulation(
  data_address,
  data_path,
  keeplist,
  treatment = "treatment",
  id = "id",
  period = "period",
  outcome = "outcome",
  eligible = "eligible",
  outcomeCov_var = NA,
  cov_switchn = NA,
  model_switchn = NA,
  class_switchn = NA,
  cov_switchd = NA,
  model_switchd = NA,
  class_switchd = NA,
  first_period = NA,
  last_period = NA,
  use_weight = 0,
  use_censor = 0,
  check_missing = 0,
  cense = NA,
  pool_cense = 0,
  cov_censed = NA,
  model_censed = NA,
  class_censed = NA,
  cov_censen = NA,
  model_censen = NA,
  class_censen = NA,
  include_regime_length = 0,
  eligible_wts_0 = NA,
  eligible_wts_1 = NA,
  lag_p_nosw = 1,
  where_var = NA,
  data_dir = "~/rds/hpc-work/",
  numCores = NA,
  quiet = FALSE
)
}
\arguments{
\item{data_address}{Address for data read with bigmemory}

\item{data_path}{Path of the csv file}

\item{keeplist}{A list contains names of variables used in final model}

\item{treatment}{Name of the data column for treatment feature Defaults to treatment}

\item{id}{Name of the data column for id feature Defaults to id}

\item{period}{Name of the data column for period feature Defaults to period}

\item{outcome}{Name of the data column for outcome feature Defaults to outcome}

\item{eligible}{Indicator of whether or not an observation is eligible to be expanded about Defaults to eligible}

\item{outcomeCov_var}{A list of individual baseline variables used in final model}

\item{cov_switchn}{List of covariates to be used in logistic model for switching probabilities for numerator model}

\item{model_switchn}{List of models (functions) to use the covariates from cov_switchn}

\item{class_switchn}{Class variables used in logistic model for nominator model}

\item{cov_switchd}{List of covariates to be used in logistic model for switching probabilities for denominator model}

\item{model_switchd}{List of models (functions) to use the covariates from cov_switchd}

\item{class_switchd}{Class variables used in logistic model for denominator model}

\item{first_period}{First period value to start expanding about}

\item{last_period}{Last period value to expand about}

\item{use_weight}{Use weights in analysis. If 0 then no weights will be calculated}

\item{use_censor}{Use censoring for per-protocol analysis - censor person-times once a person-trial stops taking the initial treatment value}

\item{check_missing}{Check for missing values in final model when use_censor=1 (Not added yet!)}

\item{cense}{Censoring variable}

\item{pool_cense}{Pool the numerator and denominator models (0: split models by previous treatment Am1 = 0 and Am1 = 1 as in treatment models and 1: pool all observations together into a single numerator and denominator model) Defaults to 0}

\item{cov_censed}{List of covariates to be used in logistic model for censoring weights in denominator model}

\item{model_censed}{List of models (functions) to use the covariates from cov_censed}

\item{class_censed}{Class variables used in censoring logistic regression in denominator model}

\item{cov_censen}{List of covariates to be used in logistic model for censoring weights in numerator model}

\item{model_censen}{List of models (functions) to use the covariates from cov_censen}

\item{class_censen}{Class variables used in censoring logistic regression in numerator model}

\item{include_regime_length}{If defined as 1 a new variable (time_on_regime) is added to dataset - This variable stores the duration of time that the patient has been on the current treatment value}

\item{eligible_wts_0}{Eligibility criteria used in weights for model condition Am1 = 0}

\item{eligible_wts_1}{Eligibility criteria used in weights for model condition Am1 = 1}

\item{lag_p_nosw}{when 1 this will set the first weight to be 1 and use p_nosw_d and p_nosw_n at followup-time (t-1) for calculating the weights at followup-time t - can be set to 0 which will increase the maximum and variance of weights (Defaults to 1)}

\item{where_var}{Variables used in where conditions used in subsetting the data used in final analysis (where_case), the variables not included in the final model}

\item{data_dir}{Direction to save data}

\item{numCores}{Number of cores to be used for fitting weights (passed to \code{weight_func})}

\item{quiet}{Don't print progress messages.
data_manipulation()}
}
\description{
This function takes the data and all the variables and do the extension preprocess and weight calculation
}
