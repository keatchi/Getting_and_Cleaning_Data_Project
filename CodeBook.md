# Codebook
This is a code book that describes the variables, the data, and any transformations or work that are performed to clean up the data.

##Data source
*Original data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

*Original description of the dataset: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

##Files included in run_analysis.R:

*X_train.txt:observations of 563 features of the training set

*y_train.txt:activity ID of the training set

*subject_train.txt: subject ID of the training set

*X_test.txt:observations of 563 features of the test set

*y_test.txt: activity ID of the test set

*subject_test.txt:subject ID of the test set

*features.txt: description of features

*activity_labels.txt: activity ID and description of activity

##The Procedure and the variables generated
###1. Merges the training and the test sets to create one data set.

*mergedX: combined data frame of X_train and X_test

*mergedY: combined data frame of y_train and y_test

*mergedSub: combined data frame of subject_train and subject_test

After merging the tables, columns' names of all the tables are created or renamed.

###2.Extracts only the measurements on the mean and standard deviation for each measurement.

*mean_stdDev_col: subset of data frame mergedX that only consists columns of means and standard deviations of each feature's measurement.

*mergedAll: data frame that combines mergedY, mergedSub and mean_stdDev_col.

The columns of mean and standard deviation for each measurement are extracted and combined with activity and subject data frame.

###3.Uses descriptive activity names to name the activities in the data set

*mergedAct: data frame that merges the previous data frame in step 2 with activity_labels. 

Since mergedAct and mergedAll have an identical column, both data frame are joined by activityID.

###4.Appropriately labels the data set with descriptive variable names.

Remove "-" and parentheses from the columns' name.

###5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

*ActSubMean: data frame that groups mergedAct by activity ID, activity type and subject ID with this sequence and it is summarized by the average of each variable.






