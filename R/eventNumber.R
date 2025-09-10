#' Triggering Condition by Number of Events or Observations of an Endpoint
#'
#' @description
#' Define a condition to trigger trial milestone by the number of events of a
#' time-to-event endpoint or the number of non-missing observations of a
#' non-time-to-event endpoint. The milestone will be triggered when a trial has
#' observed at least the specified number of endpoint events (or non-missing
#' observations). It can be used combined with
#' conditions specified by \link[TSLite]{calendarTime} and
#' \link[TSLite]{enrollment}. Refer to vignette
#' for examples.
#'
#' \url{https://zhangh12.github.io/TrialSimulator/articles/conditionSystem.html}
#'
#' Number of events for a time-to-event endpoint can vary at different
#' milestones as more patients are randomized into a trial, or more events
#' onset over time.
#'
#' Number of non-missing observations for a non-time-to-event endpoint can vary
#' at different milestones as more patients are randomized into a trial, or more
#' patients have been treated until their readout time (thus, \code{NA} turns
#' to a value).
#'
#' @param endpoint character. Name of an endpoint.
#' @param n integer. Targeted number of events or observations.
#' @param arms vector of character. Name of arms on which the number of events
#' is counted. If \code{NULL}, use all arms that are not yet removed from the
#' trial by the time of calculation.
#' @param ... subset conditions compatible with \code{dplyr::filter}. Number
#' of events will be counted on subset of trial data only.
#'
#' @returns an object of R6 class \code{Condition}
#' @export
#'
#' @examples
#' ## see vignette
#' ## https://zhangh12.github.io/TrialSimulator/articles/conditionSystem.html
eventNumber <- function(endpoint, n, ..., arms = NULL){

  TrialSimulator::eventNumber(endpoint = endpoint,
                              n = n, ...,
                              arms = arms)

}
