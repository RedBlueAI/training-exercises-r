# 02_eda.R
# Exploratory Data Analysis for Heart Disease Dataset
# ---------------------------------------------------

library(tidyverse)
library(here)
library(corrplot)

# Assumes heart data is loaded from 01_load_data.R
# source(here("R", "01_load_data.R"))

# --- Summary Statistics ---
cat("=== Summary Statistics ===\n")

# Numeric summaries
heart |>
  select(where(is.numeric)) |>
  summary()

# --- Missing Value Analysis ---
cat("\n=== Missing Value Analysis ===\n")

missing_summary <- heart |>
  summarise(across(everything(), ~ sum(is.na(.)))) |>
  pivot_longer(everything(), names_to = "variable", values_to = "n_missing") |>
  mutate(pct_missing = round(n_missing / nrow(heart) * 100, 1)) |>
  filter(n_missing > 0)

print(missing_summary)

# --- Distribution Plots ---

# Age distribution by heart disease status
p1 <- ggplot(heart, aes(x = age, fill = heart_disease)) +
  geom_histogram(binwidth = 5, position = "dodge", alpha = 0.7) +
  labs(
    title = "Age Distribution by Heart Disease Status",
    x = "Age (years)",
    y = "Count",
    fill = "Heart Disease"
  ) +
  theme_minimal()

ggsave(here("output", "figures", "eda_age_distribution.png"),
  p1, width = 8, height = 5, dpi = 300)

# Chest pain type vs heart disease
p2 <- ggplot(heart, aes(x = chest_pain_type, fill = heart_disease)) +
  geom_bar(position = "fill") +
  labs(
    title = "Heart Disease Proportion by Chest Pain Type",
    x = "Chest Pain Type",
    y = "Proportion",
    fill = "Heart Disease"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave(here("output", "figures", "eda_chest_pain.png"),
  p2, width = 8, height = 5, dpi = 300)

# Correlation matrix for numeric variables
numeric_vars <- heart_raw |>
  select(age, resting_bp, cholesterol, max_heart_rate, st_depression,
    num_major_vessels) |>
  drop_na()

cor_matrix <- cor(numeric_vars)

png(here("output", "figures", "eda_correlation_matrix.png"),
  width = 800, height = 800, res = 150)
corrplot(cor_matrix,
  method = "color",
  type = "upper",
  addCoef.col = "black",
  tl.col = "black",
  tl.cex = 0.8,
  number.cex = 0.7,
  title = "Correlation Matrix - Numeric Variables",
  mar = c(0, 0, 2, 0)
)
dev.off()

# Max heart rate vs age colored by outcome
p3 <- ggplot(heart, aes(x = age, y = max_heart_rate, color = heart_disease)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = TRUE) +
  labs(
    title = "Max Heart Rate vs Age by Disease Status",
    x = "Age (years)",
    y = "Maximum Heart Rate",
    color = "Heart Disease"
  ) +
  theme_minimal()

ggsave(here("output", "figures", "eda_heartrate_vs_age.png"),
  p3, width = 8, height = 5, dpi = 300)

cat("\nEDA complete. Plots saved to output/figures/\n")
