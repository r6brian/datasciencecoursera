# CodeBook
This is a code book that describes the variables, the data, and any data transformations to clean up a known data set.

## The data source

Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Set Information

The experiments have been carried out with 
* a group of 30 volunteers within an age bracket of 19-48 years. 
* six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
* wearing a smartphone (Samsung Galaxy S II) on the waist. 

Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## The data

The dataset includes the following files:
* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/subject_train.txt' : Training subjects
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/subject_test.txt' : Test subjects
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

## Transformation details

# There were five procedures:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Data transformation
* Required one library(plyr) to clean the data ( calculate column means based upon subject and activity )
* Download the respective zip file form the UCI Machine Learing Repository, and extract the data
* Load both test and train data ( 3 files each )
* Merge the two data sets ( test & traing ) by file type ( X,y,subject ) 
* Load the features and activity labels.
* Extract the mean and standard deviation from X combined data set based upon names from feature.
* Apply colnames to x extracted data set
* Substitued Ids of activity levels in the y combined data set with the activity names
* Applied colnames to the y combined data set
* Applied colnames to the combined subject data
* Combined the three data sets into a new data set
* applied column means to the new data set based upon subject and activity
