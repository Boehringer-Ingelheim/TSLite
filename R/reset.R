#' Reset a Controller
#'
#' @description
#' Reset the trial and listener registered with the controller before calling
#' \code{run(controller, n = ...)} again.
#'
#' @param controller a controller object returned from \code{controller()}.
#'
#' @returns \code{NULL}
#' @export
#'
#' @examples
#'
#' ## run(controller, n =1)
#' ## reset(controller)
#' ## run(controller, n = 10)
reset <- function(controller){

  controller$reset()

}
