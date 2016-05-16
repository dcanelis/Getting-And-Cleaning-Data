## The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.
## 
## Data for the project:
##         
##         https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## 
## Project description: Create one R script called run_analysis.R that does the following.
## 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### preparing the environment ###

setwd("/Users/davecanelis/Documents/CourseraData/getting-and-cleaning-data/course-project")

#download data
library(httr) 
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file <- "project.zip"
if(!file.exists(file)){
        print("downloading files")
        download.file(url, file, method="curl")
}

#unzip and create folders for the data sets and results(if they don't exist)
datafolder <- "UCI HAR Dataset"
resultsfolder <- "results"
if(!file.exists(datafolder)){
        print("unzip file")
        unzip(file, list = FALSE, overwrite = TRUE)
} 
if(!file.exists(resultsfolder)){
        print("create results folder")
        dir.create(resultsfolder)
} 

#read txt files and covnert to data.frame ("data")
createDF <- function (filename,cols = NULL){
        print(paste("Getting table:", filename))
        f <- paste(datafolder,filename,sep="/")
        data <- data.frame()
        if(is.null(cols)){
                data <- read.table(f,sep="",stringsAsFactors=F)
        } else {
                data <- read.table(f,sep="",stringsAsFactors=F, col.names= cols)
        }
        data
}

#run and check createDF
features <- createDF("features.txt")

#read data and build database
getdata <- function(type, features){
        print(paste("Getting data", type))
        subject_data <- createDF(paste(type,"/","subject_",type,".txt",sep=""),"id")
        y_data <- createDF(paste(type,"/","y_",type,".txt",sep=""),"activity")
        x_data <- createDF(paste(type,"/","X_",type,".txt",sep=""),features$V2)
        return (cbind(subject_data,y_data,x_data))
}

#run and check getdata
test <- getdata("test", features)
train <- getdata("train", features)

#Save the resulting data in the results folder
saveresults <- function (data,name){
        print(paste("saving results", name))
        file <- paste(resultsfolder, "/", name,".csv" ,sep="")
        write.csv(data,file)
}

### Project requirements ###

#1) Merge the training and the test data sets to create one data set.
library(plyr)
data <- rbind(train, test)
data <- arrange(data, id)

#2) Extracts the measurements for the mean and standard deviation for each measurement. 
mean_and_std <- data[,c(1,2,grep("std", colnames(data)), grep("mean", colnames(data)))]
saveresults(mean_and_std,"mean_and_std")

#3) Use descriptive activity names to name the activities in the data set
##  Create a data frame with the descriptive activity names form the txt file
activity_labels <- createDF("activity_labels.txt")

#4) Appropriately label the data set with descriptive variable names. 
data$activity <- factor(data$activity, levels=activity_labels$V1, labels=activity_labels$V2)

#5) Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
tidy_dataset <- ddply(mean_and_std, .(id, activity), .fun=function(x){ colMeans(x[,-c(1:2)]) })
colnames(tidy_dataset)[-c(1:2)] <- paste(colnames(tidy_dataset)[-c(1:2)], "_mean", sep="")
saveresults(tidy_dataset,"tidy_dataset")