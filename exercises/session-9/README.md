# Session 9: AI-Assisted Research & Analysis Plan Creation

**Duration:** ~30 minutes
**Focus:** Creating analysis plans from vague requirements

## Learning Objectives

- Transform vague stakeholder requests into structured analysis plans
- Use AI to research appropriate methodologies
- Create complete, validatable analysis plans

## Scenario

You receive this message from a clinical director:

> "We've been collecting patient data for years but never really looked at what predicts readmission. Can you figure out which patients are most likely to come back within 30 days? Leadership wants to reduce readmission rates."

## Exercises

### Exercise 1: Research Phase (10 min)

Use Claude to research:
```
I have a vague request to predict patient readmission within 30 days. Help me research:
1. What are standard approaches for readmission prediction?
2. What features are typically most predictive?
3. What validation metrics are appropriate for this use case?
4. Are there regulatory considerations (CMS penalties)?
5. What sample size would we need?
```

### Exercise 2: Draft Analysis Plan (15 min)

Create a new analysis plan:
```
/CreateAnalysisPlan patient-readmission-prediction
```

Your plan should include:
- Clear research question with testable hypothesis
- Required data elements
- Proposed methodology (logistic regression, survival analysis?)
- Validation strategy appropriate for clinical use
- Ethical considerations (fairness across demographics)
- Timeline with milestones

### Exercise 3: Self-Validate (5 min)

Run validation on your own plan:
```
/PRDValidate
```

Does your plan pass? What gaps remain?

## Key Takeaway

AI assistance is most valuable in the research phase - quickly surveying literature, identifying standard approaches, and flagging considerations you might miss. The analysis plan you create with AI assistance should be more thorough than one written from scratch.
