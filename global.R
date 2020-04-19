#======================================
# Paquetes
#======================================

library(caret)
library(doSNOW)
library(shiny)
library(ggplot2)
library(markdown)
library(shinythemes)

#======================================
# Modulos
#======================================

source("modules/train.R")
source("modules/data.R")
source("modules/predict.R")

#======================================
# Archivos
#======================================

train <- read.csv("insurance.csv")

sets <- split()

insurance.train <- sets$insurance.train
insurance.test <- sets$insurance.test
