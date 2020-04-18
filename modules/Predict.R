#======================================
# Paquetes
#======================================

library(caret)
library(doSNOW)
library(shiny)

#======================================
# Modulos
#======================================

source("modules/Train.R")
source("modules/DataWrangling.R")
source("modules/Predict.R")

#======================================
# Archivos
#======================================

train <- read.csv("train.csv")
