#SPATIAL DATA LAB 5
#RIVER DIXON
#FEB 26 2019

#LOAD PACKAGES
library(tidyverse)
library(tidyr)
library(dplyr)
library(stringr)

#SET WORKING DIRECTORY
setwd("C:/Users/riverdixon/Documents/Grad/Classes/Spring 2019/Spatial Analysis and Management/Lab5")

#READ DATA
Alaska = read.csv("Alaska.csv", header = TRUE)
GOM    = read.csv("GOM.csv", header = TRUE)
Peru   = read.csv("Peru.csv", header = TRUE)

#CLEANUP ALASKA
Alaska       = Alaska %>% select (-Year)           #drop one of the two year columns
Alaska$month = str_pad(Alaska$month, 2, pad = "0") #pad months with a 0 to make them 2-digit months
Alaska       = na.omit(Alaska)                     #clear out NA's

head(Alaska)                                       #check that it worked
tail(Alaska)                                       #check that it worked

#CLEANUP GOM
GOM$Month    = str_pad(GOM$Month, 2, pad = "0")    #pad months with a 0 to make them 2-digit months
GOM          = na.omit(GOM)                        #clear out NA's

head(GOM)                                          #check that it worked
