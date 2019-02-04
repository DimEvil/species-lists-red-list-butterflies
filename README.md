# National checklists and red lists for prioritising European butterfly conservation actions

## Rationale

This repository contains the functionality to standardize the _National checklists and red lists for prioritising European butterfly conservation actions_ (Maes et al. 2019) to a [Darwin Core checklist](https://www.gbif.org/dataset-classes) that can be harvested by [GBIF](http://www.gbif.org).

The repository also includes the script used to calculate the weighted red list categories as used in Maes et al. (2019).

## Workflow

[source data](data/raw) (maintained as a [Google Spreadsheet](https://docs.google.com/spreadsheets/d/1RvxpOYf2ZrTu9nsTLumoi-G-GGhh6_lV37TNtPiVES4/edit?usp=sharing)) → Darwin Core [mapping script](src/dwc_mapping.Rmd) → generated [Darwin Core files](data/processed)

[source data](data/raw) → [script](src/wrl_values.Rmd) to calculate weighted red list values → [weighted red list values table](data/processed/wrl_values.csv)

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
│   └── processed
│       ├── *.csv          : Darwin Core output of mapping script GENERATED
│       └── wrl_values.csv : Output of weighted red list values script
│
├── docs                   : Repository website GENERATED
│
└── src
    ├── dwc_mapping.Rmd    : Darwin Core mapping script
    ├── wrl_values.Rmd     : Script to dynamically calculate weighted red list values
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
