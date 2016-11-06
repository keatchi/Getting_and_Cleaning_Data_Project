##1.Merges the training and the test sets to create one data set.

#Reading all relevant tables
setwd("/Users/keatchi/Coursera-R/UCI HAR Dataset");
X_train <- read.table("train/X_train.txt");
y_train <- read.table("train/y_train.txt");
subject_train<-read.table("train/subject_train.txt");
X_test <- read.table("test/X_test.txt");
y_test <- read.table("test/y_test.txt");
subject_test<-read.table("test/subject_test.txt");
features<-read.table("features.txt");
activity_labels<-read.table("activity_labels.txt");

#combine data x
mergedX<-rbind(X_train,X_test);

#combine data y
mergedY<-rbind(y_train,y_test);

#combine data subject
mergedSub<-rbind(subject_train,subject_test);

#rename data's columns
colnames(activity_labels)=c("activityID","activityType");
colnames(mergedX)=features[,2];
colnames(mergedY)="activityID";
colnames(mergedSub)="subjectID";

##2.Extracts only the measurements on the mean and standard deviation for each measurement.

#Extract required columns from mergedX
mean_stdDev_col<-mergedX[grep("(mean|std)\\(\\)",colnames(mergedX))];
#Merge all required columns
mergedAll=cbind(mergedY,mergedSub,mean_stdDev_col);

##3.Uses descriptive activity names to name the activities in the data set

library(plyr)
mergedAct<-join(activity_labels,mergedAll);

##4.Appropriately labels the data set with descriptive variable names.

#Remove "-" and parentheses from the columns' name
names(mergedAct)<-gsub("-"," ",names(mergedAct));
names(mergedAct)<-gsub("\\(|\\)","",names(mergedAct));

##5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Group data by activity id,activity tyoe and subject id and create mean columns for every feature
ActSubMean <- group_by(mergedAct,activityID,activityType,subjectID);
ActSubMean<-summarize_each(ActSubMean,funs(mean));

#Create tidy data set
write.table(ActSubMean, file = "tidyData.txt", row.names = FALSE)
