# Training Exercises - R Data Science Edition

Hands-on exercises for learning the Claude Workflow System with R and RStudio. These exercises teach you to use AI-assisted development for data science workflows including EDA, statistical analysis, machine learning, and model validation.

## Prerequisites

- R >= 4.3.0 installed
- RStudio installed
- Claude Code CLI installed
- Basic familiarity with R and tidyverse

## Exercise Sessions

| Session | Topic | Duration | Focus |
|---------|-------|----------|-------|
| 3 | Environment Setup & Configuration | ~20 min | Setup |
| 4 | Session Start - Context-Aware Development | ~20 min | Workflow |
| 5 | Assisted Coding: EDA, Modeling & Statistics | ~20 min | Coding |
| 6 | Session End & Quality Gates | ~20 min | Quality |
| 7 | Analysis Plan Validation | ~25 min | Planning |
| 8 | Work Breakdown & Cycle Planning | ~30 min | Planning |
| 9 | AI-Assisted Research & Analysis Plan Creation | ~30 min | Research |
| 10 | Data Governance & Reproducibility | ~20 min | Governance |
| 11 | Measuring Impact & ROI | ~25 min | Metrics |
| 12 | Capstone - AI-Enhanced Data Science Rollout | ~30 min | Strategy |

## How to Use

1. Complete sessions in order (3 through 12)
2. Each session has a README with step-by-step instructions
3. Work in RStudio with Claude Code running in a terminal
4. Generated artifacts (plots, tables, reports) go in `output/`

## Dataset

All exercises use the **Heart Disease** dataset located in `data/raw/heart_disease.csv`. See `data/raw/README.md` for the data dictionary.

## Project Structure

```
training-exercises-r/
  R/                  # R scripts (analysis pipeline)
  R/legacy/           # Intentionally buggy code for exercises
  analysis/           # RMarkdown reports
  data/raw/           # Raw datasets
  data/processed/     # Cleaned data (generated)
  output/figures/     # Generated plots
  output/tables/      # Generated tables
  exercises/          # Exercise instructions (you are here)
  knowledge/prd/      # Analysis plan documents
  tests/testthat/     # Unit tests
```
