###############
#
# Irony & Bilingualism
#
################

require(psych)
require(car)
require(ez)
require(tidyverse)
require(ordinal)

setwd("M:/Valeria/irony_bilinguals/prolific_data")

### Script to create tidy dataset of all responses

response4R <- read.table("Prolific_LIST4R.csv", header=TRUE, sep=",") 
summary(response4R)
response4R.long <- response4R %>% 
  pivot_longer(cols = -c(literality, list, rating, language, item),
               names_to = "Subject",
               values_to = "response")
response4R.long$Subject <- paste(response4R.long$Subject, "4R", sep = '_')
response4R.long

response4 <- read.table("Prolific_LIST4.csv", header=TRUE, sep=",") 
summary(response4)
response4.long <- response4 %>% 
  pivot_longer(cols = -c(literality, list, rating, language, item),
               names_to = "Subject",
               values_to = "response")
response4.long$Subject <- paste(response4.long$Subject, "4", sep = '_')
response4.long
