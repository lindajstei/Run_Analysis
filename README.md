---
title: "README"
author: "lindajstei"
date: "September 25, 2015"
output: html_document
---
The data for the project is located in:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The script run_analysis.R performs the following:
  1. Merges the training and the test sets to create one data set.
    - Reads in via read.table metadata which are activity labels and feature names
    - Reads in via read.table three training and three test data sets including features, subject and activity files
    - Creates training and test sets by combining subject, activity, and features data
    - Names the columns with feature names gathered by the metadata, activity, and subject
    - Combines the two created sets into one complete data set
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    - Runs a grep on the complete data set's column names for mean or std, case excluded.
    - Grep returns indices to include in extracted data set
    - Extracted data set is created, with relevant columns, as well as activity and subject
  3. Uses descriptive activity names to name the activities in the data set.
    - Names are taken from activity labels
    - Characterize the activity column of the extracted data set
    - For each of six activities, replace the number code in the original with the corresponding activity label from activityLabels.
    - Factorize the extracted data set's activity column
  4. Appropriately labels the data set with descriptive variable names. 
    - Run a series of gsubs to replace invalid characters, and elaborate on abbreviated column names
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    - Factorize the subject variable
    - Make extracted data set a data table
    - Tabulate the mean of each variable for each activity and each subject with aggregate and mean functions
    - Order the resulting tidy table by subject, activity, then mean values of each variable
    - Write the table to a text file called Tidy.txt

```{r}
sessionInfo()
```

