# Exercise 1: Refactor Legacy R Code

**Duration:** ~5 minutes
**Mode:** /RefactorCode
**Target:** `R/legacy/heart_analysis_v1.R`

## Background

A previous analyst wrote `heart_analysis_v1.R` using base R patterns and poor practices. Your job is to identify and fix the issues using Claude's refactoring assistance.

## Known Issues in the Legacy Code

The file contains **25 intentional issues** including:

| Category | Issues |
|----------|--------|
| **Reproducibility** | Hardcoded paths, no seed, no sessionInfo |
| **Data Leakage** | Scaling before train/test split |
| **Statistical Errors** | Wrong test for categorical data, no multiple testing correction |
| **Code Quality** | No tidyverse, duplicated logic, magic numbers |
| **Security** | Hardcoded credentials (db_password, api_key) |
| **Missing Validation** | No data inspection, no assumption checking |

## Steps

1. In Claude Code, run:
   ```
   /RefactorCode R/legacy/heart_analysis_v1.R
   ```

2. Observe what Claude identifies. Does it catch:
   - [ ] The data leakage (scaling before split)?
   - [ ] The wrong statistical test (t-test on categorical)?
   - [ ] The missing multiple testing correction?
   - [ ] The hardcoded credentials?
   - [ ] The lack of reproducibility (no seed)?

3. Ask Claude to prioritize the fixes by severity

4. Have Claude refactor the code section by section:
   ```
   Start with the data leakage issue - show me the correct way to handle preprocessing with tidymodels
   ```

## Success Criteria

- Claude identifies at least 15 of the 25 issues
- The refactored code uses tidyverse/tidymodels patterns
- Data leakage is fixed (preprocessing after split)
- Statistical tests are appropriate
- Code is reproducible (seeds, relative paths, sessionInfo)

## Discussion

- Which issues did Claude catch immediately?
- Which required prompting to find?
- How does AI-assisted refactoring compare to manual code review?
