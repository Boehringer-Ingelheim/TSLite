#' Removing Arms from a Trial
#'
#' @description
#' remove arms from a trial. Planned but unenrolled patients will be
#' randomized to remaining arms. This function may be used with futility
#' analysis, dose selection, enrichment design (sub-population) or
#' interim analysis (early stop for efficacy), etc.
#'
#' @param trial a trial object returned from \code{trial()}.
#' @param arms_name character vector. Name of arms to be removed from a trial
#'
#' @returns \code{NULL}
#' @export
#'
removeArms <- function(trial, arms_name){

  trial$remove_arms(arms_name = arms_name)

}
