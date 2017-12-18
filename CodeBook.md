Introduction:

The script run_analysis.R performs the 5 steps described in the project assigment

Before running this script, make sure dplyr and plyr are installed

run_analysis.R that does the following:
1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. From the data set in step 4, creates a second, independent tidy data set with the average 
   of each variable for each activity and each subject.

Variables:

In X_train, Y_train, X_test, Y_test, Sub_train and Sub_test the data from the downloaded files is contained
The data sets are merged for futher analysis in X_data, Y_data and Sub_data
Features contains the correct names for X_data, wich are stored in Mean_and_std_features
For Activity_names a similar approach is used
All_data merges X_data, Y_data and Sub_data in a big data set
At last avg_data is created containing the averages and these are stored in a .txt file.From theplyr package ddply() is used to apply the colMeans()
