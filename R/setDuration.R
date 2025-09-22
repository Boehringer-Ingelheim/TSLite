#' Set Duration of a Trial
#'
#' @description
#' set trial duration in an adaptive designed trial. All patients enrolled
#' before resetting the duration are truncated (for non-tte endpoints) or
#' censored (for tte endpoints) at the original duration. Remaining patients
#' are re-randomized. New duration must be longer than the old one. This
#' function is usually called in an action function.
#'
#' @param trial a trial object returned from \code{trial()}.
#' @param duration new duration of a trial. It must be longer than the current
#' duration.
#'
#' @returns \code{NULL}
#' @export
#'
setDuration <- function(trial, duration){

  trial$set_duration(duration = duration)

}
