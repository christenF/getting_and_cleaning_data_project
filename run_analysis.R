### loading data for the training set
training_set <- read.table("UCI HAR Dataset/train/X_train.txt")
###loading training set labels
training_labs <- read.table("UCI HAR Dataset/train/y_train.txt")
###loading training set subjects
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
###load features (colnames for the dataframe) and activity labels
features <- read.table("UCI HAR Dataset/features.txt")
activity_labs <- read.table("UCI HAR Dataset/activity_labels.txt")

##rename  columns to describe what they mean
colnames(training_set) <- features$V2        ## label the variables as features
colnames(training_labs) <- c("activity")
colnames(subject_train) <- c("subject")

###add columns subject and activity to the training_set (columns 1 and 2)
training_set <- cbind(subject_train, training_labs, training_set)

###loading data for the test set
test_set <- read.table("UCI HAR Dataset/test/X_test.txt")
test_labs <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

colnames(test_set) <- features$V2
colnames(test_labs) <- c("activity")
colnames(subject_test) <- c("subject")
test_set <- cbind(subject_test, test_labs, test_set)

### combining training and test data set
data_set <- rbind(training_set, test_set)

### extract measurements for mean and sd
library(dplyr)
data_mean <- data_set%>%
    select(subject, activity, contains("mean()"), contains("std()"))

### label activities
data_mean$activity <- factor(data_mean$activity,
                             labels = tolower(activity_labs$V2))

### average for each measurement
library(tidyr)
data_avg <- data_mean%>%
    gather(measurement, value, -subject, -activity)%>%
    group_by(subject, activity, measurement)%>%
    summarize(average = mean(value))

write.table(data_avg, "tidy_data_set.txt", row.names = F)
