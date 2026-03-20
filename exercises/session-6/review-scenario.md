# R Code Review Scenarios

## Scenario 1: Data Leakage Detection

Review this code snippet. Can you spot the issue?

```r
# Normalize all features
heart_normalized <- heart |>
  mutate(across(where(is.numeric), scale))

# NOW split into train/test
set.seed(42)
split <- initial_split(heart_normalized, prop = 0.8)
train <- training(split)
test <- testing(split)
```

**Issue:** Normalization uses statistics from the FULL dataset (including test), causing data leakage. The correct approach: split first, then fit preprocessing on training data only using `recipes`.

## Scenario 2: Silent NA Propagation

```r
avg_chol <- mean(heart$cholesterol)
```

**Issue:** If `cholesterol` has NA values, `mean()` returns NA without warning. Fix: `mean(heart$cholesterol, na.rm = TRUE)` or handle NAs explicitly.

## Scenario 3: Factor Level Trap

```r
heart_filtered <- heart |> filter(chest_pain_type != "Asymptomatic")
table(heart_filtered$chest_pain_type)
```

**Issue:** The factor still has the "Asymptomatic" level (showing 0 count). Fix: `droplevels()` or `fct_drop()`.
