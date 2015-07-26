## This is a script written for the Coursera "Getting and Cleaning Data" Practical Assignment


## 1. Merges the training and the test sets to create one data set.
library(plyr)
library(stringr)
features <- read.table("features.txt")
activity <- read.table("activity_labels.txt", stringsAsFactors = FALSE)


subject_test <- read.table("test/subject_test.txt", stringsAsFactors = FALSE)
X_test <- read.table("test/X_test.txt", stringsAsFactors = FALSE)
y_test <- read.table("test/y_test.txt", stringsAsFactors = FALSE)

subject_train <- read.table("train/subject_train.txt", stringsAsFactors = FALSE)
X_train <- read.table("train/X_train.txt", stringsAsFactors = FALSE)
y_train <- read.table("train/y_train.txt", stringsAsFactors = FALSE)

## 1.2 Appropriately labels the data set with descriptive variable names.  
colnames(X_test) <- features$V2
colnames(X_train) <- features$V2
colnames(subject_test) = "subject"
colnames(subject_train) = "subject"
colnames(y_test) = "activity"
colnames(y_train) = "activity"

## 1.3 glue the data together
test <- cbind(subject_test, y_test, X_test )
train <- cbind(subject_train, y_train, X_train)
data <- rbind(test,train)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

meanOrStd <- (str_detect(colnames(data), "std\\(\\)") 
                | str_detect(colnames(data), "mean\\(\\)") 
                | str_detect(colnames(data), "subject") 
                | str_detect(colnames(data), "activity") )

data2 <- data[meanOrStd]

## 3. Uses descriptive activity names to name the activities in the data set
data2$activity <- mapvalues(data2$activity,from = as.character(activity[[1]]), to = activity[[2]])

## 4. Appropriately labels the data set with descriptive variable names. 
# NOTE: I did this in step 1.2

## 5. From the data set in step 4, creates a second, independent tidy data set with the 
##    average of each variable for each activity and each subject.

library(dplyr)
mysummary <- group_by(tbl_df(data2), subject, activity) %>% summarise_each(funs(mean))
write.table(mysummary,file = "mytidydataset.txt", row.names=FALSE)