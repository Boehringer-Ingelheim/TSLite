make_env <- function(scn) {
  e <- new.env(parent = baseenv())

  if (is.data.frame(scn)) {
    stopifnot(nrow(scn) == 1L)
    for (nm in names(scn)) {
      col <- scn[[nm]]
      val <- if (is.list(col)) col[[1]] else col[1]
      assign(nm, val, envir = e)
    }
  } else if (is.list(scn)) {
    for (nm in names(scn)) assign(nm, scn[[nm]], envir = e)
  } else {
    stop("scenario must be a one-row data.frame or a list.")
  }
  e
}

to_literal <- function(x) {
  if (!(is.atomic(x) && is.vector(x))) {
    stop("SCN value must be an atomic vector (including length-1 scalar).")
  }
  if (length(x) == 1L) {
    x1 <- unname(x)[1]
    txt <- utils::capture.output(dput(x1))
    return(paste(txt, collapse = ""))
  } else {
    txt <- utils::capture.output(dput(x))
    return(paste(txt, collapse = ""))
  }
}

#' Fill symbol values
#'
#' Fill symbol values from the scenario tibble. `simulate()` function from
#' each template has labeled chunks. To run this chunk in .qmd files one needs
#' values. These values are supplied from scenario tibble. Ensure that all
#' chunks mentioned in `simulate()` function are used, and chunk used in .qmd
#' file exist in `simulate()` funciton.
#'
#' @param path `character` path to R script containing `simulate()` function source
#' @param scenario `tibble` one scenario per row tibble
#' @param out_path `character` path for temporary output files
#' @param keep_roxygen_comments `logical` whether to keep roxygen comments
#'
#' @export
fill <- function(path,
                 scenario,
                 out_path = sub("\\.R$", "_filled.R", path),
                 keep_roxygen_comments = FALSE) {

  stopifnot(file.exists(path))





  normalize_with_map <- function(s) {
    keep <- which(!grepl("[ \t]", strsplit(s, "")[[1]]))
    norm <- paste0(strsplit(s, "")[[1]][keep], collapse = "")
    list(norm = norm, map = keep)
  }

  out <- readLines(path, warn = FALSE)
  scn_env <- make_env(scenario)

  pat_scn <- "#\\s*SCN:\\s*(.+?)\\s*$"
  for (i in seq_along(lines)) {
    m <- regexpr(pat_scn, lines[i], perl = TRUE)
    if (m[1] == -1) next

    scn_text <- sub(".*#\\s*SCN:\\s*(.+?)\\s*$", "\\1", lines[i], perl = TRUE)

    eq_pos <- regexpr("=", scn_text, fixed = TRUE)
    if (eq_pos[1] == -1) stop(sprintf("Line %d: SCN missing '=': %s", i, scn_text))

    lhs_txt <- trimws(substr(scn_text, 1L, eq_pos[1] - 1L))
    rhs_txt <- trimws(substr(scn_text, eq_pos[1] + 1L, nchar(scn_text)))

    val <- try(eval(parse(text = rhs_txt), envir = scn_env), silent = TRUE)
    if (inherits(val, "try-error")) {
      stop(sprintf("Line %d: evaluating expr failed: %s", i, rhs_txt))
    }
    lit <- to_literal(val)

    left_end <- m[1] - 1L
    left <- if (left_end >= 1L) substr(lines[i], 1L, left_end) else ""

    target_raw <- paste0(lhs_txt, "=", rhs_txt)
    A <- normalize_with_map(left)
    B <- gsub("[ \t]", "", target_raw)

    hit <- regexpr(B, A$norm, fixed = TRUE)
    if (hit[1] == -1) {
      stop(sprintf("Line %d: cannot find `SCN: %s` match on the left.", i, scn_text))
    }

    lhs_nowhite <- gsub("[ \t]", "", lhs_txt)
    start_expr_norm <- hit[1] + nchar(lhs_nowhite) + 1L
    end_expr_norm   <- hit[1] + nchar(B) - 1L

    if (start_expr_norm > length(A$map) || end_expr_norm > length(A$map)) {
      stop(sprintf("Line %d: index mapping failure.", i))
    }
    start_orig <- A$map[start_expr_norm]
    end_orig   <- A$map[end_expr_norm]

    new_left <- paste0(
      substr(left, 1L, start_orig - 1L),
      lit,
      substr(left, end_orig + 1L, nchar(left))
    )
    out[i] <- new_left
  }

  if (!keep_roxygen_comments) {
    strip_after_hashquote <- function(line) {
      s <- strsplit(line, '', fixed = TRUE)[[1]]
      in_s <- FALSE
      in_d <- FALSE
      esc <- FALSE
      for (k in seq_along(s)) {
        ch <- s[k]
        if (esc) { esc <- FALSE; next }
        if (ch == "\\") { esc <- TRUE; next }
        if (!in_d && ch == "'") { in_s <- !in_s; next }
        if (!in_s && ch == '"') { in_d <- !in_d; next }
        if (!in_s && !in_d && ch == "#" && k < length(s) && s[k+1] == "'") {
          if (k == 1) return('') else return(paste0(s[1:(k-1)], collapse = ''))
        }
      }
      line
    }
    out <- vapply(out, strip_after_hashquote, character(1))
  }

  writeLines(out, out_path, useBytes = TRUE)
  invisible(out_path)
}
