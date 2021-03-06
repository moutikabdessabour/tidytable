#' Deprecated mutate helpers
#'
#' @description
#' These helpers have been deprecated. Please use `mutate_across.()`
#'
#' @md
#'
#' @param .df A data.frame or data.table
#' @param .predicate predicate for `mutate_if.()` to use
#' @param .vars vector `c()` of bare column names for `mutate_at.()` to use
#' @param .funs Functions to pass. Can pass a list of functions.
#' @param ... Other arguments for the passed function
#' @param .by Columns to group by
#'
#' @export
#'
#' @examples
#' test_df <- data.table(
#'   x = c(1,1,1),
#'   y = c(2,2,2),
#'   z = c("a", "a", "b"))
#'
#' test_df %>%
#'   mutate_across.(where(is.numeric), as.character)
#'
#' test_df %>%
#'   mutate_across.(c(x, y), ~ .x * 2)
#'
#' test_df %>%
#'   mutate_across.(everything(), as.character)
#'
#' test_df %>%
#'   mutate_across.(c(x, y), list(new = ~ .x * 2,
#'                                another = ~ .x + 7))
mutate_if. <- function(.df, .predicate, .funs, ..., .by = NULL) {
  UseMethod("mutate_if.")
}

#' @export
mutate_if..data.frame <- function(.df, .predicate, .funs, ..., .by = NULL) {

  deprecate_soft("0.5.0", "tidytable::mutate_if.()", "mutate_across.()")

  mutate_across.(.df, where({{.predicate}}), .funs, ..., .by = {{ .by }})
}

#' @export
#' @rdname mutate_if.
mutate_at. <- function(.df, .vars, .funs, ..., .by = NULL) {
  UseMethod("mutate_at.")
}

#' @export
mutate_at..data.frame <- function(.df, .vars, .funs, ..., .by = NULL) {

  deprecate_soft("0.5.0", "tidytable::mutate_at.()", "mutate_across.()")

  mutate_across.(.df, {{.vars}}, .funs, ..., .by = {{ .by }})
}

#' @export
#' @rdname mutate_if.
mutate_all. <- function(.df, .funs, ..., .by = NULL) {
  UseMethod("mutate_all.")
}

#' @export
mutate_all..data.frame <- function(.df, .funs, ..., .by = NULL) {

  deprecate_soft("0.5.0", "tidytable::mutate_all.()", "mutate_across.()")

  mutate_across.(.df, everything(), .funs, ..., .by = {{ .by }})
}
