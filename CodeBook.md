# Description of variables included in the Getting and Cleaning Data project

According to the providers of the original data, the features selected for this
database came from the accelerometer (Acc) and gyroscope (Gyro) 3-axial raw 
signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote
time) were captured at a constant rate of 50 Hz. Then they were filtered using 
a median filter and a 3rd order low pass Butterworth filter with a corner 
frequency of 20 Hz to remove noise. Similarly, the acceleration signal was 
then separated into body and gravity acceleration signals (tBodyAcc-XYZ and 
tGravityAcc-XYZ) using another low pass Butterworth filter with a corner 
frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived 
in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also 
the magnitude of these three-dimensional signals were calculated using the 
Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, 
tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals 
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain 
signals). 

These signals were used to estimate variables of the feature vector for each 
pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

A set of variables was estimated from these signals. However, in this study, 
only the variables for the mean - mean() - and standard deviation - std() - 
of each measurement were included.

meanFreq(), which is the weighted average of the frequency components, as well
as gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean and 
tBodyGyroJerkMean, which were obtained by averaging the signals in a signal 
window sample were not included it this study, because no corresponding 
standard deviation was reported for these variables, which may complicate 
subsequent analyses.

The coded activities were relabled according to the information provided in
"activity_labels.txt". For better readability, the variable names, derived from
"features.txt", as well as the activity names were changed to lower camel case 
(an accepted style for variable names according to Google's R Style Guide: 
google-styleguide.googlecode.com/svn/trunk/Rguide.xml). The parentheses, 
underscores and dashes were removed, and errors in the original labeling (e.g. 
"BodyBody" in fBodyBodyAccJerkMag) were corrected.
