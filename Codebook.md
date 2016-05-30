Getting and cleaning data Course Project CODEBOOK
=================================================

This code book describes the variables, the data, and any transformations or work that was performed to clean up the data.

Data origin
-----------
The data provided tracks Human Activity using Smartphones. A description is provided  at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

For this project, the needed data can be downloaded from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


Data files
----------
Download and unzip the archive to get the directory UCI Har Dataset

UCI Har Dataset directory includes the following files and directories:
activity_labels.txt  features_info.txt  features.txt  README.txt  test  train

test
Inertial Signals  subject_test.txt  X_test.txt  y_test.txt


train
Inertial Signals  subject_train.txt  X_train.txt  y_train.txt


README.txt: read this file carefully since it provides a concise description of the data in the different files provided.



Not all files provided are needed for completing this project. The script run_analysis.R reads the following files and subdirectories:

activity_labels.txt
features.txt
test/
subject_test.txt  X_test.txt  y_test.txt
train/
subject_train.txt  X_train.txt  y_train.txt


The data used in this project describes measurements executed on a population of 30 volunteers. Each person performed 6 activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The collected data has been split into training and test data. Measurements on 21 people were saved as training data and the data from the other 9 people as testing data.


Needed files
------------

- Activity_labels.txt : File provides Activity_ID Activity_label
- features.txt : 561 names of the variables used in each feature vector (features)
- features_info.txt: explains how the signals were measured and variables estimated from the signals
- train/X_train.txt : training set
- train/y_train.txt : training labels
- train/subject_train.txt : each row identifies the subject who performed the activity
- test/X_test.txt     : test set
- test/y_test.txt     : test labels
- train/subject_test.txt : each row identifies the subject who performed the activity

A row across these 3 train/test files register observations/measurements on the same subject. Feature vector at line 1 in test/X_test.txt was collected from subject (label) described at line 1 in test/subject_test.txt while doing activity listed at line 1 in file test/y_test.txt (labels).


Data manipulation and cleaning
------------------------------
- If files are found on local file system, the relevant files are read into dataframes.
- Test data is read into data object test_label_features. the data frame includes the "ID" (identifier of the subject), "activity" that the subject was executing when the measurements were taken and a vector of 561 features. These features are the actual measurements. In the created dataset, the activity variable shows the descriptive activity names provided in the activity_labels.file.

- Training data is read into the data frame train_label_features. The data show the same structure as the test data frame described above.

- Test and training data are merged into the dataset  allData. 

- R indicates that allData data object contains duplicated columns. thus, duplicated columns are removed. From the resulting object noDuplicatesData, we select the columns ID, columns that contain "mean" or "std" in its name, and activity. This results in the subset mean_std_data.

- From mean_std_data, a tidy data set average_variable_tidy is extracted that shows the average of each measurement variable for each activity and each individual.

- Last,  the table average_variable_tidy is written to a file in the local file system.



Output Dataset
--------------
Stored in file project_average_variable_tidy_dataset.txt

