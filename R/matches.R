#' Makes standard dataframe for league data
#'
#'@param data_engsoc dataframe from engsoccer data package
#'@param country a country one of spain, italy, germany, england, holland
#'
#'@return dataframe, tibble
#'
#'@export
#'
uss_make_matches <- function(data_engsoc, country) {

  # validating
  validate_data_frame(data_engsoc)
  validate_cols(data_engsoc, cols_engsoc())

  result <-
    data_engsoc %>%
    tibble::as_tibble() %>%
    dplyr::transmute(
      country = as.character(.env$country),
      tier = factor(.data$tier, levels = c("1", "2", "3", "4")),
      season = as.integer(.data$Season),
      date = as.Date(.data$Date),
      home = as.character(.data$home),
      visitor = as.character(.data$visitor),
      goals_home = as.integer(.data$hgoal),
      goals_visitor = as.integer(.data$vgoal)
    )
  result
}
