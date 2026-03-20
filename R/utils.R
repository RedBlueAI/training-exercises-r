# utils.R
# Shared utility functions for heart disease analysis
# ---------------------------------------------------

library(tidyverse)

#' Calculate summary statistics for a numeric variable by group
#'
#' @param data A data frame
#' @param var The numeric variable to summarize (unquoted)
#' @param group_var The grouping variable (unquoted)
#' @return A tibble with summary statistics
summarize_by_group <- function(data, var, group_var) {
  data |>
    group_by({{ group_var }}) |>
    summarise(
      n = n(),
      mean = mean({{ var }}, na.rm = TRUE),
      sd = sd({{ var }}, na.rm = TRUE),
      median = median({{ var }}, na.rm = TRUE),
      q25 = quantile({{ var }}, 0.25, na.rm = TRUE),
      q75 = quantile({{ var }}, 0.75, na.rm = TRUE),
      .groups = "drop"
    )
}

#' Check if a variable has outliers using IQR method
#'
#' @param x A numeric vector
#' @param multiplier IQR multiplier (default 1.5)
#' @return A logical vector indicating outliers
detect_outliers <- function(x, multiplier = 1.5) {
  q1 <- quantile(x, 0.25, na.rm = TRUE)
  q3 <- quantile(x, 0.75, na.rm = TRUE)
  iqr <- q3 - q1
  lower <- q1 - multiplier * iqr
  upper <- q3 + multiplier * iqr
  x < lower | x > upper
}

#' Format a p-value for reporting
#'
#' @param p A p-value
#' @return Formatted string
format_pvalue <- function(p) {
  if (p < 0.001) return("< 0.001")
  if (p < 0.01) return(sprintf("%.3f", p))
  sprintf("%.2f", p)
}

#' Calculate classification metrics from predictions
#'
#' @param actual Factor of actual labels
#' @param predicted Factor of predicted labels
#' @return Named list of metrics
calc_class_metrics <- function(actual, predicted) {
  cm <- table(Predicted = predicted, Actual = actual)
  tp <- cm[2, 2]
  tn <- cm[1, 1]
  fp <- cm[2, 1]
  fn <- cm[1, 2]

  list(
    accuracy = (tp + tn) / sum(cm),
    precision = tp / (tp + fp),
    recall = tp / (tp + fn),
    f1 = 2 * tp / (2 * tp + fp + fn),
    specificity = tn / (tn + fp)
  )
}
