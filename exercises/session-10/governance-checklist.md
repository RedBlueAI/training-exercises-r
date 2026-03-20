# Data Governance Checklist for R Projects

## Data Classification
- [ ] Data sensitivity level documented (public, internal, confidential, restricted)
- [ ] PII/PHI fields identified and flagged
- [ ] Data use agreement or license documented
- [ ] Synthetic vs. real data clearly labeled

## Data Quality
- [ ] Data dictionary exists with all variables defined
- [ ] Missing value patterns documented
- [ ] Known data quality issues listed
- [ ] Data validation rules defined and enforced

## Reproducibility
- [ ] Random seeds set for all stochastic operations
- [ ] `renv.lock` or equivalent captures package versions
- [ ] `sessionInfo()` recorded with every analysis run
- [ ] Relative paths used everywhere (`here::here()`)
- [ ] Analysis can be re-run from scratch and produce same results
- [ ] Git commits tag each analysis milestone

## Provenance & Lineage
- [ ] Data source documented (URL, database, API)
- [ ] Data download/extraction date recorded
- [ ] All transformations documented in code
- [ ] Intermediate outputs can be traced to source

## Access & Security
- [ ] No credentials hardcoded in scripts
- [ ] `.gitignore` prevents sensitive data from being committed
- [ ] `.Renviron` used for secrets (and excluded from git)
- [ ] Data files have appropriate permissions

## Ethics & Fairness
- [ ] Analysis checked for demographic bias
- [ ] Model fairness metrics computed across groups
- [ ] Limitations clearly documented
- [ ] Results interpreted with appropriate caveats

## Documentation
- [ ] README explains how to reproduce the analysis
- [ ] Analysis plan exists in knowledge/prd/
- [ ] Methods section suitable for publication
- [ ] All figures have proper labels and captions
