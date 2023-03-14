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
require(emmeans) #posthoc for OLMM

setwd("M:/Valeria/irony_bilinguals/prolific_data")
<<<<<<< HEAD

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
=======
data <- read.table("prolific_response_tidy.csv", header=TRUE, sep=",") 
summary(data)

# OR 
prolific <- read_csv("prolific_response_tidy.csv")
summary(prolific)

data <- na.omit(data)

## recode characters to factors
prolific$language <- as.factor(prolific$language)
prolific$literality <- as.factor(prolific$literality)
prolific$rating <- as.factor(prolific$rating)


prolific$literality <- relevel(prolific$literality, ref="literal")
prolific$response_fac <- as.factor(prolific$response) #only for OLMM

## making subsets for each kind of rating
valence <- subset(prolific, rating=="Valence")
summary(valence)
relationship <- subset(prolific, rating=="Relationship")
summary(relationship)
ironicity <- subset(prolific, rating=="Irony")
summary(ironicity)


m1 <- clmm(response+fac ~ literality + language  + 
             (1|Subject) + (1|item), data=valence)
summary(m1)

describeBy(valence$response, valence$literality)
?describeBy


posthoc = emmeans(m1,~ literality + language)
pairs(posthoc, adjust= "tukey")
>>>>>>> 1565e550699571fcfe2318c5151dee1356b224c4
