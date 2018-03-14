

library(tidyverse)

dataset <- read.csv("~/GitHub/species-lists-red-list-butterflies/species-lists-red-list-butterflies/Data/dataset.txt", sep=";")

DwcTaxon <- dataset[,c(1,2)]
DwcTaxonBE <- select(filter(dataset, CountryCode == 'BE'),c(1,2,3,4))

