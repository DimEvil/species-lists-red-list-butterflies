# National checklists and red lists for European butterflies

## Rationale

This repository contains the functionality to standardize the _National checklists and red lists for European butterflies_ to a [Darwin Core checklist](https://www.gbif.org/dataset-classes) that can be harvested by [GBIF](http://www.gbif.org).

The repository also includes the script to integrate red lists, calculate weighted red list values, and create the tables and figures for [Maes et al. (2019)](https://doi.org/10.1007/s10841-019-00127-z).

## Workflow

[source data](data/raw) (maintained as a [Google Spreadsheet](https://docs.google.com/spreadsheets/d/1RvxpOYf2ZrTu9nsTLumoi-G-GGhh6_lV37TNtPiVES4/edit?usp=sharing)) → Darwin Core [mapping script](src/dwc_mapping.Rmd) → generated [Darwin Core files](data/processed)

[source data](data/raw) → [analysis script](src/integrating_rl.Rmd) → [tables and figures for Maes et al. (2019)](reports)

## Published dataset

...

## Repo structure

The repository structure is based on [Cookiecutter Data Science](http://drivendata.github.io/cookiecutter-data-science/) and the [Checklist recipe](https://github.com/trias-project/checklist-recipe). Files and directories indicated with `GENERATED` should not be edited manually.

```
├── README.md              : Description of this repository
├── LICENSE                : Repository license
├── eurobutt-checklist.Rproj : RStudio project file
├── .gitignore             : Files and directories to be ignored by git
│
├── data
│   ├── raw                : Source data from Google Spreadsheet, input for scripts GENERATED
│   ├── interim            : Interim data created for analysis GENERATED
│   └── processed          : Darwin Core output of mapping script GENERATED
│
├── docs                   : Repository website GENERATED
│
├── reports                : Figures and tables as output of analysis GENERATED
│
└── src
    ├── dwc_mapping.Rmd    : Darwin Core mapping script
    ├── integrating_rl.Rmd : Analysis script to integrate red lists
    ├── _site.yml          : Settings to build website in docs/
    └── index.Rmd          : Template for website homepage
```

## Installation

1. Clone this repository to your computer
2. Open the RStudio project file
3. Open the `dwc_mapping.Rmd` [R Markdown file](https://rmarkdown.rstudio.com/) in RStudio
4. Install any required packages
5. Click `Run > Run All` to generate the processed data
6. Alternatively, click `Build > Build website` to generate the processed data and build the website in `docs/`

## Contributors

[List of contributors](https://github.com/inbo/eurobutt-checklist/contributors)

## License

[MIT License](https://github.com/inbo/eurobutt-checklist/blob/master/LICENSE)
