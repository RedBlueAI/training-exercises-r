# Heart Disease Prediction Analysis

Clinical data analysis for heart disease prediction using R, tidyverse, and tidymodels. Training project for the Claude Workflow System (R Data Science variant).

## Repository Structure

```
training-exercises-r/
  R/                    # R analysis scripts (numbered pipeline)
    legacy/             # Legacy code with intentional issues
  analysis/             # RMarkdown analysis reports
  data/
    raw/                # Immutable raw datasets
    processed/          # Transformed data outputs
  output/
    figures/            # Generated plots (300 DPI)
    tables/             # Generated summary tables (CSV)
  exercises/            # Training session instructions (Sessions 3-12)
  knowledge/prd/        # Analysis plan documents
  tests/testthat/       # Unit tests
  docs/                 # Planning, specs, and reports
  .claude/              # Workflow commands, agents, tasks
```

## Development Guidelines

### Code Style
- Follow tidyverse style guide (snake_case, pipes, tidy evaluation)
- Use `|>` (base pipe) for R >= 4.1
- Always set random seeds before stochastic operations: `set.seed(42)`
- Use `here::here()` for all file paths, never hardcoded absolute paths
- Explicit NA handling in all operations (`na.rm = TRUE` or intentional checks)

### R Conventions
- tidyverse for data manipulation and visualization
- tidymodels for ML pipelines (recipes, parsnip, workflows, rsample, tune, yardstick)
- testthat for unit testing
- rmarkdown + knitr for reports
- skimr for quick data profiling

### Data Handling
- Raw data in `data/raw/` is IMMUTABLE - never modify source files
- All transformations done in code, never manually
- Processed data saved to `data/processed/`
- Missing values handled explicitly (never silently dropped)
- Document all data transformations with comments

### Analysis Standards
- Every analysis has a plan document in `knowledge/prd/`
- EDA before modeling, always
- Cross-validation required for all models (minimum 5-fold, stratified)
- Statistical tests must verify assumptions before running
- Multiple comparison correction when running > 1 test
- Report effect sizes alongside p-values

### Visualization Standards
- ggplot2 with `theme_minimal()` base
- Clear axis labels, titles, and legends on every plot
- Save with `ggsave()` at 300 DPI, width=8, height=5 default
- Consistent color palette throughout project
- One insight per plot, not overloaded panels

### Testing Requirements
- All utility functions in `R/utils.R` must have testthat tests
- Model validation requires cross-validation results
- Run tests: `testthat::test_dir("tests/testthat")`

### Documentation
- roxygen2-style comments for all functions
- `sessionInfo()` at the end of every RMarkdown report
- Data dictionary maintained in `data/raw/README.md`

## Workflow Integration

### Available Commands
- `/StartSession` - Initialize work session with R project context
- `/EndSession` - Close session with documentation
- `/RunEDA` - Systematic exploratory data analysis
- `/ValidateModel` - Cross-validation and model diagnostics
- `/CreateAnalysisPlan` - Structured analysis planning
- `/DocumentFindings` - Formal findings documentation
- `/ImplementFeature` - Add analysis components (R-specific)
- `/FixBug` - Debug R code issues (R-specific)
- `/RefactorCode` - Modernize R code (R-specific)
- `/ReviewCode` - Code quality review
- `/GenerateTests` - Generate testthat tests
- `/PRDValidate` - Validate analysis plans
- `/PRDEnrich` - Enrich plans with technical context
- `/PRDFeasibility` - Assess analysis feasibility
- `/Breakdown` - Break analysis into work items
- `/CyclePlan` - Plan analysis cycles

## Environment Setup

### Prerequisites
- R >= 4.3.0
- RStudio >= 2024.04
- Claude Code CLI

### Installation
```r
# Install required packages
install.packages(c(
  "tidyverse", "tidymodels", "skimr", "here",
  "corrplot", "testthat", "rmarkdown", "knitr"
))
```

### Running the Analysis Pipeline
```r
source("R/01_load_data.R")     # Load and inspect data
source("R/02_eda.R")           # Exploratory data analysis
source("R/03_preprocessing.R") # Data preprocessing
source("R/04_modeling.R")      # Model training
source("R/05_validation.R")    # Model validation
```

### Running Tests
```r
testthat::test_dir("tests/testthat")
```

### Rendering Reports
```r
rmarkdown::render("analysis/eda_report.Rmd")
rmarkdown::render("analysis/model_report.Rmd")
```

## Key Directories

| Directory | Purpose |
|-----------|---------|
| `R/` | Numbered analysis pipeline scripts |
| `R/legacy/` | Intentionally buggy code for refactoring exercises |
| `analysis/` | RMarkdown reports |
| `data/raw/` | Immutable source data with data dictionary |
| `data/processed/` | Generated processed data |
| `output/figures/` | Generated plots at 300 DPI |
| `output/tables/` | Generated summary tables |
| `tests/testthat/` | Unit tests for utility functions |
| `exercises/` | Training session instructions |
| `knowledge/prd/` | Analysis plan documents |
| `docs/planning/` | Session state and planning files |

## Important Conventions

### Commit Messages
- feat: New analysis feature or visualization
- fix: Bug fix in analysis code
- refactor: Code improvement without changing results
- docs: Documentation updates
- data: Data processing changes
- test: Test additions or modifications

### Branch Naming
- analysis/description (new analyses)
- fix/description (bug fixes)
- refactor/description (code improvements)

### The Legacy Code
`R/legacy/heart_analysis_v1.R` contains **25 intentional issues** for training exercises. These include data leakage, wrong statistical tests, hardcoded credentials, and reproducibility failures. Do NOT use this as a template.
