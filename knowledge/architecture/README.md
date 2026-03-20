# Architecture

This directory contains architecture documentation for the analysis project.

## Analysis Pipeline

```
01_load_data.R --> 02_eda.R --> 03_preprocessing.R --> 04_modeling.R --> 05_validation.R
                     |                                       |                |
                     v                                       v                v
              output/figures/                          Trained Models   output/tables/
              output/tables/                                            docs/reports/
```

## Key Design Decisions

1. **Numbered scripts**: Pipeline runs in sequence (01-05)
2. **tidymodels for ML**: Consistent interface for preprocessing + modeling + validation
3. **Separated raw/processed data**: Raw data is immutable
4. **RMarkdown for reports**: Reproducible, rendered documents
5. **testthat for testing**: Standard R testing framework
