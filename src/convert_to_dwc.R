

library(tidyverse) # For data transformations

# None core tidyverse packages:
library(magrittr)  # For %<>% pipes

# Other packages
library(janitor)   # For cleaning input data
library(knitr)     # For nicer (kable) tables
library(readxl)    # To read excel files
library(stringr)   # To perform string operations
library(digest)    # To generate hashes

rawdataset <- read.csv("~/GitHub/species-lists-red-list-butterflies/species-lists-red-list-butterflies/Data/dataset.txt", sep=";")

DwcTaxon <- rawdataset[,c(1,2)]
DwcTaxonBE <- select(filter(rawdataset, CountryCode == 'BE'),c(1,2,3,4))

vdigest <- Vectorize(digest)




