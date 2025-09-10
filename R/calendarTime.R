
#' Triggering a Milestone by Calendar Time
#'
#' @description
#' Define the condition to trigger trial milestone by calendar time.
#' The milestone will be triggered when a trial has been running for at least
#' the specified duration. It can be used combined with conditions specified by
#' \link[TSLite]{enrollment} and \link[TSLite]{eventNumber}. Refer to vignette
#' for examples.
#'
#' \url{https://zhangh12.github.io/TrialSimulator/articles/conditionSystem.html}
#'
#' @param time numeric. Calendar time to trigger a milestone of a trial.
#'
#' @returns an object of R6 class \code{Condition}
#' @export
#'
#' @examples
#' ## see vignette
#' ## https://zhangh12.github.io/TrialSimulator/articles/conditionSystem.html
calendarTime <- function(time){

  TrialSimulator::calendarTime(time = time)

}
