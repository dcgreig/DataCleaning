# File: CodeBook.md

Included Sensors:
- Accelerometer
- Gyroscope

Included Activities:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

*****************************************
*****************************************
Data:
The input data for this project was obtained from accelerometer and gyroscope readings from smartphone worn by a group
of 30 volunteers performing a variety of activities (walking, walking upstairs, walking downstairs, sitting, standing,
laying).  

From the included documentation:
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

The input variables consisted, for each of the above, calculations of mean, std, mad, max, min, sma, energy, iqr, entropy, arCoeff, correlation, maxInds, meanFreq, skewness, kurtosis, bandsEnergy, and angle.

*** However, for the purposes of this experiment, we only extracted mean and std values.

*****************************************
*****************************************
Processing:
Given, the test and input data, the following processing was performed:
1. The test and training data were read into dataframes.
2. The test and training subjects and activities were read into dataframes.
3. The list of features was read into a dataframe and used as column names for the test and training dataframes.
4. For the test and training dataframes, respectively, the test and training activity and subject dataframes
    were prepended, resulting in, for the test and trainging dataframes a set of columns consisting of 
    subject, activity, and then all subsequent measured data.
5. The test and training data were merged (row bind) into a single dataset.
6. The activity column was converted from numeric (1-6) entries into meaningful data ("walking", "running", etc.).
7. A list of columns including only means or standard deviations (plus subject and activity) was generated and
    used to build a new dataframe containing only subject, activity, and mean and standard deviation calculations.
8. Variable names were then cleaned up to eliminate parentheses and hyphens.
9. dplyr() was then used on the resultant data to group by subject and activity, and calculate the mean of all 
    remaining columns.
10. The data from step 9 was then written to an output file, tidy.txt.

*****************************************
*****************************************
Variables:
- subject: ID of the participant (1-30)
- activity: activity used for measurements (see list at top)
- measured values: see description above; measured acceleration signals were separated into body and gravity 
    acceleration signals.  For each of these, a mean and std was calculated.
    Those signals prefaced with t denote time-based signals (seconds).
    Those signals prefaced with f denote signals where an FFT was applied, indicating frequency (Hz)
    
For example:
    tbodyaccmeanx: mean of body acceleration (X component / secs)
    tbodyaccmeany: mean of body acceleration (Y component / secs)
    tbodyaccmeanz: mean of body acceleration (Z component / secs)
    tgravityaccmeanx: mean of gravity acceleration (X component / secs)
    fbodyaccmeanx: mean of body acceleration (X component / Hz)
    tbodyaccstdx : std of body acceleration (X component / secs)
    etc.
