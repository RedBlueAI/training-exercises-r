# Session 10: Data Governance & Reproducibility

**Duration:** ~20 minutes
**Focus:** Data governance, reproducibility, and quality standards for R data science

## Learning Objectives

- Audit data science code for reproducibility issues
- Implement data governance practices
- Establish quality gates for analysis code

## Background

Unlike Session 10 in the software engineering track (which focuses on security vulnerabilities), this session focuses on the data science equivalents: **reproducibility failures, data governance gaps, and analytical quality issues**.

## Exercises

### Exercise 1: Reproducibility Audit (10 min)

Audit the legacy code for reproducibility issues:

```
/RunSecurityAudit scope="full"
```

Then manually review `R/legacy/heart_analysis_v1.R` for these **10 reproducibility issues**:

1. [ ] **No random seed** - Results change every run
2. [ ] **Hardcoded absolute paths** - Won't work on other machines
3. [ ] **No package versions** - No renv.lock or sessionInfo()
4. [ ] **No environment capture** - OS, R version not recorded
5. [ ] **Results not saved** - Only printed to console
6. [ ] **No data provenance** - No record of data source or version
7. [ ] **Global variable dependencies** - Functions rely on global state
8. [ ] **No documentation** - No comments explaining methodology choices
9. [ ] **Data leakage** - Preprocessing before split makes results non-reproducible
10. [ ] **No version control integration** - No git tags for analysis versions

### Exercise 2: Data Governance Checklist (5 min)

Review the project against this data governance checklist:

See `governance-checklist.md` for the full checklist.

Score the current project:
- Data Classification: Is the data properly classified?
- Access Controls: Are there appropriate access restrictions?
- Data Dictionary: Is every variable documented?
- Lineage Tracking: Can you trace data from source to output?
- Retention Policy: How long should data be kept?
- Ethics Review: Has the analysis been reviewed for bias?

### Exercise 3: Implement Reproducibility Fixes (5 min)

Ask Claude to add reproducibility to the clean analysis pipeline:

```
Review R/01_load_data.R through R/05_validation.R and add:
1. Proper seed setting at the top of each script
2. sessionInfo() capture at the end of the pipeline
3. A reproducibility manifest that records the analysis environment
```

## Key Takeaway

In data science, "security" means ensuring your results are **reproducible, governed, and auditable**. A model that can't be reproduced is as dangerous as insecure code - it can lead to wrong decisions with real-world consequences.
