#CodeBook.md
#run_analysis.R
R script called run_analysis.R has the following requirements:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Run_analysis.R performs the following:
* downloads required data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* unzips the file if needed
* creates results folder if it does not exist
* loads features.txt used for columns
* loads X_train.txt, y_train.txt, subject_train.txt
* X_train contains the data using the feature data set as columns
* y_train contains the activity labels
* subject_train contains the ids
* loads and appends test dataset using X_test.txt, y_test.txt, subject_test.txt
* X_test contains the data using the feature data set as columns
* y_test contains the activity labels
* subject_test contains the ids
* appends train and test data
* sort the data using id
* loads activity_labels.txt
* changes the data activity row to use the activity labels
* saves the mean and std dataset into mean_and_std.csv
* saves the tidy dataset into tidy_dataset.csv
#mean_and_std.csv
id	
activity	
tBodyAcc.std...X	
tBodyAcc.std...Y	
tBodyAcc.std...Z	
tGravityAcc.std...X	
tGravityAcc.std...Y	
tGravityAcc.std...Z	
tBodyAccJerk.std...X	
tBodyAccJerk.std...Y	
tBodyAccJerk.std...Z	
tBodyGyro.std...X	
tBodyGyro.std...Y	
tBodyGyro.std...Z	
tBodyGyroJerk.std...X	
tBodyGyroJerk.std...Y	
tBodyGyroJerk.std...Z	
tBodyAccMag.std..	
tGravityAccMag.std..	
tBodyAccJerkMag.std..	
tBodyGyroMag.std..	
tBodyGyroJerkMag.std..	
fBodyAcc.std...X	
fBodyAcc.std...Y	
fBodyAcc.std...Z	
fBodyAccJerk.std...X	
fBodyAccJerk.std...Y	
fBodyAccJerk.std...Z	
fBodyGyro.std...X	
fBodyGyro.std...Y	
fBodyGyro.std...Z	
fBodyAccMag.std..	
fBodyBodyAccJerkMag.std..	
fBodyBodyGyroMag.std..	
fBodyBodyGyroJerkMag.std..	
tBodyAcc.mean...X	
tBodyAcc.mean...Y	
tBodyAcc.mean...Z	
tGravityAcc.mean...X	
tGravityAcc.mean...Y	
tGravityAcc.mean...Z	
tBodyAccJerk.mean...X	
tBodyAccJerk.mean...Y	
tBodyAccJerk.mean...Z	
tBodyGyro.mean...X	
tBodyGyro.mean...Y	
tBodyGyro.mean...Z	
tBodyGyroJerk.mean...X	
tBodyGyroJerk.mean...Y	
tBodyGyroJerk.mean...Z	
tBodyAccMag.mean..	
tGravityAccMag.mean..	
tBodyAccJerkMag.mean..	
tBodyGyroMag.mean..	
tBodyGyroJerkMag.mean..	
fBodyAcc.mean...X	
fBodyAcc.mean...Y	
fBodyAcc.mean...Z	
fBodyAcc.meanFreq...X	
fBodyAcc.meanFreq...Y	
fBodyAcc.meanFreq...Z	
fBodyAccJerk.mean...X	
fBodyAccJerk.mean...Y	
fBodyAccJerk.mean...Z	
fBodyAccJerk.meanFreq...X	
fBodyAccJerk.meanFreq...Y	
fBodyAccJerk.meanFreq...Z	
fBodyGyro.mean...X	
fBodyGyro.mean...Y	
fBodyGyro.mean...Z	
fBodyGyro.meanFreq...X	
fBodyGyro.meanFreq...Y	
fBodyGyro.meanFreq...Z	
fBodyAccMag.mean..	
fBodyAccMag.meanFreq..	
fBodyBodyAccJerkMag.mean..	
fBodyBodyAccJerkMag.meanFreq..	
fBodyBodyGyroMag.mean..	
fBodyBodyGyroMag.meanFreq..	
fBodyBodyGyroJerkMag.mean..	
fBodyBodyGyroJerkMag.meanFreq..

#tidy_data.csv
