# National checklists and red lists for prioritising European butterfly conservation actions

## Rationale

This repository contains the functionality to standardize the _National checklists and red lists for prioritising European butterfly conservation actions_ (Maes et al. 2019) to a [Darwin Core checklist](https://www.gbif.org/dataset-classes) that can be harvested by [GBIF](http://www.gbif.org) and the script used to calculate the weighted red list categories as used in Maes et al. 2019.

## Workflow

* [source data](data/raw) → Read raw data from google.sheet [script](src/dwc_mapping.Rmd) → [data](data/interim)
* [interim data](data/interim) → Darwin Core [mapping script](src/dwc_mapping.Rmd) → Generated [Darwin Core files](data/processed/dwc)
* [interim data](data/interim) → Calculate weighted red list values [script](weighted_red_list_values.Rmd) → Weighted red list values [table](data/processed/weighted_red_list_values.csv)

## Published dataset

...

## Repo structure

The repository structure is based on [Cookiecutter Data Science](http://drivendata.github.io/cookiecutter-data-science/). Files and directories indicated with `GENERATED` should not be edited manually.

```
├── README.md         : Description of this repository
├── LICENSE           : Repository license
├── .gitignore        : Files and directories to be ignored by git
│
├── data
│   ├── ~~raw~~       : Source data, copy of Google Spreadsheet GENERATED
│   ├── interim       : Source data (csv),input for further scripts GENERATED
│   └── processed
│       ├── dwc       : Darwin Core output of mapping script GENERATED
│       └── weighted_red_list_values.csv : Output of weighted red list values script GENERATED
|       └── images    : Images created in weighted red list value script
|
├── docs              : Repository website GENERATED
│
└── src
    ├── read_data.Rmd : Script to read data and match names with GBIF backbone taxonomy
    ├── dwc_mapping.Rmd : Darwin Core mapping script
    ├── weighted_red_list_values_script.Rmd : Script to dynamically calculate weighted red list values based on gsheets
    ├── weighted_red_list_values.Rmd: legacy script
    └── src.Rproj      : RStudio project file
```

## Installation

1. Clone this repository to your computer
2. Open the RStudio project file
3. Open the `dwc_mapping.Rmd` [R Markdown file](https://rmarkdown.rstudio.com/) in RStudio
4. Install any required packages
5. Click `Run > Run All` to generate the processed data


## Contributors

[List of contributors](https://github.com/inbo/red-lists-european-butterflies-checklist/contributors)

## License

[MIT License](https://github.com/inbo/red-lists-european-butterflies-checklist/blob/master/LICENSE)
