

#' Generate Correlated PFS and OS Using the Three-States Model
#'
#' @param n integer. Number of observations.
#' @param h01 constant transition hazard from state "initial" to state "progression".
#' @param h02 constant transition hazard from state "initial" to state "death".
#' @param h12 constant transition hazard from state "progression" to state "death".
#' @param pfs_name column name of PFS in returned data frame. It must be
#' consistent with the \code{name} argument in the function \code{endpoint()}.
#' @param os_name column name of OS in returned data frame. It must be
#' consistent with the \code{name} argument in the function \code{endpoint()}.
#'
#' @returns
#' A data frame of four columns, including PFS, OS and their event indicators.
#' The event indicators are all 1s.
#'
#' @export
#'
#' @examples
#'
#' ## See examples in ?endpoint
#'
CorrelatedPfsAndOs3 <- function(
    n,
    h01,
    h02,
    h12,
    pfs_name = 'pfs',
    os_name = 'os'
){

  TrialSimulator::CorrelatedPfsAndOs3(n = n,
                                      h01 = h01,
                                      h02 = h02,
                                      h12 = h12,
                                      pfs_name = pfs_name,
                                      os_name = os_name)

}
