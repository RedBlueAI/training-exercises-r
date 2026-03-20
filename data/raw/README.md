# Heart Disease Dataset

## Overview

Synthetic dataset modeled after the UCI Heart Disease dataset, containing 300 patient records with clinical measurements for predicting heart disease presence.

## Data Dictionary

| Variable | Type | Description | Values |
|----------|------|-------------|--------|
| patient_id | integer | Unique patient identifier | 1-300 |
| age | integer | Patient age in years | 29-77 |
| sex | binary | Patient sex | 0 = female, 1 = male |
| chest_pain_type | categorical | Type of chest pain | 0 = typical angina, 1 = atypical angina, 2 = non-anginal, 3 = asymptomatic |
| resting_bp | integer | Resting blood pressure (mm Hg) | 94-200 |
| cholesterol | integer | Serum cholesterol (mg/dl) | 126-564 (some missing) |
| fasting_blood_sugar | binary | Fasting blood sugar > 120 mg/dl | 0 = no, 1 = yes |
| resting_ecg | categorical | Resting ECG results | 0 = normal, 1 = ST-T wave abnormality, 2 = left ventricular hypertrophy |
| max_heart_rate | integer | Maximum heart rate achieved | 71-202 |
| exercise_angina | binary | Exercise-induced angina | 0 = no, 1 = yes |
| st_depression | numeric | ST depression induced by exercise | 0.0-6.2 |
| st_slope | categorical | Slope of peak exercise ST segment | 0 = upsloping, 1 = flat, 2 = downsloping |
| num_major_vessels | integer | Number of major vessels colored by fluoroscopy | 0-3 |
| thalassemia | categorical | Thalassemia type | 1 = normal, 2 = fixed defect, 3 = reversible defect (some missing) |
| heart_disease | binary | Diagnosis of heart disease | 0 = no disease, 1 = disease present |

## Data Quality Notes

- Some missing values in `cholesterol` (~3%) and `thalassemia` (~2%)
- These are intentional for training exercises on missing data handling
- No personally identifiable information (fully synthetic)

## Source

Synthetic data generated to mirror the structure and distributions of the UCI Heart Disease dataset (Cleveland subset). For educational use only.

## Citation

Original dataset: Janosi, A., Steinbrunn, W., Pfisterer, M., & Detrano, R. (1988). Heart Disease. UCI Machine Learning Repository.
