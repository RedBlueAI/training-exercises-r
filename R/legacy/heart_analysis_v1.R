# heart_analysis_v1.R
# Original analysis script - LEGACY CODE
# WARNING: This file contains intentional issues for training exercises
# DO NOT use as a template for new analyses
# ---------------------------------------------------------------

# Issue 1: No library() calls at top - relies on global environment
# Issue 2: Hardcoded absolute path
data = read.csv("C:/Users/analyst/Desktop/heart_data.csv")

# Issue 3: No data inspection or validation

# Issue 4: Using $ notation and base R instead of tidy
summary(data$age)
summary(data$chol)

# Issue 5: Silently dropping ALL rows with ANY missing value
data = na.omit(data)

# Issue 6: No seed set before random operations
train_idx = sample(1:nrow(data), nrow(data) * 0.7)
train = data[train_idx, ]
test = data[-train_idx, ]

# Issue 7: DATA LEAKAGE - scaling BEFORE splitting
# This should be done AFTER splitting, fitted on train only
data$age_scaled = scale(data$age)
data$chol_scaled = scale(data$chol)
data$bp_scaled = scale(data$resting_bp)
data$hr_scaled = scale(data$max_heart_rate)

# Issue 8: Using = instead of <- for assignment (style issue)
# Issue 9: Magic numbers without explanation
model = glm(heart_disease ~ age_scaled + chol_scaled + bp_scaled + hr_scaled + sex,
             data = train, family = "binomial")

# Issue 10: No model diagnostics or assumption checking
summary(model)

# Issue 11: Hardcoded threshold without justification
predictions = ifelse(predict(model, test, type = "response") > 0.5, 1, 0)

# Issue 12: Using accuracy alone (misleading for imbalanced data)
accuracy = sum(predictions == test$heart_disease) / length(predictions)
cat("Accuracy:", accuracy, "\n")

# Issue 13: No cross-validation, single train/test split only

# Issue 14: P-hacking - running multiple tests without correction
t.test(data$age[data$heart_disease == 1], data$age[data$heart_disease == 0])
t.test(data$chol[data$heart_disease == 1], data$chol[data$heart_disease == 0])
t.test(data$resting_bp[data$heart_disease == 1], data$resting_bp[data$heart_disease == 0])
t.test(data$max_heart_rate[data$heart_disease == 1], data$max_heart_rate[data$heart_disease == 0])
t.test(data$st_depression[data$heart_disease == 1], data$st_depression[data$heart_disease == 0])
# Issue 15: No multiple testing correction (Bonferroni, FDR, etc.)
# Issue 16: No normality check before t-test (should use Shapiro-Wilk or Wilcoxon)

# Issue 17: Wrong test - using t-test for categorical variable
t.test(data$chest_pain_type[data$heart_disease == 1],
       data$chest_pain_type[data$heart_disease == 0])

# Issue 18: Plotting without proper labels or saving
plot(data$age, data$max_heart_rate)
hist(data$chol)
barplot(table(data$heart_disease))

# Issue 19: Hardcoded interpretation with wrong conclusion
if (accuracy > 0.7) {
  cat("Model is good enough for production!\n")
} else {
  cat("Model needs improvement\n")
}

# Issue 20: No sessionInfo() or reproducibility information
# Issue 21: No renv or package version tracking
# Issue 22: Results not saved to file

# --- Utility functions with issues ---

# Issue 23: Function that silently coerces types
calculate_risk_score = function(age, bp, chol) {
  # No input validation
  # No NA handling - will silently produce NA
  score = (age / 100) + (bp / 200) + (chol / 600)
  return(score)
}

# Issue 24: Duplicated logic from above
check_patient = function(patient_data) {
  # Same scaling logic repeated (DRY violation)
  patient_data$age_s = (patient_data$age - mean(data$age)) / sd(data$age)
  patient_data$chol_s = (patient_data$chol - mean(data$chol)) / sd(data$chol)
  # Uses global 'data' variable - fragile
  # Uses global 'model' variable - fragile
  pred = predict(model, patient_data, type = "response")
  if (pred > 0.5) {
    cat("HIGH RISK\n")
  } else {
    cat("LOW RISK\n")
  }
}

# Issue 25: Admin function that exposes internal details
get_analysis_config = function() {
  list(
    db_password = "heart_analysis_2024",   # Hardcoded credential
    api_key = "sk-abc123def456",           # Hardcoded API key
    data_path = "C:/Users/analyst/Desktop/heart_data.csv",
    model_version = "v1",
    last_run = Sys.time()
  )
}
