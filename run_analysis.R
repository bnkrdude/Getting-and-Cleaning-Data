###############################################################################
##################### Getting & Cleaning Data Course Project ##################
###############################################################################

# Housekeeping
# Clear out datafiles, Load packages and assign file/path names

setwd("/Users/Glenn/RCode")
rm(list=ls())

library(dplyr)
library(jpeg)
library(tidyr)
library(lubridate)
library(data.table)

zipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if(!dir.exists("C3ProjData")) {dir.create("./C3ProjData")}


path <- paste0(getwd(),"/C3ProjData")
setwd(path)

# Download files and read them in to R
if(!file.exists("ProjData.zip")) {
      download.file(zipURL, destfile = "./ProjData.zip", method="curl")
      unzip("ProjData.zip") 
  }

################# Read in Features and Activity files ######################

features <- read.table("./UCI HAR Dataset/features.txt")
actlabels <-read.table("./UCI HAR Dataset/activity_labels.txt")

################ Read in Test Data #########################################

subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
activitytest<- read.table("./UCI HAR Dataset/test/y_test.txt")

################ Read in Training Data ####################################

subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
activitytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")

############# Put descriptive activity labels on data ###############

colnames(xtest) <-features[,2]   # adds column names to xtest
colnames(subjecttest) <- "subjectID"  # adds column name to subject
colnames(xtrain) <-features[,2]   # adds column names to xtrain
colnames(subjecttrain) <- "subjectID"  # adds column name to subject

##################  Create Combined Data Frame ####################

alltest <- cbind(subjecttest,activitytest,xtest)
alltrain <- cbind(subjecttrain,activitytrain,xtrain)

alldata <- rbind(alltest,alltrain)

colnames(alldata)[2] <- "activity"  # rename column

############ Makes activity variable a Factor and gives meaningful names

alldata$activity <- as.factor(alldata$activity)
actlabels <- actlabels[,2]
levels(alldata$activity) <-actlabels

# Remove test and train datasets to save memory

rm(alltest,alltrain,xtrain,xtest,subjecttrain,subjecttest,activitytest,activitytrain)  

############# Create Dataset with only Mean and Std #########

x <- grep("mean()",names(alldata))
y <- grep("std()",names(alldata))
z <- sort(c(x,y))
rm(x,y)

meanstd <- alldata[c(1,2,z)]

#############  Create dataset for the average activity for each subject 

sumoutput <- meanstd %>% group_by(subjectID,activity) %>%
      summarise_all(funs(mean)) %>%
      arrange(subjectID,activity)

write.csv(sumoutput, "tidydata.csv", row.names = FALSE)




