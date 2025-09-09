#' Registering Milestones with Listener
#'
#' @description
#' Assigning one or multiple milestones to a listener so that it can trigger
#' them during a trial.
#'
#' @param listener an object returned from \code{listener()}.
#' @param ... milestone objects. Order in \code{...} matters
#' as they are scanned and triggered in that order. It is users' responsibility
#' to use reasonable order when calling this function, otherwise,
#' the result can be problematic.
#'
#' @returns \code{NULL}
#' @export
#'
addMilestones <- function(listener, ...){

  listener$add_milestones(...)
  invisible(NULL)

}
