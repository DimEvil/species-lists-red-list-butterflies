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


rawdataset <- read.csv("./data/dataset.txt", sep = ";")

rawdataset %<>%
  rename(scientificNameLocal = SpeciesnameLocal,
         scientificName = SpeciesnameEurope)

DwcTaxonList <- rawdataset %>% 
  select(scientificNameLocal, scientificName) %>%
  distinct(scientificNameLocal, .keep_all = TRUE)

DwcTaxonBE <- rawdataset %>% 
  filter(CountryCode == 'BE') %>%
  select(-Endemic)
  
vdigest <- Vectorize(digest)
DwcTaxonList %<>% mutate(license = "http://creativecommons.org/publicdomain/zero/1.0/", 
                     rightsHolder = "INBO", accessRights = "http://www.inbo.be/en/norms-for-data-use", 
                     datasetName = "Butterfly Species List Europe", occurrencestatus = "present", language = 'EN', 
                     datasetID = "DOI", kingdom = "Animalia", phylum = "Artropoda" , class = 'Insecta" ' )
DwcTaxonList <- gbif_species_name_match(DwcTaxonList, name_col = "scientificName", gbif_terms= c('usageKey','scientificName','rank','order','matchType', 'phylum', 'kingdom','genus','class','confidence',  'synonym','status','family'))

write.csv(DwcTaxonList, file = "dwc_taxon_file.csv", na = "", row.names = FALSE, fileEncoding ="UTF-8")

