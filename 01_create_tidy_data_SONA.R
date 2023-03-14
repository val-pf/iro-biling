####### combine SONA data
require(psych)
require(car)
require(ez)
require(tidyverse)
require(ordinal)

setwd("M:/Valeria/irony_bilinguals/SONA_data")


response1R <- read.table("SONA_LIST-1R.csv", header=TRUE, sep=",") 
summary(response1R)
response1R.long <- response1R %>% 
  select(-c(order, label)) %>% #selects all columns except order & label
  pivot_longer(cols = -c(literality, list, rating, language, org.item),
               names_to = "Subject",
               values_to = "response")
response1R.long$Subject <- paste(response1R.long$Subject, "1R", sep = '_')
response1R.long


response2R <- read.table("SONA_LIST-2R.csv", header=TRUE, sep=",") 
summary(response2R)
response2R <-subset(response2R, select = -c(order,label))
response2R
response2R.long <- response2R %>% 
  pivot_longer(cols = -c(literality, list, rating, language, org.item),
               names_to = "Subject",
               values_to = "response")
response2R.long$Subject <- paste(response2R.long$Subject, "2R", sep = '_')
response2R.long


response3R <- read.table("SONA_LIST-3R.csv", header=TRUE, sep=",") 
summary(response3R)

response3R <-subset(response3R, select = -c(order,label))
response3R
response3R.long <- response3R %>% 
  pivot_longer(cols = -c(literality, list, rating, language, org.item),
               names_to = "Subject",
               values_to = "response")
response3R.long$Subject <- paste(response3R.long$Subject, "3R", sep = '_')
response3R.long

response4R <- read.table("SONA_LIST-4R.csv", header=TRUE, sep=",") 
summary(response4R)
#response4R <- drop_na(response4R)
response4R.long <- response4R %>% 
  select(-c(order, label)) %>% #selects all columns except average
  pivot_longer(cols = -c(literality, list, rating, language, org.item),
               names_to = "Subject",
               values_to = "response")
response4R.long$Subject <- paste(response4R.long$Subject, "4R", sep = '_')
response4R.long

##################################
# bind response dataframes together 
response_all <- rbind(response1R.long, response2R.long, response3R.long, response4R.long)
response_all

write.csv(response_all, "SONA_response_tidy.csv")
