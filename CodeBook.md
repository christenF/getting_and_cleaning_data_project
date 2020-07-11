---
output: html_document
---
## CodeBook

### The initial data used for this project was described as follows:

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) 
using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm 
(tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing 
fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
(Note the 'f' to indicate frequency domain signals). 

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
fBodyGyroJerkMag"

### Provided data
The data were obtained from 30 subjects that were originally splitted in a training and a test data set.
Descriptions of the variables, the activities and the subjects were provided in seperate files.
i.e. 
- X_test.txt            containing the test set measurements
- X_train.txt           containing the training set measurements
- Y_test.txt            containing the activity labels (i.e. WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, 
                        SITTING, STANDING, LAYING) for the test set
- Y_train.txt           containing the activity labels for the training set
- subject_test.txt      containing the subject labels fot the test set
- subject_train.txt     containing the subject labels for the training set
- features.txt          containing the description of the measurement variables
- activity_labels.txt   containing the description of te activity labels

### adding descriptions
In the first steps the descriptions of the variables, activities and subjects were added to the training and
test data sets. Subsequently the training and test data sets were combined to one data set.

### selecting columns
From all the available data only the columns containing the mean ("mean()") and standard deviation ("std()")
of a measurement were selected.
 
### labelling the activities
To make the data set more understandable, the activities were labelled (as provided with the data).

### average of all measurements
Finally the data were gathered to calculate the mean for all measurements per variable, subject and activity.

### data set
The tidy data are available as: "tidy_data_set.csv"
