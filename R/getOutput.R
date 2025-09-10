#' Retrieving Output of Simulations
#'
#' @description
#' Returning a data frame of all current outputs saved by calling \code{save},
#' or intermediate results saved by \code{TSLite} automatically, including
#' triggering time of milestones, and number of observations/events of endpoints
#' at milestones. Note that this data frame is updated dynamically during a
#' trial, so it can return different values depending on when you call it.
#'
#' @param controller a controller object returned from \code{controller()}.
#' @param cols vector of character. Columns to be returned. If \code{NULL},
#' all existing columns are returned.
#' @param simplify logical. Return value rather than a data frame of one
#' column when \code{length(cols) == 1} and \code{simplify == TRUE}.
#'
#' @returns a data frame or a scalar depending on length of \code{cols} and
#' \code{simplify}.
#'
#' @export
#'
getOutput <- function(controller, cols = NULL, simplify = TRUE){

  controller$get_output(cols = cols, simplify = simplify)

}
