#' Remove Arms from a Trial
#'
#' @param trial a trial object returned from \code{trial()}.
#' @param milestone_name character. Milestone name of which the locked
#' data to be extracted.
#'
#' @returns \code{NULL}
#' @export
#'
getLockedData <- function(trial, milestone_name){

  trial$get_locked_data(milestone_name = milestone_name)

}
