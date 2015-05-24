rm(list=ls())
setwd("~/Documents/GitHub/Getting-and-Cleaning-Data-Course-Project")
datafolder <- "./UCI HAR Dataset/"

# read feature names
data_label <- read.table(paste0(datafolder,"features.txt"))

# read train data set
data_train <- read.table(paste0(datafolder,"train/X_train.txt"))
names(data_train) <- data_label$V2
label_train <- read.table(paste0(datafolder,"train/y_train.txt"))
names(label_train)  <- "activity"
subject_train <- read.table(paste0(datafolder,"train/subject_train.txt"))
names(subject_train)  <- "subject"
train_set <- cbind(data_train,label_train,subject_train)

# read test data set
data_test <- read.table(paste0(datafolder,"test/X_test.txt"))
names(data_test) <- data_label$V2
label_test <- read.table(paste0(datafolder,"test/y_test.txt"))
names(label_test)  <- "activity"
subject_test <- read.table(paste0(datafolder,"test/subject_test.txt"))
names(subject_test)  <- "subject"
test_set <- cbind(data_test,label_test,subject_test)

# 1.Merges the training and the test sets to create one data set.
full_data <- rbind(train_set,test_set)
rm(train_set, test_set, data_train, data_test) # remove the large data set
print(object.size(full_data),unit="MB")

# 2.Extracts only the measurements on the mean and standard deviation for each measurement.
full_data_mean_std <- full_data[,grep("(mean|std)\\(\\)", data_label$V2)]
full_data_mean_std <- cbind(full_data_mean_std,full_data[,c("activity","subject")])  # append activity and subject column to full_data_mean_std
rm(full_data)

# 3.Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table(paste0(datafolder,"activity_labels.txt"))
full_data_mean_std$activity  <- as.factor(full_data_mean_std$activity)
levels(full_data_mean_std$activity) <- activity_labels$V2

# 4. Appropriately labels the data set with descriptive variable names.
names(full_data_mean_std) <- gsub("^t","Time",names(full_data_mean_std))
names(full_data_mean_std) <- gsub("^f","Frequency",names(full_data_mean_std))
# names(full_data_mean_std) <- gsub("Acc[^J]","Acceleration",names(full_data_mean_std))
# names(full_data_mean_std) <- gsub("Gyro[^J]","AngularAcceleration",names(full_data_mean_std))
names(full_data_mean_std) <- gsub("Acc-","Acceleration-",names(full_data_mean_std))
names(full_data_mean_std) <- gsub("Gyro-","AngularAcceleration-",names(full_data_mean_std))
names(full_data_mean_std) <- gsub("AccM","AccelerationM",names(full_data_mean_std))
names(full_data_mean_std) <- gsub("GyroM","AngularAccelerationM",names(full_data_mean_std))
names(full_data_mean_std) <- gsub("AccJerk","LinearAcceleration",names(full_data_mean_std))
names(full_data_mean_std) <- gsub("GyroJerk","AngularVelocity",names(full_data_mean_std))
names(full_data_mean_std) <- gsub("Mag","Magnitude",names(full_data_mean_std))
names(full_data_mean_std) <- gsub("\\(\\)","",names(full_data_mean_std))
names(full_data_mean_std)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
tidy_data <- ddply(full_data_mean_std, .(activity,subject), numcolwise(mean, na.rm=TRUE))
# averages_data <- ddply(full_data_mean_std, .(activity,subject), function(x) colMeans(x[, 1:66]))
head(tidy_data)
tail(tidy_data)
write.table(tidy_data,file="tidy_data.txt",row.name=FALSE)
