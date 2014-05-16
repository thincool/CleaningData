# run_analysis.R script for Getting and Cleaning Data Course Project on coursea
#STEP 1: Merges the training and the test sets to create one data set 
# read feature list  
features =read.table("features.txt")
names(features) = c("code","feature")
feature_names = features$feature

# read train data 
train_subjects = read.table("train/subject_train.txt")
train_data = read.table("train/X_train.txt")
train_result = read.table("train/y_train.txt")
# merge train data with subject and activity result together
train_data$subject = train_subjects$V1
train_data$activity = train_result$V1

# read test data
test_subjects = read.table("test/subject_test.txt")
test_data = read.table("test/X_test.txt")
test_result = read.table("test/y_test.txt")
# merge test data with subject and activity result together
test_data$subject = test_subjects$V1
test_data$activity = test_result$V1

# merge test and train data
full_data = rbind( train_data , test_data)

#STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
# there are 561 features 
columns = seq(1,561)
# find features with mean or std function
mean_sd_feature = grepl("\\bmean\\b", feature_names, ignore.case=TRUE) | grepl("\\bstd\\b", feature_names, ignore.case=TRUE)
mean_sd_columns = columns[mean_sd_feature]
# get data on all mean or std function columns and subject and activity columns
mean_sd_data = full_data[,c(mean_sd_columns,c(562,563))]

#STEP 3: Uses descriptive activity names to name the activities in the data set
# get all mean or std function feature names 
mean_sd_feature_names = feature_names[mean_sd_columns]
# replcae "-" with "_" in feature names
mean_sd_feature_names = gsub("-","_",mean_sd_feature_names)
# remove "()" in feature names
mean_sd_feature_names = gsub("\\()","",mean_sd_feature_names)
#name the mean_sd_data
names(mean_sd_data) = c(mean_sd_feature_names,c("subject","activity"))

#STEP 4: Appropriately labels the data set with descriptive activity names
# read activity labels
activity_labels =read.table("activity_labels.txt")
names(activity_labels) = c("code","activity")
mean_sd_data$activity = factor(mean_sd_data$activity,labels=activity_labels$activity)

#STEP 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidy = aggregate(mean_sd_data[,1:66],by=list(mean_sd_data$subject,mean_sd_data$activity),mean)
# default aggregate name is "group1" and "group2", so need fix it
tidy_name = names(tidy)
tidy_name[1]="subject"
tidy_name[2]="activity"
names(tidy) = tidy_name
#write tidy data to file
write.csv(tidy,file="tidy.csv.txt",row.names=FALSE)
