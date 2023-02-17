### merged data

require(tidyverse)
require(readr)
sem <- function(x){ sd(x)/sqrt(length(x)) }

setwd("C:/Users/vpfeifer/Desktop/iro-biling")


SONA <- read.csv("SONA_response_tidy.csv", header=TRUE, sep=",",
                 stringsAsFactors = TRUE) 
summary(SONA)

Prolific <- read.csv("prolific_response_tidy.csv", header=TRUE, sep=",",
                     stringsAsFactors = TRUE)
summary(Prolific)

biling <- rbind(Prolific, SONA)
view(biling)

write.csv(biling, "all_biling_tidy.csv")

biling <- na.omit(biling)
biling$cond <- paste(biling$language, biling$literality, sep="_")

valence <- subset(biling, rating=="Valence")
rel <- subset(biling, rating=="Relationship")
iro <- subset(biling, rating =="Irony" | rating=="Ironicity")

resp_stats <- valence %>%
  group_by(cond) %>%
  summarize(ave_Rat = mean(response),Rat_se = sem(response))
resp_stats
describeBy(valence$response, valence$literality)
describeBy(valence$response, valence$language)
describeBy(valence$response, valence$cond)
describeBy(valence$response, valence$source)

valence$literality <- relevel(valence$literality, ref="literal")
levels(valence$literality)

modelm <- lm(response~language*literality*source, data=valence)
summary(modelm)

aov <- aov(response~language*literality*source, data=iro)
summary(aov)
