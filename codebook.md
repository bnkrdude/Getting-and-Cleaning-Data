# Codebook for Getting and Cleaning Data Course Project


### Background information about the experiement and data collection from the UCI Machine Learning Repository:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Data download and preparation:

The run_analysis.R program downloads the zip file on the UCI Machine Leaning website from the following web address:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The program creates a directory for the zip file if one does not exist and then unzips the dataset.  The dataset contained the following files:

- 'README.txt' - which is summarized above
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt:  which identifies the subject who performed the activity in the test set
- 'train/subject_train.txt: which identifies the subject who performed the activity in the training set

In total there were 30 subjects that performed each activity.  There were also folders related to the Inertial signals, but those where not used in this analysis and will not be documented.  If more information is needed, please refer to the README.txt file that is part of the dataset.

The combined data contained 561 variables included in the dataset which are described in detail in the README.txt and the features_info.txt on the UCI website.  For the purpose of this exercise, only the variables that contained a mean or standard deviation were selected for the following variables:

tBodyAccelerometer-XYZ, tGravityAccelerometer-XYZ, tBodyAccelerometerJerk-XYZ, tBodyGyroscope-XYZ, tBodyGyroscopeJerk-XYZ, tBodyAccelerometerMagnitude, tGravityAccelerometerMagnitude, tBodyAccelerometerJerkMagnitude, tBodyGyroscopeMagnitude, tBodyGyroscopeJerkMagnitude, fBodyAccelerometer-XYZ, fBodyAccelerometerJerk-XYZ, fBodyGyroscope-XYZ, fBodyAccelerometerMagnitude, fBodyAccelerometerJerkMagnitude, fBodyGyroscopeMagnitude, fBodyGyroscopeJerkMagnitude

The final dataset contained 81 variables, 79 from the mean and standard deviation from the above variables and a subjectID -representing the the subject that performed the activity - and activity - representing one of the six activities the participants executed:  LAYING, SITTING, STANDING, WALKING, WALKING DOWNSTAIRS, and WALKING UPSTAIRS

# Code Walk through

After the zip file is downloaded and unpacked, the data is then read into R and is combined into a single dataset with all 561 variables.  A smaller dataset is then created containing only variables that represent a mean or a standard deviation.  In order to preserve computing resources, data files were deleted once they were no longer needed.  For example, once the test and train datasets were combined into a single dataset, the individual datasets were removed.

Once the dataset containing the mean and standard deviations was created, the mean values of all the data elements (e.g. the mean and standard deviations for the variables above) was calculated for each activity for each subject.  This outout set contains 180 rows (30 participants times 6 activities) with 81 variables (mean values of elements list above along with activity and subjectID).  Prior to creating the final .csv file, the column names were updated to be more "readable".

The dataset was output as the tidydata.csv.

Two comments regarding the output file:
1. The mean values of the standard deviations for each activity lack meaningful statistical interpretation, but were executed to fulfill the assignment.
2. The data element names provided by the researches in the originial datasets were meaningful and logical to me and I probably would not have changed them if this were my own analysis.  However, I clearly understand the point of the exercise as well as the need to make sure that in all data analytics that variable names are clear and related to the values they contain.


Overall, this was an interesting project and I found it very vaulable.


