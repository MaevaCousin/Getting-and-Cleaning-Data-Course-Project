
#This script fulfills the Coursera "Getting and Cleaning Data" assignment.

# It downloads the Human Activity Recognition files, load the relevant datasets, 
# tidies them up, and performs the various required data manipulations.

setwd("~/RCoursera/Getting and cleaning data/Assignment/Final")

## Download and unzip the data for the project, available here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!file.exists("UCI_HAR_Dataset.zip")) 
{
      message("Downloading dataset")
      download.file(url, destfile="UCI_HAR_Dataset.zip")
      unzip("UCI_HAR_Dataset.zip")
}

## Open the datasets useful for the analysis
features <- read.table("./UCI HAR Dataset/features.txt", quote="\"", comment.char="")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")
test <- read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")
train <- read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")


## Label the columns  for the train/test datasets (using features)
t_features<-t(features)
t_features<-t_features[2,]

train <- rbind(train,t_features)
names(train)<-train[nrow(train),]
train<-train[-nrow(train),]

test <- rbind(test,t_features)
names(test)<-test[nrow(test),]
test<-test[-nrow(test),]

## Add activity and subject data to the test and train datasets

# Add column for subject number (subject_xx dataset) to the train/test datasets
train <- cbind(train,subject_train)
test <- cbind(test,subject_test)
colnames(train)[ncol(train)]<-"subject"
colnames(test)[ncol(test)]<-"subject"

# Add column for activity type (yt_xx dataset) to the train/test datasets
# and label the values (activity_labels)
train <- cbind(train,y_train)
test <- cbind(test,y_test)
colnames(train)[ncol(train)]<-"activity"
colnames(test)[ncol(test)]<-"activity"


#1) Merges the training and the test sets to create one data set.

data<-rbind(test,train)


#2) Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses "features" dataframe and grep function to identify variables that refer to "mean" and "std"
# but removing variables that refer to "meanFreq"
# Extract these variables from the "data" dataframe, including also the descriptive variables
# (subject, activity) at the end

c1<-grep("mean",features[,2])
c2<-grep("meanFreq",features[,2])
cmean<-setdiff(c1,c2)

data<-data[,c(cmean,grep("std",features[,2]),562,563)]


#3) Uses descriptive activity names to name the activities in the data set
labels<-activity_labels[,2]
data$activity <- factor(data$activity,levels = c(1,2,3,4,5,6),
                         labels = labels) 


#4) Appropriately labels the data set with descriptive variable names.

# Note: already done directly on the rain/test datasets in rows 41 to 51

# Save dataset:
write.table(data,"tidy_data.txt",sep="\t",row.names=FALSE)


#5) From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

##Load package dplyr

if (!require("dplyr")) {
      message("Installing dplyr")
      install.packages("dplyr")
}

library(dplyr)

# transform all variables to numeric
for (i in 1:66){
      data[,i]=as.numeric(data[,i])
}

# Create a summary data set with average of each variable for each subject and each activity 
summary<-data %>%
      group_by(subject,activity) %>%
      summarise_all(mean)

# Save dataset:
write.table(summary,"summary_data.txt",sep="\t",row.names=FALSE)

