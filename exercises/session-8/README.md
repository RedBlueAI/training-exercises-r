# Session 8: Work Breakdown & Cycle Planning

**Duration:** ~30 minutes
**Focus:** Breaking data science work into manageable tasks

## Learning Objectives

- Break an analysis plan into concrete work items
- Plan a 2-week analysis cycle with realistic capacity
- Handle scope changes in data science projects

## Exercises

### Exercise 1: Work Breakdown (10 min)

Using the validated analysis plan from Session 7:

```
/Breakdown
```

Expected work items for heart disease analysis:
1. Data loading and quality assessment (2h)
2. Missing value analysis and imputation (3h)
3. Exploratory data analysis - univariate (3h)
4. Exploratory data analysis - bivariate (3h)
5. Feature engineering and preprocessing (4h)
6. Baseline model (logistic regression) (2h)
7. Advanced model (random forest) (3h)
8. Model validation and comparison (4h)
9. Statistical testing of risk factors (3h)
10. Results documentation and reporting (4h)
11. Reproducibility packaging (2h)

### Exercise 2: Cycle Planning (10 min)

Plan a 2-week cycle with this team:

```
/CyclePlan
```

**Team:**
- **Sarah** (Senior Data Scientist): 10 days, leads modeling and validation
- **James** (Mid Data Scientist): 8 days (2 days on-call), handles EDA and feature engineering
- **Alex** (Junior Analyst): 10 days, handles data prep and documentation

Capacity: Sarah 80h, James 48h, Alex 60h = 188h total

### Exercise 3: Scope Change Scenarios (10 min)

After planning, handle these changes:

1. **New requirement:** "We also need to analyze the dataset by age groups (young, middle, senior). Add age-stratified analysis."
2. **Team change:** Sarah is pulled into a different project for 3 days. Reallocate work.
3. **Data issue:** During EDA, you discover 15% of cholesterol values look suspicious. Add a data quality investigation task.

```
/CycleStatus
```

Review how the plan adjusts to each scenario.

## Completion Checklist

- [ ] Analysis broken into 8-12 concrete tasks
- [ ] 2-week cycle planned with team capacity
- [ ] Successfully handled at least one scope change
