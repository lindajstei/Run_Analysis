library(data.table)
library(dplyr)

## Read in metadata: feature names and activity labels

featureNames <- read.table("UCI HAR Dataset/features.txt")
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

## Read in training and test data sets, which are located in three files each,
## for subject, activity, and features

## Read in training data

subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
activityTrain <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
featuresTrain <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
 
## Read in test data

subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
activityTest <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
featuresTest <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)

## Merge the training and test datasets into one complete dataset

subject <- rbind(subjectTrain, subjectTest)
activity <- rbind(activityTrain, activityTest)
features <- rbind(featuresTrain, featuresTest)

## Name the columns

colnames(features) <- t(featureNames[2])
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"

## Merge all datasets

completeData <- cbind(features,activity,subject)

## Part 2, Extraction of mean and standard deviation measurements

columnsWithMeanSTD <- grep(".*Mean.*|.*Std.*", names(completeData), ignore.case=TRUE)

requiredColumns <- c(columnsWithMeanSTD, 562, 563)

extractedData <- completeData[,requiredColumns]

## Part 3, Name the activities in the dataset

extractedData$Activity <- as.character(extractedData$Activity)
for (i in 1:6){
  extractedData$Activity[extractedData$Activity == i] <- as.character(activityLabels[i,2])
}
extractedData$Activity <- as.factor(extractedData$Activity)

## Part 4, Label the variables with approporiate variable names

names(extractedData)<-gsub("Acc", "accelerometer", names(extractedData))
names(extractedData)<-gsub("Gyro", "gyroscope", names(extractedData))

names(extractedData)<-gsub("Mag", "magnitude", names(extractedData))
names(extractedData)<-gsub("^t", "time", names(extractedData))
names(extractedData)<-gsub("^f", "frequency", names(extractedData))

names(extractedData)<-gsub("mean()", "mean", names(extractedData), fixed = TRUE)
names(extractedData)<-gsub("std()", "std", names(extractedData), fixed = TRUE)
names(extractedData)<-gsub("freq()", "frequency", names(extractedData), fixed = TRUE)

names(extractedData)<-gsub("-meanFreq()", "_meanfreq", names(extractedData), fixed = TRUE)

names(extractedData)<-gsub("(", "_", names(extractedData), fixed = TRUE)
names(extractedData)<-gsub(",", "_", names(extractedData), fixed = TRUE)
names(extractedData)<-gsub(")", "", names(extractedData), fixed = TRUE)

names(extractedData)<-gsub("-", "_", names(extractedData), fixed = TRUE)


names(extractedData)<- tolower(names(extractedData))

## Part 5, Create an independent tidy data set with the average of each variable 
## for each activity and each subject


extractedData$subject <- as.factor(extractedData$subject)
extractedData <- data.table(extractedData)

tidyData <- aggregate(. ~subject + activity, extractedData, mean)
tidyData <- tidyData[order(tidyData$subject,tidyData$activity),]


write.table(tidyData, file = "Tidy.txt", row.names = FALSE)





