#' Defining Endpoints
#'
#' @description
#' Define one or multiple endpoints.
#'
#' @param name character vector. Name(s) of endpoint(s)
#' @param type character vector. Type(s) of endpoint(s). It supports
#' \code{"tte"} for time-to-event endpoints, and \code{"non-tte"} for
#' all other types of endpoints (e.g., continous, binary, categorical,
#' or repeated measurement. \code{TSLite} will do some verification if
#' an endpoint is of type \code{"tte"}. However, no special
#' manipulation is done for non-tte endpoints.
#' @param generator a random number generation function. Its first argument
#' must be \code{n}, number of
#' patients. It must return a data frame of \code{n} rows. It supports all
#' built-in random number generators in \code{stats}, e.g., \code{stats::rnorm},
#' \code{stats::rexp}, etc. that with \code{n} as the argument for number of
#' observations. \code{generator} could be any custom functions as long as
#' (1) its first argument is \code{n}; and (2) it returns a vector of
#' length \code{n} or a data frame of \code{n} rows. Custom random number
#' generator can return data of more than one endpoint. This is useful
#' when users need to simulate correlated endpoints. The column names of
#' returned data frame should match to \code{name} exactly, but order does not
#' matter. If an endpoint
#' is of type \code{"tte"}, the custom \code{generator} should also return
#' a column as event indicator. For example, if \code{"pfs"} is \code{"tte"},
#' then custom \code{generator} should return at least two columns
#' \code{"pfs"} and \code{"pfs_event"}. Usually \code{pfs_event} can be
#' all 1s if no censoring. Censoring can be specified later when defining
#' the \code{trial} through argument \code{dropout}. See \code{?trial}.
#' Note that if covariates, e.g., biomarker, subgroup, are needed in
#' generating and analyzing trial data, they should be defined through
#' \code{endpoint()} as well.
#' @param readout numeric vector with name to be the non-tte endpoint(s).
#' \code{readout} should be specified for every non-tte endpoint. For
#' example, \code{c(endpoint1 = 6, endpoint2 = 3)}.  If all
#' endpoints are tte, \code{readout} can be \code{NULL}.
#' @param ... optional arguments for \code{generator}.
#'
#' @returns an endpoint object. When in console, a summary report (html)
#' of the endpoints is displayed.
#'
#' @export
#'
#' @examples
#'
#' set.seed(12345)
#' ## Example 1. Generate a time-to-event endpoint.
#' ## Two columns are returned, one for time, one for event (1/0, 0 for
#  ## censoring)
#' ## A built-in RNG function is used to handle piecewise constant exponential
#' ## distribution (e.g., for delayed effect)
#' risk <- data.frame(
#'   end_time = c(1, 10, 26.0, 52.0),
#'   piecewise_risk = c(1, 1.01, 0.381, 0.150) * exp(-3.01)
#' )
#'
#' pfs <- endpoint(name = 'pfs', type='tte',
#'                 generator = TrialSimulator::PiecewiseConstantExponentialRNG,
#'                 risk = risk, endpoint_name = 'pfs')
#'
#' pfs # run in console
#'
#' ## generate exponential distributed endpoint
#' os <- endpoint(name = 'OS', type = 'tte', generator = rexp, rate = log(2)/4)
#' os # run in console
#'
#' ## Example 2. Generate two endpoints
#' ## One for continuous endpoint, one for TTE
#'
#' rng <- function(n, median){
#'   data.frame(x = rnorm(n),
#'              y = rexp(n, rate = log(2)/median),
#'              y_event = 1) # add column *_event for tte endpoint
#' }
#'
#' eps <- endpoint(name = c('y', 'x'), # order does not matter
#'                 type = c('tte', 'non-tte'), # order matches to name
#'                 readout = c(x = 1), # readout for non-tte endpoint
#'                 generator = rng,
#'                 median = 10) # any arguments for generator
#' eps # run in console
#'
#' ## Example 3. Generate correlated PFS and OS
#'
#' pfs_and_os <- endpoint(name = c('PFS', 'os'),
#'                        type = c('tte', 'tte'), # order matches to name
#'                        generator = TrialSimulator::CorrelatedPfsAndOs3,
#'                        h01 = 0.06, h02 = 0.30, h12 = 0.30,
#'                        os_name = 'os', pfs_name = 'PFS') # match to name (case sensitive)
#'
#' pfs_and_os # run in console
#'
endpoint <- function(
    name,
    type = c('tte', 'non-tte'),
    readout = NULL,
    generator,
    ...
){

  TrialSimulator::endpoint(
    name = name,
    type = type,
    readout = readout,
    generator = generator,
    ...
  )

}
