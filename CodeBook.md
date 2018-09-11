# Human Activity Recognition Using Smartphones Data Set - Coursera Getting and cleaning data course project 

## Description of the HAR datasets

These datasets are based on an experiment carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

In particular, this work uses the following datasets:
- 'test.txt' / 'train.txt': dataset recording for each windown sample a series of features (with one dataset for the test group and one for the training group)  
- 'features.txt': list of all the 561 features measured (i.e. column names of teh above datasets)
- 'y_test.txt' / 'y_train.txt': dataset recording for each window sample (either training or test group) the activity performed (code 1 to 6)
- 'activity_labels.txt': label names corresponding to the codes 1 to 6 for the 6 different activities.
- 'subject_test.txt' / 'subject_train.txt': dataset recording for each windown sample (either training or test group) a number from 1 to 30 for the subject who performed it

## Data processing, tidying and summarising

### First step: 'tidy_data.txt' dataset

The first step of this assignment is to merge the training and test datasets ('test.txt', 'train.txt'), provide more details on the content of the dataset (activity and subject) 
and simplify the content to keep only the features (columns) referencing the mean and standard deviation for each window sample - or 66 features for each window sample.

The resulting dataset, 'tidy_data.txt' is obtained after step 4 of the 'run_analyis' R script.

Content :
- each row corresponds to a window sample performed by subjects from the individual and the training group (merging 'test.txt' and 'train.txt') - 10299 observations;
- first 66 columns are the measured features, focusing on those measuring the mean and standard deviation for each feature and each window sample. These columns have been named using the 'features.txt' dataset:
  - mean and standard deviation for tBodyAcc across 3 dimensions (X, Y, Z)
  - mean and standard deviation for tGravityAcc across 3 dimensions (X, Y, Z)
  - mean and standard deviation for tBodyAccJerk across 3 dimensions (X, Y, Z)
  - mean and standard deviation for tBodyGyro across 3 dimensions (X, Y, Z)
  - mean and standard deviation for tBodyGyroJerk across 3 dimensions (X, Y, Z)
  - mean and standard deviation for tBodyAccMag
  - mean and standard deviation for tGravityAccMag
  - mean and standard deviation for tBodyAccJerkMag
  - mean and standard deviation for tBodyGyroMag
  - mean and standard deviation for tBodyGyroJerkMag
  - mean and standard deviation for fBodyAcc across 3 dimensions (X, Y, Z)
  - mean and standard deviation for fBodyAccJerk across 3 dimensions (X, Y, Z)
  - mean and standard deviation for fBodyGyro across 3 dimensions (X, Y, Z)
  - mean and standard deviation for fBodyAccMag
  - mean and standard deviation for fBodyAccJerkMag
  - mean and standard deviation for fBodyGyroMag
  - mean and standard deviation for fBodyGyroJerkMag
- column 'subject' records the individual (number identification) having performed the activity measured in the window sample (obtained from merging the 'test.txt' dataset with the 'subject_test.txt' dataset, and 'train.txt' dataset with the 'subject_train.txt' dataset
- column 'activity' records the activity performed in the window sample (obtained from merging the 'test.txt' dataset with the 'y_test.txt' dataset, and 'train.txt' dataset with the 'y_train.txt' dataset and using the 'activity.txt' dataset to label the variable
(10299 observations of 68 variables)

### Second step: 'summary_data.txt' dataset

This dataset, 'summary_data.txt' is obtained in step 5 of the 'run_analyis' R script.
It contains the same variable but summarises by taking the mean of each of the 66 features for each of the 30 subject performing each of the 6 activities. 
(180 observations of 68 variables)
