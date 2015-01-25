#using library plyr to clean up the data frames
library(plyr)

# check to see if directories exist and then download the data
if (!file.exists("data")) {
        dir.create("data")
}

if (!file.exists("data/UCI HAR Dataset")) {

        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        zipfile="data/UCI_HAR_data.zip"
        download.file(fileURL, destfile=zipfile, method="curl")
        unzip(zipfile, exdir="data")
}

## 1. Merges the training and the test sets to create one data set.
# reading all data in as a data frame format
# Load and merge x files from test/train folders, remove the loaded files after the merge
xTest <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
xTrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
xMerged <- rbind(xTrain, xTest)
rm(xTest); rm(xTrain)

# Load and merge y files from test/train folders, remove the loaded files after the merge
yTest <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
yTrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
yMerged <- rbind(yTrain, yTest)
rm(yTest); rm(yTrain)

# Load and merge subjext files from test/train folders, remove the loaded files after the merge
subjectTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
subjectTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
subjectMerged <- rbind(subjectTrain, subjectTest)
rm(subjectTest); rm(subjectTrain)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#extract only column 2 ( names ) of the feature tables to get all means | standard deviation columns
features <- read.table("./data/UCI HAR Dataset/features.txt")
means<-grepl("mean()",features[,2])
stds<-grepl("std()",features[,2])
# extracting data from the xMerged data frame, and naming the columns endResult should be 79 columns
# includes columns with -mean(), -std(), -meanFreq()
xExtractedData <- xMerged[,(means|stds)]

## 3. Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
yMerged[,1] = activityLabels[yMerged[,1]]

## 4. Appropriately labels the data set with descriptive names.
colnames(xExtractedData) <- features[(means|stds),2]
colnames(yMerged) <- "activity"
colnames(subjectMerged) <- c("subject")

## 5. Creates a second, independent tidy data set with the average of each 
## variable for each activity and each subject.
#column bind the three data sets to one = should have 81 columns
combinedXYSubectDataSet <- cbind(xExtractedData,yMerged,subjectMerged)

# applying the colMeans function to the 79 columns using subject and then activity on the combined data sets
# end result is a data frame with 180 observations for the total 81 columns
cleanXYSubjectDataSet <-ddply(combinedXYSubectDataSet, .(subject, activity), function(x) colMeans(x[,1:79]))

# writing file to local drive
write.table(cleanXYSubjectDataSet, file = "./cleanSubjectActivityData.txt")