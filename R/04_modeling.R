# 04_modeling.R
# Model training for heart disease prediction
# --------------------------------------------

library(tidyverse)
library(tidymodels)
library(here)

# Assumes preprocessing done in 03_preprocessing.R

# --- Define Models ---
set.seed(42)

# Logistic Regression
log_spec <- logistic_reg() |>
  set_engine("glm") |>
  set_mode("classification")

# Random Forest
rf_spec <- rand_forest(
  trees = 500,
  mtry = tune(),
  min_n = tune()
) |>
  set_engine("ranger", importance = "impurity") |>
  set_mode("classification")

# --- Create Workflows ---
log_wf <- workflow() |>
  add_recipe(heart_recipe) |>
  add_model(log_spec)

rf_wf <- workflow() |>
  add_recipe(heart_recipe) |>
  add_model(rf_spec)

# --- Fit Logistic Regression ---
cat("=== Fitting Logistic Regression ===\n")
log_fit <- fit(log_wf, data = heart_train)

log_results <- log_fit |>
  predict(heart_test) |>
  bind_cols(heart_test |> select(heart_disease)) |>
  metrics(truth = heart_disease, estimate = .pred_class)

cat("\nLogistic Regression Results:\n")
print(log_results)

# --- Tune Random Forest with Cross-Validation ---
cat("\n=== Tuning Random Forest ===\n")

cv_folds <- vfold_cv(heart_train, v = 5, strata = heart_disease)

rf_grid <- grid_regular(
  mtry(range = c(2, 8)),
  min_n(range = c(2, 20)),
  levels = 5
)

rf_tune <- tune_grid(
  rf_wf,
  resamples = cv_folds,
  grid = rf_grid,
  metrics = metric_set(accuracy, roc_auc, f_meas)
)

# Best parameters
best_rf <- select_best(rf_tune, metric = "roc_auc")
cat("\nBest Random Forest parameters:\n")
print(best_rf)

# Finalize and fit
rf_final <- finalize_workflow(rf_wf, best_rf) |>
  fit(data = heart_train)

cat("\nModels trained. Ready for validation in 05_validation.R\n")
