# Focus Modes for R Data Science

| Focus Mode | What Claude Prioritizes | Best For |
|------------|------------------------|----------|
| default | Full project overview, all scripts and data | General exploration |
| eda | Dataset structure, data dictionary, EDA scripts | Starting new analysis |
| bug | Legacy code, error patterns, test files | Debugging R code |
| feature | Analysis plans, modeling scripts, existing pipeline | Adding new analyses |
| refactor | Code quality, anti-patterns, style issues | Modernizing R code |
| review | All changed files, test coverage, documentation | Pre-commit review |

## R-Specific Context Claude Loads

- `.Rproj` file for project settings
- `renv.lock` for package versions
- `DESCRIPTION` or package dependencies
- Data dictionaries in data/raw/
- RMarkdown YAML headers for report structure
- testthat test files for coverage understanding
