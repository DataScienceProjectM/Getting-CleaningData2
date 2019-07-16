# Getting-CleaningData2

1.  Data from files . Read the data from UCI HAR Dataset folder from files: features.txt, activity_labels.txt, X_train and X_test, y_tain and y_test, subject_train and subject_test. Also assign names to some variable in order to make data readable.

 2. Merging test and train sets. At first I create train set by binding y_train, subject_train and x_train. Afterwards, do the same for test set. Then, merging the train and test sets

3. Extracting the measurements on the mean and standard deviation for each measurement. 

4. Using descriptive activity names to name the activities in the data set Merge data subset from step 3 with the activity      type table activity_labels to make the activity names. 

5. Label the data set with descriptive activity names. Used gsub function 

6. Create C4Data set with the average of each variable for each activity and each subject. 

7. write.table (C4Data, "C4Data.txt", row.name=FALSE)
