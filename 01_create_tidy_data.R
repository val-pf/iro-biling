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

##########
########## FEB 23: need to UPDATE to make use of orig.item, not item 
##########
# read in each raw datafile and format to long format
response4R <- read.table("Prolific_LIST4R.csv", header=TRUE, sep=",") 
summary(response4R)

response4R <-subset(response4R, select = -c(order,label,item))
response4R

response4R.long <- response4R %>% 
  pivot_longer(cols = -c(literality, list, rating, language, org.item),
               names_to = "Subject",
               values_to = "response")
response4R.long$Subject <- paste(response4R.long$Subject, "4R", sep = '_')
response4R.long


response4 <- read.table("Prolific_LIST4.csv", header=TRUE, sep=",") 
summary(response4)
response4 <-subset(response4, select = -c(order,label,item))
response4

response4.long <- response4 %>% 
  pivot_longer(cols = -c(literality, list, rating, language, org.item),
               names_to = "Subject",
               values_to = "response")
response4.long$Subject <- paste(response4.long$Subject, "4", sep = '_')
response4.long



response3R <- read.table("Prolific_LIST3R.csv", header=TRUE, sep=",") 
summary(response3R)

response3R <-subset(response3R, select = -c(order,label,item))
response3R
response3R.long <- response3R %>% 
 # select(-average) %>% #selects all columns except average
  pivot_longer(cols = -c(literality, list, rating, language, org.item),
               names_to = "Subject",
               values_to = "response")
response3R.long$Subject <- paste(response3R.long$Subject, "3R", sep = '_')
response3R.long

response3 <- read.table("Prolific_LIST3.csv", header=TRUE, sep=",") 
summary(response3)

response3 <-subset(response3, select = -c(order,label,item))
response3
response3.long <- response3 %>% 
  #select(-order,label,item) %>% #selects all columns except listed
  pivot_longer(cols = -c(literality, list, rating, language, org.item),
               names_to = "Subject",
               values_to = "response")
response3.long$Subject <- paste(response3.long$Subject, "3", sep = '_')
response3.long



response2R <- read.table("Prolific_LIST2R.csv", header=TRUE, sep=",") 
summary(response2R)
response2R <-subset(response2R, select = -c(order,label,item))
response2R
response2R.long <- response2R %>% 
 # select(-order, label, item) %>% #selects all columns except average
  pivot_longer(cols = -c(literality, list, rating, language, org.item),
               names_to = "Subject",
               values_to = "response")
response2R.long$Subject <- paste(response2R.long$Subject, "2R", sep = '_')
response2R.long

response2 <- read.table("Prolific_LIST2.csv", header=TRUE, sep=",") 
summary(response2)
response2.long <- response2 %>% 
  select(-c(order, label, item)) %>% #selects all columns except average
  pivot_longer(cols = -c(literality, list, rating, language, org.item),
               names_to = "Subject",
               values_to = "response")
response2.long$Subject <- paste(response2.long$Subject, "2", sep = '_')
response2.long



response1R <- read.table("Prolific_LIST1R.csv", header=TRUE, sep=",") 
summary(response1R)
response1R.long <- response1R %>% 
  select(-c(order, label, item)) %>% #selects all columns except average
  pivot_longer(cols = -c(literality, list, rating, language, org.item),
               names_to = "Subject",
               values_to = "response")
response1R.long$Subject <- paste(response1R.long$Subject, "1R", sep = '_')
response1R.long

response1 <- read.table("Prolific_LIST1.csv", header=TRUE, sep=",") 
summary(response1)
response1.long <- response1 %>% 
  select(-c(order, label, item)) %>% #selects all columns except average
  pivot_longer(cols = -c(literality, list, rating, language, org.item),
               names_to = "Subject",
               values_to = "response")
response1.long$Subject <- paste(response1.long$Subject, "1", sep = '_')
response1.long

##################################
# bind response dataframes together 
response_R <- rbind(response1R.long, response2R.long, response3R.long, response4R.long)
response_R
response <- rbind(response1.long, response2.long, response3.long, response4.long)
response

#############################
response_all <- rbind(response, response_R)
response_all

write.csv(response_all, "prolific_response_tidy.csv")

