#' Defining Milestones of Trial
#'
#' @description
#' Defining a milestone of a trial. This includes the condition to trigger it
#' and the action to be taken automatically. Refer to vignettes for more details.
#'
#' \url{https://zhangh12.github.io/TrialSimulator/articles/conditionSystem.html}
#'
#' \url{https://zhangh12.github.io/TrialSimulator/articles/actionFunctions.html}
#'
#' @param name character. Name of milestone.
#' @param when condition to check if this milestone should be
#' triggered.
#' @param action function to execute when the milestone is triggered.
#' If no action to be executed but simply need to record triggering time and
#' number of observations/events at the triggering time, \code{action} can be
#' its default value, a built-in function \code{doNothing}.
#'
#' @returns a milestone object
#' @export
#'
#' @examples
#' ## See the two vignettes in description.
#'
milestone <- function(name, when, action = doNothing){
  TrialSimulator::milestone(
    name = name,
    when = when,
    action = action
  )
}
