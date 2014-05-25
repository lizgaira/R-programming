R-programming
=============
##Assignment2:

* In our working directory ("\\UCI HAR Dataset"), we explore the structure of the files provided. We open them and check dimensions to match files. We rename the files "X_train.txt" and "X_test.txt"" with "features.txt"; and give column names to "subject_" and "y_" files ("subject" and "act_code" respectively).

* We create a training_set and a test_set "cbinding" the correspondant subject, Y_ and X_ files.

* We "rbind"" both training_set and test_set, so now we have all data of the study together.

* We calculate mean and stardard deviation  for every feature with apply function and then create a dataframe with both statistics (df_mean_sd).

* We assign descriptive activity names (got from activity_labels.txt) to name the activities in the data set.

* We calculate the average of each variable for each activity and each subject (library reshape2; functions melt and dcast). We export the resultant dataframe (df_average_act_subject).
