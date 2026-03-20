# Heart Disease Prediction — AI Training Exercises (R Edition)

Hands-on training repository for the **AI Tool Assistance System** curriculum — R Data Science track.

## Quick Start

```bash
# Clone the repo
git clone https://github.com/RedBlueAI/training-exercises-r.git
cd training-exercises-r

# Open in RStudio
open training-exercises-r.Rproj
```

In R console:
```r
# Install dependencies
install.packages(c(
  "tidyverse", "tidymodels", "skimr", "here",
  "corrplot", "testthat", "rmarkdown", "knitr"
))

# Verify data loads
library(readr)
heart <- read_csv("data/raw/heart_disease.csv")
nrow(heart)  # Should be 300
```

## Training Sessions

| Session | Topic | Type |
|---------|-------|------|
| 3 | [Environment Setup & Configuration](exercises/session-3/README.md) | Setup |
| 4 | [Session Start — Context-Aware Development](exercises/session-4/README.md) | Workflow |
| 5 | [Assisted Coding: EDA, Modeling & Statistics](exercises/session-5/README.md) | Coding |
| 6 | [Session End & Quality Gates](exercises/session-6/README.md) | Quality |
| 7 | [Analysis Plan Validation & Feasibility](exercises/session-7/README.md) | Planning |
| 8 | [Work Breakdown & Cycle Planning](exercises/session-8/README.md) | Planning |
| 9 | [AI-Assisted Research & Analysis Plan Creation](exercises/session-9/README.md) | Research |
| 10 | [Data Governance & Reproducibility](exercises/session-10/README.md) | Governance |
| 11 | [Measuring Impact & ROI](exercises/session-11/README.md) | Metrics |
| 12 | [Capstone — AI-Enhanced Data Science Rollout](exercises/session-12/README.md) | Strategy |

Exercise instructions are in the `exercises/` directory, organized by session.

## Application

This is a **Heart Disease Prediction Analysis** — a realistic R data science project that analysts use for hands-on exercises. It includes:

- **Data Pipeline** — Numbered R scripts (01-05) from loading through validation
- **EDA** — Exploratory analysis with ggplot2 visualizations and summary statistics
- **Modeling** — Logistic regression and random forest via tidymodels
- **Validation** — Cross-validation, ROC curves, confusion matrices, model comparison
- **Reporting** — RMarkdown reports with reproducible analysis

## Tech Stack

- **Language:** R >= 4.3.0
- **IDE:** RStudio >= 2024.04
- **Data Manipulation:** tidyverse (dplyr, tidyr, readr, purrr, ggplot2)
- **Machine Learning:** tidymodels (recipes, parsnip, workflows, rsample, tune, yardstick)
- **Testing:** testthat
- **Reporting:** rmarkdown, knitr
- **Data Profiling:** skimr
- **AI Integration:** Claude Code CLI

## Important Note

Some code in this repository is **intentionally buggy or statistically flawed**. This is exercise material — don't fix issues before the relevant training session!

- `R/legacy/heart_analysis_v1.R` — 25 intentional issues for refactoring exercises (Session 5)
  - Data leakage (scaling before train/test split)
  - Wrong statistical tests (t-test on categorical variables)
  - P-hacking (multiple comparisons without correction)
  - Hardcoded credentials and absolute file paths
  - No reproducibility (missing seeds, sessionInfo, renv)
- `knowledge/prd/heart-disease-prediction.md` — Deliberately incomplete analysis plan (Session 7)
- `knowledge/prd/patient-risk-stratification.md` — Deliberately vague analysis plan (Session 9)
- `analysis/eda_report.Rmd` — Has TODO placeholder sections (Session 5)

## Dataset

Synthetic heart disease dataset (300 patients, 15 clinical variables) modeled after the [UCI Heart Disease dataset](https://archive.ics.uci.edu/dataset/45/heart+disease). Includes intentional missing values in `cholesterol` (~3%) and `thalassemia` (~2%) for training on missing data handling. See [data dictionary](data/raw/README.md) for variable descriptions.
