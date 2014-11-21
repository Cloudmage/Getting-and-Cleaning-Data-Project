Code Book for Getting and Cleaning Data Project
===============================================

## Data Sets used

* "train/X_train.txt": Training set
* "train/y_train.txt": Training labels
* "ubject_train.txt": Subject Train labels
* "test/X_test.txt": Test set
* "test/y_test.txt": Test labels
* "subject_test.txt": Subject Test labels
* "features.txt": List of all features
* "activity_labels.txt": Links the class labels with their activity name

## Variables used 

* 'datatrain' merged data from "train/X_train.txt", "train/y_train.txt" and "subject_train.txt"
* 'datatest' merged data from  "test/X_test.txt", "test/y_test.txt" and "subject_test.txt"
* 'datafeature' raw data from "features.txt"
* 'dataactivity' raw data from "activity_labels.txt"
* 'datatotal' merged data from 'datatrain' and 'datatest'
* 'datamean' using the sapply function extract the mean data from the merged output 'datatotal'
* 'datastandard' using the sapply function extract the standard data from the merged output 'datatotal'
* 'datafinal' merged data from 'datamean' and 'datastandard'
* 'datatidy' final data after grouping by 'activity_id' and 'activity_type' and calculating the mean
* 'activity_id' column name for the activity id
* 'actvity_type' column name for the activity type


## Script Walkthrough

This script assumes that you have extracted the dataset as per the Readme.MD file

Load the libray (data.table) needed for this R Script to work - The user will need this installed


## Step 1 - Merge the training and test sets to create one data set 


Read the training data in the train directory - assign this to a variable called datatrain
Data set 'train/X_train.txt': Training set
Data set 'train/y_train.txt': Training labels
Data set 'subject_train.txt': Subject Train labels
Read the test data in the test directory - assign this to a variable called datatest
Data set 'test/X_test.txt': Test set
Data set 'test/y_test.txt': Test labels
Data set 'subject_test.txt': Subject Test labels

Read the features data in the dataset directory - assign this to a variable called datafeatures
Data set 'features.txt': List of all features

Read the activity labels data in the dataset directory - assign this to a variable called datalabels
Data set 'activity_labels.txt': Links the class labels with their activity name

Merge the two data sets - datatrain and datatest - merge into a variable called datatotal


## Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement 

Using the sapply function extract the mean data from the merged output 'datatotal' and assign to variable datamean

Using the sapply function extract the standard data from the merged output 'datatotal' and assign to variable datastandard

## Step 3 - Uses descriptive activity names to name the activities in the data set 

Give the column names in the datalabels variable names of 'activity-id' and 'activity_type'


## Step 4 - Appropriately label the data set with descriptive variable names 

Put the datalabels into the datamean variable
Put the datalabels into the datastandard variable
Merge the datamean and datastandard into a variable datafinal

Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject


Make a data table called datatidy using the data from Step 4

From the output from Step 4 take the data and using lapply and Standard Deviation of mean find the mean of the 'activity_id' and 'activity_type' and return the data to the datatidy variable

Write a text file to the working directory with the results in called datatidy.txt
