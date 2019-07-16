setwd("~/Documents/DataScience/Cleaning data - C3/UCI HAR Dataset")

## Step 1
features <- read.table("features.txt", col.names = c("n","functions"))
activities <- read.table("activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("test/subject_test.txt", col.names = "subject")
View(subject_test)
x_test <- read.table("test/X_test.txt", col.names = features$functions)
y_test <- read.table("test/y_test.txt", col.names = "code")
subject_train <- read.table("train/subject_train.txt", col.names = "subject")
x_train <- read.table("train/X_train.txt", col.names = features$functions)
y_train <- read.table("train/y_train.txt", col.names = "code")
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)

Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)

## Step 2
TidyD <- Merged_Data %>% select (subject, code, contains("mean"), contains("std"))
## Step 3

TidyD$code <- activities[TidyD$code, 2]

## Step 4
names(TidyD)[2] = "activity"
names(TidyD)<-gsub("Acc", "Accelerometer", names(TidyD))
names(TidyD)<-gsub("Gyro", "Gyroscope", names(TidyD))
names(TidyD)<-gsub("BodyBody", "Body", names(TidyD))
names(TidyD)<-gsub("Mag", "Magnitude", names(TidyD))
names(TidyD)<-gsub("^t", "Time", names(TidyD))
names(TidyD)<-gsub("^f", "Frequency", names(TidyD))
names(TidyD)<-gsub("tBody", "TimeBody", names(TidyD))
names(TidyD)<-gsub("-mean()", "Mean", names(TidyD), ignore.case = TRUE)
names(TidyD)<-gsub("-std()", "STD", names(TidyD), ignore.case = TRUE)
names(TidyD)<-gsub("-freq()", "Frequency", names(TidyD), ignore.case = TRUE)
names(TidyD)<-gsub("angle", "Angle", names(TidyD))
names(TidyD)<-gsub("gravity", "Gravity", names(TidyD))
## Step 5
C4Data <- TidyD %>% group_by(subject, activity) %>% summarise_all(funs(mean))
write.table(C4Data, "C4Data.txt", row.name=FALSE)
