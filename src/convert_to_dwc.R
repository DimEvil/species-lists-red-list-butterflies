

library(tidyverse) # For data transformations

# None core tidyverse packages:
library(magrittr)  # For %<>% pipes

# Other packages
library(janitor)    # For cleaning input data
library(knitr)      # For nicer (kable) tables
library(readxl)     # To read excel files
library(stringr)    # To perform string operations
library(digest)     # To generate hashes
library(rgbif)      # To Match GBIF
library(assertable) # because it sneeded for rGBIF
library(inborutils) # wrap GBIF api data


rawdataset <- read.csv("~/GitHub/species-lists-red-list-butterflies/species-lists-red-list-butterflies/Data/dataset.txt", sep=";")

names(rawdataset)[1] <- "scientificNameLocal"
names(rawdataset)[2] <- "scientificName"  #is scientificName EU commit

DwcTaxon <- rawdataset[,c(1,2)]
DwcTaxonList <- distinct(DwcTaxon, scientificNameLocal, scientificName, keep_all=true)
DwcTaxonBE <- select(filter(rawdataset, CountryCode == 'BE'),c(1,2,3,4))

vdigest <- Vectorize(digest)
DwcTaxonList %<>% mutate(license = "http://creativecommons.org/publicdomain/zero/1.0/", 
                     rightsHolder = "INBO", accessRights = "http://www.inbo.be/en/norms-for-data-use", 
                     datasetName = "Butterfly Species List Europe", occurrencestatus = "present", language = 'EN', 
                     datasetID = "DOI", kingdom = "Animalia", phylum = "Artropoda" , class = 'Insecta" ' )
DwcTaxonList <- gbif_species_name_match(DwcTaxonList, name_col = "scientificName", gbif_terms= c('usageKey','scientificName','rank','order','matchType', 'phylum', 'kingdom','genus','class','confidence',  'synonym','status','family'))


