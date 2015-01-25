---
title: "Getting and Cleaning Data Course Project Cookbook"
author: "Leo Ruane"
date: "Sunday, January 25, 2015"
output: html_document
---


Feature Selection 
=================

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

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

***

Data Dictionary
---------------

* Subject  
    + Subject Id 1..30    
* Activity  
    + List of activities  
        + WALKING
        + WALKING_UPSTAIRS
        + WALKING_DOWNSTAIRS
        + SITTING
        + STANDING
        + LAYING
* tBodyAcc.Mean.X    -  mean data 
* tBodyAcc.Mean.Y    -  mean data 
* tBodyAcc.Mean.Z    -  mean data 
* tBodyAcc.Std.X    -  mean data 
* tBodyAcc.Std.Y    -  mean data 
* tBodyAcc.Std.Z    -  mean data 
* tGravityAcc.Mean.X    -  mean data 
* tGravityAcc.Mean.Y    -  mean data 
* tGravityAcc.Mean.Z    -  mean data 
* tGravityAcc.Std.X    -  mean data 
* tGravityAcc.Std.Y    -  mean data 
* tGravityAcc.Std.Z    -  mean data 
* tBodyAccJerk.Mean.X    -  mean data 
* tBodyAccJerk.Mean.Y    -  mean data 
* tBodyAccJerk.Mean.Z    -  mean data 
* tBodyAccJerk.Std.X   -  mean data 
* tBodyAccJerk.Std.Y    -  mean data 
* tBodyAccJerk.Std.Z    -  mean data 
* tBodyGyro.Mean.X    -  mean data 
* tBodyGyro.Mean.Y    -  mean data 
* tBodyGyro.Mean.Z    -  mean data 
* tBodyGyro.Std.X    -  mean data 
* tBodyGyro.Std.Y    -  mean data 
* tBodyGyro.Std.Z    -  mean data 
* tBodyGyroJerk.Mean.X    -  mean data 
* tBodyGyroJerk.Mean.Y    -  mean data 
* tBodyGyroJerk.Mean.Z    -  mean data 
* tBodyGyroJerk.Std.X    -  mean data 
* tBodyGyroJerk.Std.Y    -  mean data 
* tBodyGyroJerk.Std.Z    -  mean data 
* tBodyAccMag.Mean    -  mean data 
* tBodyAccMag.Std    -  mean data 
* tGravityAccMag.Mean    -  mean data 
* tGravityAccMag.Std    -  mean data 
* tBodyAccJerkMag.Mean    -  mean data 
* tBodyAccJerkMag.Std    -  mean data 
* tBodyGyroMag.Mean    -  mean data 
* tBodyGyroMag.Std    -  mean data 
* tBodyGyroJerkMag.Mean    -  mean data 
* tBodyGyroJerkMag.Std    -  mean data 
* fBodyAcc.Mean.X    -  mean data 
* fBodyAcc.Mean.Y    -  mean data 
* fBodyAcc.Mean.Z    -  mean data 
* fBodyAcc.Std.X    -  mean data 
* fBodyAcc.Std.Y    -  mean data 
* fBodyAcc.Std.Z    -  mean data 
* fBodyAcc.MeanFreq.X    -  mean data 
* fBodyAcc.MeanFreq.Y    -  mean data 
* fBodyAcc.MeanFreq.Z    -  mean data 
* fBodyAccJerk.Mean.X    -  mean data 
* fBodyAccJerk.Mean.Y    -  mean data 
* fBodyAccJerk.Mean.Z    -  mean data 
* fBodyAccJerk.Std.X    -  mean data 
* fBodyAccJerk.Std.Y    -  mean data 
* fBodyAccJerk.Std.Z    -  mean data 
* fBodyAccJerk.MeanFreq.X    -  mean data 
* fBodyAccJerk.MeanFreq.Y    -  mean data 
* fBodyAccJerk.MeanFreq.Z    -  mean data 
* fBodyGyro.Mean.X    -  mean data 
* fBodyGyro.Mean.Y    -  mean data 
* fBodyGyro.Mean.Z    -  mean data 
* fBodyGyro.Std.X    -  mean data 
* fBodyGyro.Std.Y    -  mean data 
* fBodyGyro.Std.Z    -  mean data 
* fBodyGyro.MeanFreq.X    -  mean data 
* fBodyGyro.MeanFreq.Y    -  mean data 
* fBodyGyro.MeanFreq.Z    -  mean data 
* fBodyAccMag.Mean    -  mean data 
* fBodyAccMag.Std    -  mean data 
* fBodyAccMag.MeanFreq    -  mean data 
* fBodyBodyAccJerkMag.Mean    -  mean data 
* fBodyBodyAccJerkMag.Std    -  mean data 
* fBodyBodyAccJerkMag.MeanFreq    -  mean data 
* fBodyBodyGyroMag.Mean    -  mean data 
* fBodyBodyGyroMag.Std    -  mean data 
* fBodyBodyGyroMag.MeanFreq    -  mean data 
* fBodyBodyGyroJerkMag.Mean    -  mean data 
* fBodyBodyGyroJerkMag.Std    -  mean data 
* fBodyBodyGyroJerkMag.MeanFreq    -  mean data 

