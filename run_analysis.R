## run_analysis.R script for Coursera Course "Getting and Cleaning Data"

## You should create one R script called run_analysis.R that does the following. 
## 1.Merges the training and the test sets to create one data set
## 2.Extracts only the measurements on the mean and standard deviation for each measurement
## 3.Uses descriptive activity names to name the activities in the data set
## 4.Appropriately labels the data set with descriptive variable names 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

## This script assumes that youo have extracted the dataset as per the Readme.MD file

## Load the libray (data.table) needed for this R Script to work - The user will need this installed
library(data.table)

######################################################################
## Step 1 - Merge the training and test sets to create one data set ##
######################################################################

## Read the training data in the train directory - assign this to a variable called datatrain
## Data set 'train/X_train.txt': Training set
## Data set 'train/y_train.txt': Training labels
## Data set 'subject_train.txt': Subject Train labels

datatrain = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
datatrain[,562] = read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
datatrain[,563] = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

## Read the test data in the test directory - assign this to a variable called datatest
## Data set 'test/X_test.txt': Test set
## Data set 'test/y_test.txt': Test labels
## Data set 'subject_test.txt': Subject Test labels

datatest= read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
datatest[,562] = read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
datatest[,563] = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

## Read the features data in the dataset directory - assign this to a variable called datafeatures
## Data set 'features.txt': List of all features

datafeature <- read.table("./UCI HAR Dataset/features.txt")[,2]

## Read the activity labels data in the dataset directory - assign this to a variable called datalabels
## Data set 'activity_labels.txt': Links the class labels with their activity name

datalabels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

## Merge the two data sets - datatrain and datatest - merge into a variable called datatotal

datatotal <- rbind(datatrain, datatest)


#####################################################################################################
## Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement ##
#####################################################################################################

## Using the sapply function extract the mean data from the merged output 'datatotal' and assign to variable datamean

datamean<-sapply(datatotal,mean,na.rm=TRUE)

## Using the sapply function extract the standard data from the merged output 'datatotal' and assign to variable datastandard

datastandard<-sapply(datatotal,sd,na.rm=TRUE)


#####################################################################################
## Step 3 - Uses descriptive activity names to name the activities in the data set ##
#####################################################################################

## Give the column names in the datalabels variable names of 'activity-id' and 'activity_type'
colnames(datalabels) <- c("activity_id", "activity_type")


################################################################################
## Step 4 - Appropriately label the data set with descriptive variable names ##
################################################################################

## Put the datalabels into the datamean variable
datamean <- merge(datamean, datalabels)

## Put the datalabels into the datastandard variable
datastandard <- merge(datastandard, datalabels)

## Merge the datamean and datastandard into a variable datafinal
datafinal <- rbind(datamean, datastandard)


############################################################################################################################################################
## Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject ##  
############################################################################################################################################################

## Make a data table called datatidy using the data from Step 4

datatidy<- data.table(datafinal)

## From the output from Step 4 take the data and using lapply and Standard Deviation of mean find the mean
## of the activity_id and ativity_type and return the data to the datatidy variable 

datatidy<- datatidy[, lapply(.SD,mean), by=c("activity_id", "activity_type")]

## Write a text file to the working directory with the results in called datatidy.txt

write.table(datatidy, "datatidy.txt", row.names=FALSE)

