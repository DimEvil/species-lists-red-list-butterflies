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


rawdataset <- read.csv("./data/raw/dataset.txt", sep = ";")

rawdataset %<>%
  rename(scientificNameLocal = SpeciesnameLocal,
         scientificNameEU = SpeciesnameEurope,
         threatStatus = RedListCategory)

DwcTaxonListEU <- rawdataset %>% 
  select(scientificNameLocal, scientificNameEU) %>%
  distinct(scientificNameEU, .keep_all = TRUE)     

DwcTaxonListLocal <- rawdataset %>% 
  select(scientificNameLocal, scientificNameEU) %>%
  distinct(scientificNameLocal, .keep_all = TRUE) 

DwcTaxonBE <- rawdataset %>% 
  filter(CountryCode == 'BE') %>%
  select(-Endemic)

DwcDistribution  <- rawdataset

vdigest <- Vectorize(digest)

DwcDistribution %<>% 
  mutate(occurrenceStatus = "present")%>%
  gbif_species_name_match(name_col = "scientificNameEU", 
                          gbif_terms = c('usageKey', 'scientificName', 'rank'))%>%
 mutate(taxonID = paste(usageKey, vdigest (scientificName, algo="md5"), sep=":"))
  

DwcTaxonListLocal %<>% 
  mutate(license = "http://creativecommons.org/publicdomain/zero/1.0/", 
         rightsHolder = "INBO", 
         accessRights = "http://www.inbo.be/en/norms-for-data-use", 
         datasetName = "Butterfly Species List Europe", 
         occurrencestatus = "present", 
         language = 'EN', 
         datasetID = "DOI", 
         kingdom = "Animalia", 
         phylum = "Artropoda" , 
         class = "Insecta") %>%
  gbif_species_name_match(name_col = "scientificNameLocal", 
                          gbif_terms = c('usageKey', 'scientificName', 'rank', 
                                         'order', 'matchType','phylum', 
                                         'kingdom', 'genus','class',
                                         'confidence', 'synonym', 'status',
                                         'family'))%>%
  mutate(taxonID = paste(usageKey, vdigest (scientificName, algo="md5"), sep=":"))

DwcTaxonListEU %<>% 
  mutate(license = "http://creativecommons.org/publicdomain/zero/1.0/", 
         rightsHolder = "INBO", 
         accessRights = "http://www.inbo.be/en/norms-for-data-use", 
         datasetName = "Butterfly Species List Europe", 
         occurrencestatus = "present", 
         language = 'EN', 
         datasetID = "DOI", 
         kingdom = "Animalia", 
         phylum = "Artropoda" , 
         class = "Insecta") %>%
  gbif_species_name_match(name_col = "scientificNameEU", 
                          gbif_terms = c('usageKey', 'scientificName', 'rank', 
                                         'order', 'matchType','phylum', 
                                         'kingdom', 'genus','class',
                                         'confidence', 'synonym', 'status',
                                         'family'))%>%
  mutate(taxonID = paste(usageKey, vdigest (scientificName, algo="md5"), sep=":"))


write.csv(DwcTaxonListEU, file = "./data/interim/dwc_taxon_fileEU.csv", na = "", 
          row.names = FALSE, fileEncoding = "UTF-8")

write.csv(DwcTaxonListLocal, file = "./data/interim/dwc_taxon_fileLocal.csv", na = "", 
          row.names = FALSE, fileEncoding = "UTF-8")

write.csv(DwcDistribution, file = "./data/interim/dwc_distribution.csv", na = "", 
          row.names = FALSE, fileEncoding = "UTF-8")


