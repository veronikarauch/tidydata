#CodeBook
##The data 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

##Steps taken to clean up the Data:

###1) Loading, cleaning data:
-       I loaded both the train and the test data into R using the read.csv() function (stored  in values train.X and test.X) and performed the following steps:
-	I used the Names in the features.txt file to label the columns in both the train.X and test.X data sets using the names() fucntion. From the README.txt file it was clear that both the train and test datasets had the same column variables since it used to be one dataset and had been randomnly split in a 7:3 ratio into training and test data.
-	I then  loaded the volunteers and activity data into R ( again using read.csv ) . I added the volunteers of the experiment which are labelled 1:30 from file subject_test and subject_train to the corresponding train and test data sets as an extra column. I did the same with the activity labels which were stored in the y_train.txt and y_test.txt files. As a result both the train and test dataset have now 563 columns each rather than the original 561, Where column 562 is called “activities” and column 563 is called “volunteers”.
 To make the type of activity more understandable, the labeles are later changed from values 1:6 to WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
-	I then merged the train and test data back together to form one data set and stored it in new.tot using the rbind() function

###2) Description of variable Names.
-  The original variable names as imported from the features.txt file are explained in the features_info.txt file of the original data set as follow:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  

-	'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
-	tBodyAcc-XYZ
-	tGravityAcc-XY
-	tBodyAccJerk-XYZ
-	tBodyGyro-XYZ
-	tBodyGyroJerk-XYZ
-	tBodyAccMag
-	tGravityAccMag
-	tBodyAccJerkMag
-	tBodyGyroMag
-	tBodyGyroJerkMag
-	fBodyAcc-XYZ
-	fBodyAccJerk-XYZ
-	fBodyGyro-XYZ
-	fBodyAccMag
-	fBodyAccJerkMag
-	fBodyGyroMag
-	fBodyGyroJerkMa
-	The set of variables that were estimated from these signals are: 
-	mean(): Mean value
-	std(): Standard deviation
-	mad(): Median absolute deviation 
-	max(): Largest value in array
-	min(): Smallest value in array
-	sma(): Signal magnitude area
-	energy(): Energy measure. Sum of the squares divided by the number of values. 
-	iqr(): Interquartile range 
-	entropy(): Signal entropy
-	arCoeff(): Autorregresion coefficients with Burg order equal to 4
-	correlation(): correlation coefficient between two signals
-	maxInds(): index of the frequency component with largest magnitude
-	meanFreq(): Weighted average of the frequency components to obtain a mean frequency
-	skewness(): skewness of the frequency domain signal
-	kurtosis(): kurtosis of the frequency domain signal 
-	bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
-	angle(): Angle between to vectors.
-	Additional vectors obtained by averaging the signals in a signal window sample. These are used on  	the angle() variable:
-	gravityMean
-	tBodyAccMean
-	tBodyAccJerkMean
-	tBodyGyroMean
-	tBodyGyroJerkMean


I then used the gsub() function in order to make those variables more descriptive by subbing short cuts like Acc, Gyro etc. for their actual full name

###3) Constructing  Tidy Data Set
Finally from this cleaned up Data a Tidy Data Set was constructed that shows the average of each variable for each activity and each volunteer. It was cosntructed by factoring the dataset by activity and volunteer and  then the lapply fucntion was sued to calcualte the mean.

