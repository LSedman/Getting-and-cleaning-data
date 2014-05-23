Getting-and-cleaning-data course project
=========================

The script run_analysis.R in this repository can be used to create a tidy dataset from data collected using the accelerometers on the Samsung Galaxy S smartphone. The original data was obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

run_analysis.R first downloads and unzips the data if necessary. Next, the variable names (features.txt) activity labels (activity_labels.txt) training and test measured values (X_train.txt and X_test.txt), the corresponding coded activities (y_train.txt and y_test.txt) as well as the subjects (subject_train.txt and subject_test.txt) are then loaded into R. The inertial signal data are not included in the study.

The training and test data are merged into a single data frame together with the information on the subjects and activities. The variable names are subsequently set as the column names of the data frame.

The script then exchanges the activity codes in the data frame with the descriptive activity names from activity_labels.txt. Thereafter, only the variables on the mean and standard deviation for each measurement are extracted and retained for further analysis. The column names of this new data frame are modified to improve readability. Finally, the script creates a new data set (tidyData.txt) with the average of each variable for each activity and each subject.

A more detailed description of the variables, activity labels, naming strategy and variable selection method can be found in the CodeBook.