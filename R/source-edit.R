#' Build the chunk map
#'
#' Build a map between comment labels and their line number locations.
#'
#' @param path `character` path to the source file
#' @param label `character` comment label of code chunk of interest
#'
#' @returns line number for chunk "label"
build_chunk_map <- function(path, label) {
  stopifnot(file.exists(path))
  lines <- readLines(path, warn = FALSE)

  hit <- grepl("^##\\s*----\\s*[^\\s]+\\s*$", lines, perl = TRUE)
  idx <- which(hit)
  if (length(idx) == 0L) return(data.frame(label=character(), file=character(), start_line=integer(), end_line=integer()))

  labs <- sub("^##\\s*----\\s*([^\\s]+)\\s*$", "\\1", lines[idx], perl = TRUE)

  starts <- pmin(idx + 1L, length(lines))
  ends <- c(idx[-1] - 1L, length(lines))

  keep <- ends >= starts
  (data.frame(
    lab = labs[keep],
    file = normalizePath(path),
    start_line = starts[keep],
    end_line = ends[keep],
    stringsAsFactors = FALSE
  ) %>% dplyr::filter(.data$lab == label))$start_line
}

#' Jump to edit source
#'
#' Open the source code at appropriate location to edit in RStudio.
#'
#' @param label `character` comment label of code chunk of interest
#' @param script `character` the file to be opened
#'
#' @export
edit <- function(label, script){
  rstudioapi::navigateToFile(script,
                             line = build_chunk_map(script, label),
                             column = 1)
  invisible(NULL)
}
