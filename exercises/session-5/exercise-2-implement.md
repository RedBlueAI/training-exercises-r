# Exercise 2: Implement EDA Visualizations

**Duration:** ~5 minutes
**Mode:** /ImplementFeature
**Target:** `R/02_eda.R` and `analysis/eda_report.Rmd`

## Background

The EDA script has basic plots, but the RMarkdown report has placeholder sections. Use Claude to implement missing visualizations and complete the report.

## Task

Ask Claude to implement the following in the EDA report:

1. **Distribution plots** for all numeric variables with heart disease overlay
2. **Box plots** comparing clinical measurements across disease groups
3. **Missing value visualization** showing patterns
4. **Feature importance preview** using simple group comparisons

## Steps

1. In Claude Code, run:
   ```
   /ImplementFeature "Complete the EDA report with distribution analysis, box plots, missing value visualization, and feature importance preview"
   ```

2. Claude should:
   - Read the existing `R/02_eda.R` for context
   - Complete the TODO sections in `analysis/eda_report.Rmd`
   - Use ggplot2 for all visualizations
   - Add proper labels, titles, and themes

3. After Claude writes the code, render the report in RStudio:
   ```r
   rmarkdown::render("analysis/eda_report.Rmd")
   ```

4. Open the HTML output and review the visualizations

## Expected Output

- Rendered HTML report with interactive table of contents
- At least 4 new visualization panels
- Summary statistics table
- Key findings section with data-driven observations

## Bonus

Ask Claude: "What patterns in the data suggest which features will be most predictive of heart disease?"
