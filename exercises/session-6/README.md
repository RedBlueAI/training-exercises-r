# Session 6: Session End & Quality Gates

**Duration:** ~20 minutes
**Focus:** Code review, quality checks, and session documentation for R projects

## Learning Objectives

- Run a complete session lifecycle: Start > Code > Review > End
- Use code review to catch R-specific issues
- Generate session documentation

## Exercises

### Exercise 1: Complete Workflow (15 min)

1. **Start**: `/StartSession`
2. **Code**: Make a small enhancement to `R/02_eda.R`:
   - Add a box plot comparing cholesterol by heart disease status
   - Save it to `output/figures/`
3. **Commit**: Stage and commit your changes
4. **Review**: `/ReviewCode` on your changes
   - Does Claude check for proper ggplot2 usage?
   - Does it verify labels and themes?
   - Does it check that plots are saved correctly?
5. **End**: `/EndSession`
   - Check generated files in `docs/planning/`

### Exercise 2: R-Specific Review Scenario (5 min)

Ask Claude to review `R/03_preprocessing.R`:
```
/ReviewCode R/03_preprocessing.R --focus data-science
```

Look for Claude's feedback on:
- Is the train/test split done correctly?
- Is the recipe properly structured?
- Are there any potential issues with the preprocessing steps?
- Is the random seed set appropriately?

## Completion Checklist

- [ ] Made a code change and committed it
- [ ] Code review completed with R-specific feedback
- [ ] Session ended with documentation generated
- [ ] Session summary saved in docs/planning/
