# Session 3: Environment Setup & Configuration

**Duration:** ~20 minutes
**Focus:** Getting R, RStudio, and Claude Workflow System working together

## Learning Objectives

- Set up an R project with Claude Workflow integration
- Configure CLAUDE.md for R data science projects
- Verify the development environment works end-to-end

## Prerequisites

- R >= 4.3.0 installed
- RStudio >= 2024.04 installed
- Claude Code CLI installed (`npm install -g @anthropic-ai/claude-code`)

## Exercises

### Exercise 1: Verify R Environment (3 min)

1. Open `training-exercises-r.Rproj` in RStudio
2. In the R console, run:
   ```r
   R.version.string
   .libPaths()
   ```
3. Install core packages if needed:
   ```r
   install.packages(c("tidyverse", "tidymodels", "skimr", "here", "corrplot", "testthat", "rmarkdown"))
   ```
4. Verify the heart disease dataset loads:
   ```r
   library(readr)
   heart <- read_csv("data/raw/heart_disease.csv")
   glimpse(heart)
   ```

### Exercise 2: Install Claude Workflow System (5 min)

1. Open a terminal (in RStudio: Tools > Terminal > New Terminal, or use an external terminal)
2. Navigate to the project directory
3. Install the Claude Workflow plugin:
   ```bash
   claude plugin marketplace add https://github.com/RedBlueAI/claude-workflow-plugin.git
   claude plugin install claude-workflow@redblue-workflows
   ```
4. Run the setup command:
   ```bash
   claude /claude-workflow:setup
   ```
5. When prompted, select the **r-data-science** variant

### Exercise 3: Review and Customize CLAUDE.md (5 min)

1. Open `CLAUDE.md` in RStudio's editor
2. Review the generated structure
3. Customize these sections for the heart disease project:
   - Project name: "Heart Disease Prediction Analysis"
   - Description: "Clinical data analysis for heart disease prediction using R"
   - Add any team-specific conventions

### Exercise 4: Run Your First Claude Command (5 min)

1. In the terminal with Claude Code running:
   ```bash
   claude /StartSession
   ```
2. Observe what context Claude loads (R files, data, CLAUDE.md)
3. Ask Claude to verify the project setup:
   ```
   Can you verify that all required R packages are available and the heart disease dataset loads correctly?
   ```

### Exercise 5: Verify Everything Works (2 min)

1. In RStudio, source the data loading script:
   ```r
   source("R/01_load_data.R")
   ```
2. Confirm you see the data summary output
3. Check that the `heart` object is in your environment

## Completion Checklist

- [ ] R and RStudio working with correct versions
- [ ] Core packages installed (tidyverse, tidymodels, skimr, here)
- [ ] Claude Workflow plugin installed and configured
- [ ] CLAUDE.md customized for R project
- [ ] Heart disease dataset loads successfully
- [ ] First /StartSession command runs successfully
