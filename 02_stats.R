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

data <- read.table("prolific_response_tidy.csv", header=TRUE, sep=",") 
summary(data)

data <- na.omit(data)