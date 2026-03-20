library(testthat)

# Source the utilities
source(here::here("R", "utils.R"))

test_that("summarize_by_group returns correct structure", {
  test_data <- tibble(
    value = c(1, 2, 3, 4, 5, 6),
    group = c("A", "A", "A", "B", "B", "B")
  )

  result <- summarize_by_group(test_data, value, group)

  expect_equal(nrow(result), 2)
  expect_true("mean" %in% names(result))
  expect_true("sd" %in% names(result))
  expect_true("median" %in% names(result))
  expect_equal(result$mean[result$group == "A"], 2)
  expect_equal(result$mean[result$group == "B"], 5)
})

test_that("detect_outliers identifies extreme values", {
  normal_data <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
  result <- detect_outliers(normal_data)
  expect_false(any(result))

  with_outlier <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 100)
  result <- detect_outliers(with_outlier)
  expect_true(result[10])
})

test_that("detect_outliers handles NA values", {
  data_with_na <- c(1, 2, NA, 4, 5)
  result <- detect_outliers(data_with_na)
  expect_true(is.na(result[3]))
})

test_that("format_pvalue formats correctly", {
  expect_equal(format_pvalue(0.0001), "< 0.001")
  expect_equal(format_pvalue(0.005), "0.005")
  expect_equal(format_pvalue(0.05), "0.05")
})

test_that("calc_class_metrics returns correct metrics", {
  actual <- factor(c(1, 1, 0, 0, 1, 0), levels = c(0, 1))
  predicted <- factor(c(1, 0, 0, 0, 1, 1), levels = c(0, 1))

  metrics <- calc_class_metrics(actual, predicted)

  expect_true(metrics$accuracy >= 0 & metrics$accuracy <= 1)
  expect_true(metrics$precision >= 0 & metrics$precision <= 1)
  expect_true(metrics$recall >= 0 & metrics$recall <= 1)
  expect_true(metrics$f1 >= 0 & metrics$f1 <= 1)
})
