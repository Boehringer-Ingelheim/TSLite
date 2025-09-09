

#' Generate time-to-event endpoint from piecewise constant exponential distribution
#'
#' @description
#' A random number generator to be passed as \code{generator} in \code{endpoint()}.
#'
#'
#' @param n number of random numbers
#' @param risk a data frame of columns
#' \describe{
#' \item{\code{end_time}}{ End time for a constant risk in a time window. The start time of the first time window is 0.}
#' \item{\code{piecewise_risk}}{ A constant risk in a time window, which is absolute risk * relative risk, or (h0 * g) in the link.}
#' \item{\code{hazard_ratio}}{ An optional column for simulating an active arm. If absent, a column of 1s will be added. Equivalently, user can multiply piecewise_risk by hazard_ratio manually and ignore this column.}
#' }
#' @param endpoint_name name of endpoint
#'
#'
#' @returns a data frame of two columns, one for time-to-event of the endpoint,
#' one for the event indicator (0/1). Column names are \code{{endpoint_name}}
#' and \code{{endpoint_name}_event}.
#'
#' @export
#'
#' @examples
#'
#' ## See examples in ?endpoint
#'
PiecewiseConstantExponentialRNG <- function(n, risk, endpoint_name){

  TrialSimulator::PiecewiseConstantExponentialRNG(n = n,
                                                  risk = risk,
                                                  endpoint_name = endpoint_name)

}
