# 01_load_data.R
# Load and inspect the heart disease dataset
# ------------------------------------------

library(tidyverse)
library(here)
library(skimr)

# Load raw data
heart_raw <- read_csv(
  here("data", "raw", "heart_disease.csv"),
  col_types = cols(
    patient_id = col_integer(),
    age = col_integer(),
    sex = col_integer(),
    chest_pain_type = col_integer(),
    resting_bp = col_integer(),
    cholesterol = col_integer(),
    fasting_blood_sugar = col_integer(),
    resting_ecg = col_integer(),
    max_heart_rate = col_integer(),
    exercise_angina = col_integer(),
    st_depression = col_double(),
    st_slope = col_integer(),
    num_major_vessels = col_integer(),
    thalassemia = col_integer(),
    heart_disease = col_integer()
  )
)

# Quick inspection
cat("Dataset dimensions:", nrow(heart_raw), "rows x", ncol(heart_raw), "columns\n")
glimpse(heart_raw)

# Detailed summary
skim(heart_raw)

# Convert categorical variables to factors with labels
heart <- heart_raw |>
  mutate(
    sex = factor(sex, levels = c(0, 1), labels = c("Female", "Male")),
    chest_pain_type = factor(chest_pain_type,
      levels = 0:3,
      labels = c("Typical Angina", "Atypical Angina", "Non-Anginal", "Asymptomatic")
    ),
    fasting_blood_sugar = factor(fasting_blood_sugar,
      levels = c(0, 1),
      labels = c("Normal", "Elevated")
    ),
    resting_ecg = factor(resting_ecg,
      levels = 0:2,
      labels = c("Normal", "ST-T Abnormality", "LV Hypertrophy")
    ),
    exercise_angina = factor(exercise_angina,
      levels = c(0, 1),
      labels = c("No", "Yes")
    ),
    st_slope = factor(st_slope,
      levels = 0:2,
      labels = c("Upsloping", "Flat", "Downsloping")
    ),
    thalassemia = factor(thalassemia,
      levels = 1:3,
      labels = c("Normal", "Fixed Defect", "Reversible Defect")
    ),
    heart_disease = factor(heart_disease,
      levels = c(0, 1),
      labels = c("No", "Yes")
    )
  )

cat("\nData loaded and factors created. Object 'heart' is ready for analysis.\n")
