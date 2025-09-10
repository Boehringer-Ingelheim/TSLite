#' Running a Trial
#'
#' @description
#' Running a trial for once or multiple times.
#'
#' @param controller a controller object returned from \code{controller()}.
#' @param n integer. Number of replicates of simulation. \code{n = 1} by default.
#' @param plot_event logical. Create event plot. This should be set to
#' \code{FALSE} when \code{n} is greater than 1 as it is time-consuming and
#' is unnecessary.
#' @param silent logical. \code{TRUE} if muting all messages during a
#' trial. Note that warning messages are still displayed.
#'
#' @returns \code{NULL}
#' @export
#'
run <- function(controller, n = 1, plot_event = TRUE, silent = FALSE){

  controller$run(n = n, plot_event = plot_event, silent = silent)

}
