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

data <- read.table("prolific_response_tidy.csv", header=TRUE, sep=",", stringsAsFactors = TRUE) 
summary(data)

data <- na.omit(data)
data$cond <- paste(data$language,data$literality, sep="_")

valence <- subset(data, rating=="Valence")
rel <- subset(data, rating=="Relationship")
iro <- subset(data, rating =="Irony")

describe(valence)
head(valence)

describeBy(valence$response, valence$literality)
describeBy(valence$response, valence$language)
describeBy(valence$response, valence$cond)
class(valence$response)
class(valence$cond)
valence$cond <- as.factor(valence$cond)

plot(valence$cond, valence$response)

### need to make averages per item