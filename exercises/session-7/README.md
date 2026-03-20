# Session 7: Analysis Plan Validation

**Duration:** ~25 minutes
**Focus:** Validating data science analysis plans for completeness

## Learning Objectives

- Use PRD validation commands for data science analysis plans
- Identify gaps in analysis specifications
- Enrich analysis plans with technical feasibility

## Background

In data science, an "Analysis Plan" serves the same purpose as a PRD in software engineering. It defines:
- Research questions and hypotheses
- Data sources and variables
- Statistical methods
- Validation strategy
- Deliverables

## Exercises

### Exercise 1: Review the Incomplete Plan (5 min)

1. Open `knowledge/prd/heart-disease-prediction.md`
2. Read through it - what seems missing?
3. Note your observations before using AI

### Exercise 2: AI Validation (10 min)

1. Import the analysis plan:
   ```
   /PRDIntake knowledge/prd/heart-disease-prediction.md
   ```

2. Validate for completeness:
   ```
   /PRDValidate
   ```

3. Expected gaps Claude should find:
   - [ ] No sample size justification
   - [ ] Missing data handling strategy undefined
   - [ ] No baseline model specified
   - [ ] Validation strategy incomplete (no mention of stratification)
   - [ ] No reproducibility requirements
   - [ ] Missing data governance / ethics section
   - [ ] No timeline or milestones
   - [ ] Feature engineering plan absent

### Exercise 3: Enrich and Assess Feasibility (10 min)

1. Enrich with technical context:
   ```
   /PRDEnrich
   ```

2. Assess feasibility:
   ```
   /PRDFeasibility
   ```

3. Review Claude's additions - does the enriched plan now cover:
   - Data quality assessment strategy?
   - Appropriate model selection for the data size?
   - Proper cross-validation design?
   - Reproducibility requirements?

## Completion Checklist

- [ ] Identified at least 5 gaps manually
- [ ] PRD validation found additional gaps
- [ ] Enrichment added technical details
- [ ] Feasibility assessment is realistic
