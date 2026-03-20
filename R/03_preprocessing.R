# 03_preprocessing.R
# Data preprocessing and feature engineering
# ------------------------------------------

library(tidyverse)
library(tidymodels)
library(here)

# Assumes heart data loaded from 01_load_data.R

# --- Handle Missing Values ---
cat("=== Preprocessing Pipeline ===\n")
cat("Missing values before imputation:\n")
heart |>
  summarise(across(everything(), ~ sum(is.na(.)))) |>
  pivot_longer(everything()) |>
  filter(value > 0) |>
  print()

# --- Create Preprocessing Recipe ---
set.seed(42)

# Split data first (before any preprocessing!)
heart_split <- initial_split(heart |> select(-patient_id),
  prop = 0.75,
  strata = heart_disease
)
heart_train <- training(heart_split)
heart_test <- testing(heart_split)

cat("\nTraining set:", nrow(heart_train), "rows")
cat("\nTest set:", nrow(heart_test), "rows\n")

# Define preprocessing recipe
heart_recipe <- recipe(heart_disease ~ ., data = heart_train) |>
  step_impute_median(all_numeric_predictors()) |>
  step_impute_mode(all_nominal_predictors()) |>
  step_normalize(all_numeric_predictors()) |>
  step_dummy(all_nominal_predictors())

# Preview the recipe
cat("\nRecipe steps:\n")
print(heart_recipe)

# Prep and bake to inspect
heart_prep <- prep(heart_recipe)
heart_baked <- bake(heart_prep, new_data = NULL)
cat("\nPreprocessed training data dimensions:", dim(heart_baked), "\n")

cat("\nPreprocessing pipeline defined. Ready for modeling.\n")
