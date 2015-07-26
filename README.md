---
title: "README.md"
output: html_document
---

# My Submission for the Getting and Cleaning Data Coure Project

###Submitted files:
 - README.md - this file
 - run_analysis.R - An R script that processes the dataset of http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
 - CodeBook.md - A code book that describes the variables, the data, and transformations that I performed to clean up the data
 
### Usage of run_analysis.R:
  - Download https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  - Set your R working directory to the "UCI HAR Dataset" folder contained in the above zip file and run run_analysis.R
  - This will create a file tiny_data.txt, which is the output of write.table().
  
### What run_analysis.R does: 
The cleaning script (run_analysis.R) Does the following:
 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names. 
 5. From the data set in step 4, creates a second, independent tidy data (tidy_data.txt) set with the average of each variable for each activity and each subject.

