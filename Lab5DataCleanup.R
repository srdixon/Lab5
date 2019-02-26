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

#CLEANUP PERU
Peru$month   = str_pad(Peru$month, 2, pad = "0")   #pad months with a 0 to make them 2-digit months
Peru         = Peru %>% select(-Date)              #delete unneccessary date column
Peru         = Peru %>% rename(lat  = LAT)         #un-capitalize lat column name
Peru         = Peru %>% rename(long = LONG)        #"           " long "       "
Peru         = Peru %>% select(c(long, lat, month, year)) #get rid of random NA columns at end

head(Peru)                                         #check that it worked

#Now convert to decimal degrees
t   = str_sub(Peru$long, start = -1)
t1  = str_split_fixed(Peru$long, pattern = "W", n = 3)       #removes W
t2  = str_split_fixed(string = t1[,1], pattern = "°", n = 2) #split degrees and miutes
lon = (as.numeric(t2[,2])/60) + as.numeric(t2[,1]) * -1


r   = str_sub(Peru$lat, start = -1)
r1  = str_split_fixed(Peru$lat, pattern = "S", n = 3)        #removes W
r2  = str_split_fixed(string = r1[,1], pattern = "°", n = 2) #split degrees and miutes
lat = (as.numeric(r2[,2])/60) + as.numeric(r2[,1]) * -1

Peru$long = lon
Peru$lat  = lat

head(Peru)
