
#' Defining a Trial
#'
#' @description
#' Defining a trial with planned settings with some of those can be adaptively
#' altered later.
#'
#' @param name character. Name of trial.
#' @param n_patients integer. Planned number of patients could be enrolled
#' to the trial. It can be updated during a trial through adaptation functions.
#' @param duration Numeric. Planned trial duration. It can be updated during a
#' trial through adaptation functions. Note that this argument does not assume
#' an unit, make sure it is aligned with other parameters in trial/endpoint/arm
#' settings.
#' @param seed random seed. If \code{NULL}, \code{TSLite} will set seed for
#' each simulated trial automatically. Recommend always setting it to
#' \code{NULL} unless when debugging.
#' @param enroller a function returning a vector of patient enrollment time.
#' Its first argument is the number of enrolled patients. Recommend using
#' the built-in enroller \code{StaggeredRecruiter}.
#' @param dropout a function returning a vector of dropout time for
#' patients. Its first argument is the number of enrolled patients.
#' @param silent logical. \code{TRUE} to mute messages.
#' @param ... arguments of \code{enroller} and \code{dropout}.
#'
#' @returns a trial object
#' @export
#'
#' @examples
#' trial <- trial(
#'   name = '3.1415',
#'   n_patients = 650,
#'   duration = 24,
#'   seed = NULL, # recommended
#'   enroller = StaggeredRecruiter, # recommended
#'   dropout = rweibull,
#'   accrual_rate =
#'     data.frame(
#'       end_time = c(10, Inf),
#'       piecewise_rate = c(30, 40)), # argument of enroller
#'   shape = 2, # argument of dropout
#'   scale = 40, # argument of dropout
#' )
#'
#' trial
#'
trial <- function(
  name,
  n_patients,
  duration,
  seed = NULL,
  enroller,
  dropout = NULL,
  silent = FALSE,
  ...
){

  TrialSimulator::trial(
    name = name,
    n_patients = n_patients,
    duration = duration,
    description = name,
    seed = seed,
    enroller = enroller,
    dropout = dropout,
    silent = silent,
    ...
  )

}


