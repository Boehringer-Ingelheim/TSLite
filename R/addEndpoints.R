

#' Adding Endpoints to an Arm
#'
#' @description
#' Add one or more endpoints to an arm. This is a wrapper function of public
#' method \code{arm$add_endpoints(...)}. See \code{?TrialSimulator::Arms} if
#' you are comfortable to work with \code{R6} class.
#'
#' @param arm an object returned from \code{arm()}.
#' @param ... one or more objects returned from \code{endpoint()}.
#'
#' @returns \code{NULL}
#' @export
#'
#' @examples
#' ## see vignette:
#' ## https://zhangh12.github.io/TrialSimulator/articles/defineArms.html
#' ## replace arm$add_endpoints(...) with addEndpoints(arm, ...) in that vignette.
#'
addEndpoints <- function(arm, ...){

  arm$add_endpoints(...)
  invisible(NULL)

}
