# 05_validation.R
# Model validation and comparison
# --------------------------------

library(tidyverse)
library(tidymodels)
library(here)

# Assumes models fitted in 04_modeling.R

# --- Evaluate on Test Set ---
cat("=== Model Validation ===\n")

# Logistic regression predictions
log_preds <- log_fit |>
  predict(heart_test, type = "prob") |>
  bind_cols(
    log_fit |> predict(heart_test),
    heart_test |> select(heart_disease)
  )

# Random forest predictions
rf_preds <- rf_final |>
  predict(heart_test, type = "prob") |>
  bind_cols(
    rf_final |> predict(heart_test),
    heart_test |> select(heart_disease)
  )

# --- Metrics Comparison ---
log_metrics <- log_preds |>
  metrics(truth = heart_disease, estimate = .pred_class) |>
  mutate(model = "Logistic Regression")

rf_metrics <- rf_preds |>
  metrics(truth = heart_disease, estimate = .pred_class) |>
  mutate(model = "Random Forest")

comparison <- bind_rows(log_metrics, rf_metrics) |>
  select(model, .metric, .estimate) |>
  pivot_wider(names_from = .metric, values_from = .estimate)

cat("\nModel Comparison:\n")
print(comparison)

# --- ROC Curves ---
roc_log <- log_preds |>
  roc_curve(truth = heart_disease, .pred_Yes) |>
  mutate(model = "Logistic Regression")

roc_rf <- rf_preds |>
  roc_curve(truth = heart_disease, .pred_Yes) |>
  mutate(model = "Random Forest")

p_roc <- bind_rows(roc_log, roc_rf) |>
  ggplot(aes(x = 1 - specificity, y = sensitivity, color = model)) +
  geom_path(linewidth = 1) +
  geom_abline(linetype = "dashed", color = "gray50") +
  labs(
    title = "ROC Curves - Model Comparison",
    x = "1 - Specificity (False Positive Rate)",
    y = "Sensitivity (True Positive Rate)",
    color = "Model"
  ) +
  theme_minimal()

ggsave(here("output", "figures", "validation_roc_curves.png"),
  p_roc, width = 8, height = 6, dpi = 300)

# --- Confusion Matrices ---
log_cm <- log_preds |>
  conf_mat(truth = heart_disease, estimate = .pred_class)

rf_cm <- rf_preds |>
  conf_mat(truth = heart_disease, estimate = .pred_class)

cat("\nLogistic Regression Confusion Matrix:\n")
print(log_cm)

cat("\nRandom Forest Confusion Matrix:\n")
print(rf_cm)

# --- Save Results ---
write_csv(comparison, here("output", "tables", "model_comparison.csv"))

cat("\nValidation complete. Results saved to output/\n")
