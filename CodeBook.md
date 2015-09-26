---
title: "CodeBook"
author: "lindajstei"
date: "September 24, 2015"
output: html_document
---



# CodeBook for Course Project: Getting and Cleaning Data

## Step 1: Merge the training and test sets to create one data set

The data set resides in the UCI HAR Dataset folder. It is subdivided into training
and test data, which are found in the train and test folders, respectively.  Both consist of three relevant files for this exercise:
  1. Activity files found in y_train.txt and y_test.txt
  2. Subject files found in subject_train.txt and subject_test.txt
  3. Features files found in X_train.txt and X_test.txt
  
The names of the activities are specified in the main folder in activity_labels.txt. Feature names are found also in the main folder, in features.txt.  There are 30 subjects, identified by numbers 1 through 30.

Combine each of the files listed above, separately. Then name the columns of the combined files: "activity", "subject", and feature names derived from features.txt.  Finally, combine the three combined files into one complete data set, called "completeData".

## Step 2: Extract relevant data for this exercise -- Mean and Std Variables

Grep the column names of completeData for both mean and std, excluding case.  Include only those columns in the new extracted data set, called "extractedData".

## Step 3:  Name the activities

In extracted data, first change the activity column to character format.  Take the names from the activityLabels file (characterized).  Then, factorize the resulting activity column.

The activityLabels, with their corresponding codes are:

```r
activityLabels
```

```
##   V1                 V2
## 1  1            WALKING
## 2  2   WALKING_UPSTAIRS
## 3  3 WALKING_DOWNSTAIRS
## 4  4            SITTING
## 5  5           STANDING
## 6  6             LAYING
```


## Step 4:  Name the features columns

The features columns need appropriate R names.  The original names contain characters not recognized by R tables, so these are either removed or replaced with underscore.  Also, to clarify the meanings of the variables, abbreviations are expanded as follows:

  * Acc is replaced with accelerometer
  * Gyro is replaced with gyroscope
  * Mag is replaced with magnitude
  * Character f is replaced with frequency
  * Character t is replaced with time
  * Character - is replaced with _
  
The names are changed to lower case, to conform to naming conventions for columns.  
The new column names are listed below.


```r
names(extractedData)
```

```
##  [1] "timebodyaccelerometer_mean_x"                        
##  [2] "timebodyaccelerometer_mean_y"                        
##  [3] "timebodyaccelerometer_mean_z"                        
##  [4] "timebodyaccelerometer_std_x"                         
##  [5] "timebodyaccelerometer_std_y"                         
##  [6] "timebodyaccelerometer_std_z"                         
##  [7] "timegravityaccelerometer_mean_x"                     
##  [8] "timegravityaccelerometer_mean_y"                     
##  [9] "timegravityaccelerometer_mean_z"                     
## [10] "timegravityaccelerometer_std_x"                      
## [11] "timegravityaccelerometer_std_y"                      
## [12] "timegravityaccelerometer_std_z"                      
## [13] "timebodyaccelerometerjerk_mean_x"                    
## [14] "timebodyaccelerometerjerk_mean_y"                    
## [15] "timebodyaccelerometerjerk_mean_z"                    
## [16] "timebodyaccelerometerjerk_std_x"                     
## [17] "timebodyaccelerometerjerk_std_y"                     
## [18] "timebodyaccelerometerjerk_std_z"                     
## [19] "timebodygyroscope_mean_x"                            
## [20] "timebodygyroscope_mean_y"                            
## [21] "timebodygyroscope_mean_z"                            
## [22] "timebodygyroscope_std_x"                             
## [23] "timebodygyroscope_std_y"                             
## [24] "timebodygyroscope_std_z"                             
## [25] "timebodygyroscopejerk_mean_x"                        
## [26] "timebodygyroscopejerk_mean_y"                        
## [27] "timebodygyroscopejerk_mean_z"                        
## [28] "timebodygyroscopejerk_std_x"                         
## [29] "timebodygyroscopejerk_std_y"                         
## [30] "timebodygyroscopejerk_std_z"                         
## [31] "timebodyaccelerometermagnitude_mean"                 
## [32] "timebodyaccelerometermagnitude_std"                  
## [33] "timegravityaccelerometermagnitude_mean"              
## [34] "timegravityaccelerometermagnitude_std"               
## [35] "timebodyaccelerometerjerkmagnitude_mean"             
## [36] "timebodyaccelerometerjerkmagnitude_std"              
## [37] "timebodygyroscopemagnitude_mean"                     
## [38] "timebodygyroscopemagnitude_std"                      
## [39] "timebodygyroscopejerkmagnitude_mean"                 
## [40] "timebodygyroscopejerkmagnitude_std"                  
## [41] "frequencybodyaccelerometer_mean_x"                   
## [42] "frequencybodyaccelerometer_mean_y"                   
## [43] "frequencybodyaccelerometer_mean_z"                   
## [44] "frequencybodyaccelerometer_std_x"                    
## [45] "frequencybodyaccelerometer_std_y"                    
## [46] "frequencybodyaccelerometer_std_z"                    
## [47] "frequencybodyaccelerometer_meanfreq_x"               
## [48] "frequencybodyaccelerometer_meanfreq_y"               
## [49] "frequencybodyaccelerometer_meanfreq_z"               
## [50] "frequencybodyaccelerometerjerk_mean_x"               
## [51] "frequencybodyaccelerometerjerk_mean_y"               
## [52] "frequencybodyaccelerometerjerk_mean_z"               
## [53] "frequencybodyaccelerometerjerk_std_x"                
## [54] "frequencybodyaccelerometerjerk_std_y"                
## [55] "frequencybodyaccelerometerjerk_std_z"                
## [56] "frequencybodyaccelerometerjerk_meanfreq_x"           
## [57] "frequencybodyaccelerometerjerk_meanfreq_y"           
## [58] "frequencybodyaccelerometerjerk_meanfreq_z"           
## [59] "frequencybodygyroscope_mean_x"                       
## [60] "frequencybodygyroscope_mean_y"                       
## [61] "frequencybodygyroscope_mean_z"                       
## [62] "frequencybodygyroscope_std_x"                        
## [63] "frequencybodygyroscope_std_y"                        
## [64] "frequencybodygyroscope_std_z"                        
## [65] "frequencybodygyroscope_meanfreq_x"                   
## [66] "frequencybodygyroscope_meanfreq_y"                   
## [67] "frequencybodygyroscope_meanfreq_z"                   
## [68] "frequencybodyaccelerometermagnitude_mean"            
## [69] "frequencybodyaccelerometermagnitude_std"             
## [70] "frequencybodyaccelerometermagnitude_meanfreq"        
## [71] "frequencybodybodyaccelerometerjerkmagnitude_mean"    
## [72] "frequencybodybodyaccelerometerjerkmagnitude_std"     
## [73] "frequencybodybodyaccelerometerjerkmagnitude_meanfreq"
## [74] "frequencybodybodygyroscopemagnitude_mean"            
## [75] "frequencybodybodygyroscopemagnitude_std"             
## [76] "frequencybodybodygyroscopemagnitude_meanfreq"        
## [77] "frequencybodybodygyroscopejerkmagnitude_mean"        
## [78] "frequencybodybodygyroscopejerkmagnitude_std"         
## [79] "frequencybodybodygyroscopejerkmagnitude_meanfreq"    
## [80] "angle_tbodyaccelerometermean_gravity"                
## [81] "angle_tbodyaccelerometerjerkmean_gravitymean"        
## [82] "angle_tbodygyroscopemean_gravitymean"                
## [83] "angle_tbodygyroscopejerkmean_gravitymean"            
## [84] "angle_x_gravitymean"                                 
## [85] "angle_y_gravitymean"                                 
## [86] "angle_z_gravitymean"                                 
## [87] "activity"                                            
## [88] "subject"
```

## Step 5: Create tidy data set with average of each variable for each subject and activity

Factorize the subject column.  Convert extracted data into a data table.  Tabulate the means for each variable for each subject per activity, and put the result in the tidy data set, called "tidyData".  Reorder the columns of tidy data, putting subject first, then activity, then feature variables.  Write the tidyData to a txt file, with row.names = FALSE.

## Libraries Used

  * library(data.table)
  * library(dplyr)




