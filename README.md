##Coursera - Getting and Cleaning Data - Course Project

This repository is for the peer-graded assignment of the Getting and Cleaning data Coursera course. The purpose of this project is for students to demonstrate their ability to collect, work with, and clean a data set.
This project uses the Human Activity Recognition Using Smartphones Data Set provided by the UCI Machine Learning repository (storing a series of measurements captured using a smartphone as a group of 30 volunteers performed 6 different activities).

The instructions for the assignment were the following:
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This repository contains the following documents:
1.	HAR datasets: data, as downloaded from UCI website on 11/09/2018;
2.	tidy_dataset.csv: dataset constructed for instructions 1 to 4;
3.	grouped_dataset.csv: dataset constructed for instruction 5;
4.	run_analysis.R: R script that downloads and tidies the data from HAR datasets to tidy_dataset and grouped_dataset in line with instructions;
5.	CodeBook.md: describes the content of the original HAR datasets and of the two created datasets (tidy_dataset.csv and grouped_dataset.csv), with details on the transformation and work performed on original datasets.
6.	This readme.md.
