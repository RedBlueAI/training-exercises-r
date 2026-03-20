# Training Exercises - R Data Science Edition

Hands-on training exercises for the [Claude Workflow System](https://github.com/RedBlueAI/claude-workflow) using R and RStudio. This project teaches AI-assisted data science development through a realistic clinical data analysis scenario.

## Overview

This training project uses a **heart disease prediction** dataset to teach data scientists how to use Claude Code with the Claude Workflow System. You'll work through 10 sessions covering:

- Environment setup and configuration
- AI-assisted exploratory data analysis
- Machine learning with tidymodels
- Statistical test selection and validation
- Model validation and diagnostics
- Data governance and reproducibility
- Measuring the impact of AI-assisted development

## Quick Start

### 1. Prerequisites

- [R](https://cran.r-project.org/) >= 4.3.0
- [RStudio](https://posit.co/download/rstudio-desktop/) >= 2024.04
- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) CLI

### 2. Setup

```bash
# Clone the repository
git clone https://github.com/QuestAI/training-exercises-r.git
cd training-exercises-r

# Open in RStudio
open training-exercises-r.Rproj
```

In R console:
```r
# Install required packages
install.packages(c(
  "tidyverse", "tidymodels", "skimr", "here",
  "corrplot", "testthat", "rmarkdown", "knitr"
))

# Verify data loads
library(readr)
heart <- read_csv("data/raw/heart_disease.csv")
nrow(heart)  # Should be 300
```

### 3. Install Claude Workflow

```bash
claude /claude-workflow:setup
# Select: r-data-science variant
```

### 4. Start Training

Begin with [Session 3: Environment Setup](exercises/session-3/README.md).

## Project Structure

```
training-exercises-r/
  R/                    # Analysis pipeline (01-05 numbered scripts)
    legacy/             # Buggy legacy code for refactoring exercises
  analysis/             # RMarkdown reports
  data/raw/             # Heart disease dataset (300 patients)
  exercises/            # Training sessions 3-12
  knowledge/prd/        # Analysis plan documents
  tests/testthat/       # Unit tests
  output/               # Generated figures and tables
```

## Tech Stack

| Component | Technology |
|-----------|-----------|
| Language | R >= 4.3.0 |
| IDE | RStudio |
| Data Manipulation | tidyverse (dplyr, tidyr, readr, purrr) |
| Visualization | ggplot2 |
| Machine Learning | tidymodels (recipes, parsnip, workflows, rsample, tune) |
| Testing | testthat |
| Reporting | rmarkdown, knitr |
| Data Profiling | skimr |
| AI Integration | Claude Code CLI |

## Training Sessions

| Session | Topic | Skills |
|---------|-------|--------|
| 3 | Environment Setup | R, RStudio, Claude Workflow |
| 4 | Session Start | Context loading, focus modes |
| 5 | Assisted Coding | EDA, refactoring, statistics |
| 6 | Quality Gates | Code review, documentation |
| 7 | Analysis Plan Validation | PRD workflow for data science |
| 8 | Work Breakdown | Task planning for analyses |
| 9 | Research & Planning | Creating analysis plans from scratch |
| 10 | Data Governance | Reproducibility, governance |
| 11 | Measuring Impact | ROI of AI-assisted data science |
| 12 | Capstone | Team rollout strategy |

## Dataset

The project uses a synthetic heart disease dataset (300 patients, 15 variables) modeled after the UCI Heart Disease dataset. See [data dictionary](data/raw/README.md) for variable descriptions.

## License

For educational use. Part of the [Claude Workflow System](https://github.com/RedBlueAI/claude-workflow) training curriculum.
