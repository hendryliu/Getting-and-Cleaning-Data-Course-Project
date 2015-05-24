# Getting-and-Cleaning-Data-Course-Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

## Files
##### `run_analysis.R`
R script to do the following.
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set.
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##### `tidy_data.txt`
Final output text file, which contains tidy data set with the average of each variable for each activity and each subject.

##### `CodeBook.md`
The file describes the variables, the data, and any transformations or work that you performed to clean up the data.

## Usage
1. Git clone the repository.
2. Download the compressed data to the repository root directory from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
3. Unzip the data.
4. Open `run_analysis.R`, and run it.
