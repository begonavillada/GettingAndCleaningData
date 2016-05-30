README.md
=========

Course Project
--------------
Getting and Cleaning data

Requirements
------------
R version 3.2.2 or higher
Ensure R libraries plyr and dplyr are installed


Data files
----------
Download https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip it



Analysis
--------
1. run_analysis.R reads the following data from the provided archive
- train and test data feature vectors
- train and test data activity labels
- train and test data subject ids
- activity ID and names
- feature names

2. The tabular data in the files is stored in data.frames

3. [Lines 45-51] Data frame test_label_features is created with the test data with columns "subjectID", feature variables 1:561, "activity". This test data set shows descriptive values for the column "activity"

4. [Lines 53-58] Data frame train_label_features is built with the training data with similar column structure to the test data set.

5. [Lines 61-62] Training data set and test data set are merged into one data set called "allData"

6. [Lines 64-72] Reads feature names (descriptive) file and labels the data set with descriptive variable names

7. [Lines 74-76] extract columns "ID", "activity" and variables that register the mean or standard deviation of the different measurements

8. [Lines 78-79] tabulate the data from step 7 by activity and ID showing the average value of each variable

9. [Line 80] write data table to file
   