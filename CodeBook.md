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
