#' Defining a Listener
#'
#' @description
#' \code{TSLite} relies on a listener to monitor a running trial. It determine
#' the earliest time that can trigger a milestone, and execute user-defined
#' action. Milestones need to be assigned to a listener before it can do the
#' job.
#'
#' @param silent logical. \code{TRUE} to mute messages.
#'
#' @returns a listener object
#' @export
#'
#' @examples
#' listener <- listener()
listener <- function(silent = FALSE){

  TrialSimulator::listener(silent = silent)

}
