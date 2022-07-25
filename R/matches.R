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
  result <-
    data_engsoc %>%
    tibble::as_tibble() %>%
    dplyr::transmute(
      country = as.character(country),
      tier = factor(tier, levels = c("1", "2", "3", "4")),
      season = as.integer(Season),
      date = as.Date(Date),
      home = as.character(home),
      visitor = as.character(visitor),
      goals_home = as.integer(hgoal),
      goals_visitor = as.integer(vgoal)
    )
  result
}
