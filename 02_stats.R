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
