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


```r
sessionInfo()
```

```
## R version 3.2.2 (2015-08-14)
## Platform: x86_64-w64-mingw32/x64 (64-bit)
## Running under: Windows 8 x64 (build 9200)
## 
## locale:
## [1] LC_COLLATE=English_United States.1252 
## [2] LC_CTYPE=English_United States.1252   
## [3] LC_MONETARY=English_United States.1252
## [4] LC_NUMERIC=C                          
## [5] LC_TIME=English_United States.1252    
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] knitr_1.10.5     dplyr_0.4.3      data.table_1.9.4
## 
## loaded via a namespace (and not attached):
##  [1] Rcpp_0.11.6     digest_0.6.8    assertthat_0.1  mime_0.3       
##  [5] chron_2.3-47    plyr_1.8.3      R6_2.1.0        DBI_0.3.1      
##  [9] formatR_1.2     magrittr_1.5    evaluate_0.7    stringi_0.5-5  
## [13] reshape2_1.4.1  rmarkdown_0.7   tools_3.2.2     stringr_1.0.0  
## [17] markdown_0.7.7  yaml_2.1.13     parallel_3.2.2  htmltools_0.2.6
```

