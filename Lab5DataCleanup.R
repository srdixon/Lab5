#SPATIAL DATA LAB 5
#RIVER DIXON
#FEB 26 2019

#LOAD PACKAGES
library(tidyverse)
library(tidyr)
library(dplyr)

#SET WORKING DIRECTORY
setwd("C:/Users/riverdixon/Documents/Grad/Classes/Spring 2019/Spatial Analysis and Management/Lab5")

#READ DATA
Alaska = read.csv("Alaska.csv", header = TRUE)
GOM    = read.csv("GOM.csv", header = TRUE)
Peru   = read.csv("Peru.csv", header = TRUE)