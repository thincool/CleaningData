## Features name rules.
The features come from UCI HAR Dataset. These signals were used to estimate variables of the feature vector for each pattern:  
'_XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
The features selected for this tidy data come from the accelerometer and gyroscope 3-axial raw signals tAcc_XYZ and tGyro_XYZ. The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc_XYZ and tGravityAcc_XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk_XYZ and tBodyGyroJerk_XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc_XYZ, fBodyAccJerk_XYZ, fBodyGyro_XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

The set of variables that were estimated from these signals are: 
mean(): Mean value
std(): Standard deviation
And the function show in middle of the feature name, as tBodyGyro_mean_X.

## Tidy data description.
subject : An identifier of the subject who carried out the experiment. From 1 to 30.

activity : Activities performed by subjects ,include WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

others : The average of each signs for each activity and each subject. The signs meaning is described by features name rules.

# Transformations and Clean work
The tidy data is come from UCI HAR Dataset.
1. Put subject and activity data and signs data together, then combine test and train data into full data set.

2. Create sub data set from full data set by used only mean and standard deviation sign columns.

3. Read original feature names form features.txt, and convert by these rules: a).Remove"()" from original name. b).Convert "-" to "_". Use these names for the new sub data set. 

4. Read activity_labels.txt get activity code and name relationship. Replace code with meaningful name in sub data set.

5. Calulate mean of each activity and each subject in sub data set. Then this is the tidy data set.
