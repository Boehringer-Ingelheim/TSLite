#' A Default Action Function
#'
#' @description
#' This is an action function to be used when users want to do nothing at a
#' milestone.
#'
#' When the listener is monitoring a trial and determining the
#' time to trigger a milestone, data is automatically locked with other necessary
#' data manipulation being executed. If the users have no intent to modify the
#' trial adaptively at the milestone, e.g., adding (\code{addArms()}) or
#' removing (\code{removeArms()}) arm(s),
#' changing sampling ratio(s) (\code{updateSampleRatio()}),
#' modifying trial duration (\code{setDuration()}),
#' carrying out statistical testing,
#' or saving intermediate results (\code{save()}, etc.), then this function
#' can be used to set the argument \code{action} when creating a new milestone.
#' Note that the triggering time and number of observations/events are
#' still recorded in output automatically even if this action is used.
#'
#' @param trial a trial object returned from \code{trial()}.
#' @param milestone_name character. Name of milestone being triggered. It is
#' the \code{name} argument when calling \code{trial()}.
#'
#' @returns \code{NULL}
#' @export
#'
doNothing <- function(trial, milestone_name){

  TrialSimulator::doNothing(trial, milestone_name)

}
