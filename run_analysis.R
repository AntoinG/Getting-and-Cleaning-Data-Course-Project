library(dplyr)
library(plyr)

#step 1: merging the training and test data into one data set
#reading the training data

X_train <- read.table("./train/X_train.txt")
Y_train <- read.table("./train/y_train.txt")
Sub_train <- read.table("./train/subject_train.txt")

#reading the test data

X_test <- read.table("./test/X_test.txt")
Y_test <- read.table("./test/y_test.txt")
Sub_test <- read.table("./test/subject_test.txt")

#creating the X, Y and subject set
X_data <- rbind(X_train, X_test)
Y_data <- rbind(Y_train, Y_test)
Sub_data <- rbind(Sub_train, Sub_test)

#Step 2: Extract only the measurements on the mean and standard deviation for each measurement

Features <- read.table("features.txt")

# getting the columns with mean() or std() in their names
Mean_and_std_features <- grep("-(mean|std)\\(\\)", Features[, 2])

# subset of the requested columns
X_data <- X_data[, Mean_and_std_features]

# correcting column names
names(X_data) <- Features[Mean_and_std_features, 2]

# Step 3: Use descriptive activity names to name the activities in the data set
Activity_names <- read.table("activity_labels.txt")

# updating values with correct activity names
Y_data[, 1] <- Activity_names[Y_data[, 1], 2]

# correct column name
names(Y_data) <- "activity"

# Step 4: Appropriately label the data set with descriptive variable names
# correcting column name
names(Sub_data) <- "subject"

# binding all data in one single data set
All_data <- cbind(X_data, Y_data, Sub_data)

#Step 5: Creating a second, independent tidy data set with the average of each variable for each activity and each subject
# there are 68 columns, last two columns no variable to average
Avg_data <- ddply(All_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(Avg_data, "avg_data.txt", row.name=FALSE)
