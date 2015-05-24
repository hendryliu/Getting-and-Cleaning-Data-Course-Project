## Raw Data
The information of raw data is available at ["Human Activity Recognition Using Smartphones Data Set"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The raw data contains training and test data set, both training and test data have features for each activity and subject.

## Variables
* `train_set` contains the combination of training feature data, class labels of activity names (1 to 6) and subject who performed the activity (1 to 30). Note that features are normalized and bounded within [-1,1].
* `test_set` contains the combination of test feature data, class labels of activity names (1 to 6) and subject who performed the activity (1 to 30). Note that features are normalized and bounded within [-1,1].
* `full_data` merges the `train_set` and `test_set`.
* `full_data_mean_std` is a data frame, which extracts only the measurements on the mean and standard deviation (std) for each measurement. In addition, each variable of `full_data_mean_std` is renamed by corresponding names of feature/activity/subject. "Time" in the variable name denotes that signals are in time domain, whereas "Frequency" denotes that signals are transformed to frequency domain by Fast Fourier Transform. "X", "Y" are "Z" are used to denote 3-axial signals in the X, Y and Z directions.
* Finally, `tidy_data` contains the average of each variable for each activity and each subject from `full_data_mean_std`.
