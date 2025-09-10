#' Triggering a Milestone by Number of Randomized Patients
#'
#' @description
#' Define the condition to trigger trial milestone by the number of randomized
#' patients. The milestone will be trigger when a trial has enrolled
#' at least the specified number of patients. It can be used combined with
#' conditions specified by \link[TSLite]{calendarTime} and
#' \link[TSLite]{eventNumber}. Refer to vignette
#' for examples.
#'
#' \url{https://zhangh12.github.io/TrialSimulator/articles/conditionSystem.html}
#'
#' @param n integer. Number of randomized patients.
#' @param arms vector of character. Name of arms on which the number of patients
#' is counted. If \code{NULL}, use all arms that are not yet removed from the
#' trial by the time of calculation.
#' @param ... subset conditions compatible with \code{dplyr::filter}. Number
#' of randomized patients will be counted on subset of trial data only.
#'
#' @returns an object of R6 class \code{Condition}
#' @export
#'
#' @examples
#' ## see vignette
#' ## https://zhangh12.github.io/TrialSimulator/articles/conditionSystem.html
enrollment <- function(n, ..., arms = NULL){

  TrialSimulator::enrollment(n = n, ..., arms = arms)

}
