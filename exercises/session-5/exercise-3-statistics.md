# Exercise 3: Statistical Test Selection Brainstorm

**Duration:** ~5 minutes
**Mode:** Natural conversation (Brainstorm)
**Context:** Statistical analysis of heart disease risk factors

## Background

You need to determine which clinical measurements are significantly associated with heart disease. This requires choosing the right statistical tests for different variable types and checking assumptions.

## The Challenge

The heart disease dataset has both numeric and categorical predictors. For each, you need:
1. The appropriate statistical test
2. Assumption verification
3. Proper interpretation

## Steps

1. Start a brainstorm conversation with Claude:
   ```
   I need to test which variables in the heart disease dataset are significantly associated with the outcome. The dataset has:
   - Numeric: age, resting_bp, cholesterol, max_heart_rate, st_depression
   - Categorical: sex, chest_pain_type, fasting_blood_sugar, resting_ecg, exercise_angina, st_slope, thalassemia
   - Target: heart_disease (binary)

   Help me choose the right tests and handle multiple comparisons.
   ```

2. Discuss with Claude:
   - Why t-test may not be appropriate for all numeric variables
   - When to use Wilcoxon rank-sum vs t-test
   - Chi-squared vs Fisher's exact for categorical variables
   - How to correct for multiple comparisons (Bonferroni vs FDR)
   - Effect size measures for each test type

3. Ask Claude to write the complete statistical testing code:
   ```
   Write the R code to run all appropriate tests with assumption checking and multiple comparison correction
   ```

4. Compare Claude's approach to the legacy code's approach (which uses t-tests for everything, including categorical variables!)

## Key Questions to Explore

- "Should I check normality before choosing parametric vs non-parametric?"
- "How many comparisons am I running, and what's my corrected alpha?"
- "Which effect size measure is appropriate for each test?"
- "How do I report these results in a publication-ready format?"

## Expected Insight

Students should understand that:
- Different variable types require different tests
- Assumptions must be checked before running parametric tests
- Multiple testing correction is essential when running many tests
- Effect sizes matter more than p-values for practical significance
