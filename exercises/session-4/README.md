# Session 4: Session Start - Context-Aware Development

**Duration:** ~20 minutes
**Focus:** Understanding how Claude loads R project context and using focus modes

## Learning Objectives

- Understand how /StartSession analyzes R project structure
- Use focus modes for different data science tasks
- Optimize context for R-specific workflows

## Exercises

### Exercise 1: Baseline Session Start (5 min)

1. Run `/StartSession` and observe:
   - Does Claude detect the .Rproj file?
   - Does it identify the R scripts in R/?
   - Does it read the data dictionary?
   - Does it notice the legacy code issues?
2. Note the time and what context was loaded

### Exercise 2: Focus Mode Comparison (10 min)

Try starting sessions with different focus contexts. In Claude Code:

**EDA Focus:**
```
/StartSession --focus eda
```
Ask Claude: "What does the heart disease dataset look like? What should I explore first?"

**Bug Fix Focus:**
```
/StartSession --focus bug
```
Ask Claude: "Review R/legacy/heart_analysis_v1.R for issues"

**Modeling Focus:**
```
/StartSession --focus feature
```
Ask Claude: "I need to build a prediction model for heart disease. What's the current state of the modeling pipeline?"

**Compare:** How does Claude's response differ across focus modes?

### Exercise 3: R Project Context (5 min)

1. Open a new Claude Code session
2. Ask: "What R packages does this project use?"
3. Ask: "Describe the analysis pipeline from data loading to validation"
4. Observe how Claude reads the R scripts to understand the workflow
5. Note: Claude should identify the numbered script sequence (01-05)

## Key Takeaway

Claude understands R project conventions - .Rproj files, package dependencies, script ordering, and RMarkdown reports. The focus mode helps Claude prioritize what context to load for your current task.
