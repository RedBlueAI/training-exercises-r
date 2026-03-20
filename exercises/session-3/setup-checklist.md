# Setup Verification Checklist

## R Environment
- [ ] R version >= 4.3.0: `R.version.string`
- [ ] RStudio version >= 2024.04: Help > About RStudio
- [ ] Working directory set correctly: `getwd()`

## Required Packages
Run this to check all required packages:
```r
required <- c("tidyverse", "tidymodels", "skimr", "here",
              "corrplot", "testthat", "rmarkdown", "knitr")

installed <- sapply(required, requireNamespace, quietly = TRUE)
cat("Package Status:\n")
data.frame(
  package = required,
  installed = ifelse(installed, "OK", "MISSING")
)
```

## Claude Code
- [ ] Claude Code CLI installed: `claude --version`
- [ ] Claude Workflow plugin installed: `claude /claude-workflow:status`
- [ ] r-data-science variant selected

## Project Structure
- [ ] .Rproj file opens correctly in RStudio
- [ ] CLAUDE.md exists and is customized
- [ ] data/raw/heart_disease.csv exists (300 rows)
- [ ] R/ scripts are present (01 through 05)
- [ ] R/legacy/heart_analysis_v1.R exists (buggy code)

## Data Verification
```r
library(readr)
heart <- read_csv("data/raw/heart_disease.csv")
stopifnot(nrow(heart) == 300)
stopifnot(ncol(heart) == 15)
cat("Data verification passed!\n")
```
