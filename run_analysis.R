
# PLEASE NOTE THAT THIS SCRIPT IS NOT STRUCTURE STRICTLY AS IN THE INSTRUCTION

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# read labels/colnames of the data from features.txt
raw.ftr<-read.table("UCI HAR Dataset/features.txt",head=TRUE,stringsAsFactors=FALSE)

# filter which column names which represents mean/stdev as required in the instruction
# note that the condition for grep was strict (ex:mean() instead of wildcard seacrh)
# the argument was that since the instruction ask for mean and std, while other variable contains mean (that is not mean()) had no corresponding std stats
mean.index<-grep("mean()",raw.ftr[,2],fixed=TRUE)
std.index<-grep("std()",raw.ftr[,2],fixed=TRUE)
filt.index<-c(mean.index,std.index)
filt.ftr<-raw.ftr[filt.index[order(filt.index)],]
ftr.index<-filt.ftr[,1]
ftr.id<-filt.ftr[,2]

# read the data, activity label, and subject label
X_test<-read.table("UCI HAR Dataset/test/X_test.txt",head=TRUE,stringsAsFactors=FALSE)[,ftr.index]
X_train<-read.table("UCI HAR Dataset/train/X_train.txt",head=TRUE,stringsAsFactors=FALSE)[,ftr.index]
y_test<-read.table("UCI HAR Dataset/test/y_test.txt",head=TRUE,stringsAsFactors=FALSE)
y_train<-read.table("UCI HAR Dataset/train/y_train.txt",head=TRUE,stringsAsFactors=FALSE)
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt",head=TRUE,stringsAsFactors=FALSE)
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt",head=TRUE,stringsAsFactors=FALSE)


# 3  Uses descriptive activity names to name the activities in the data set
colnames(X_test)<-ftr.id
colnames(X_train)<-ftr.id
colnames(y_test)<-"Activity"
colnames(y_train)<-"Activity"
colnames(subject_test)<-"Subject"
colnames(subject_train)<-"Subject"
test.dat<-cbind(subject_test,y_test,X_test)
train.dat<-cbind(subject_train,y_train,X_train)
dataset<-rbind(train.dat,test.dat)


# 4. Appropriately labels the data set with descriptive variable names. 
# read activity labels
raw.act<-read.table("UCI HAR Dataset/activity_labels.txt",head=FALSE,stringsAsFactors=FALSE)
colnames(raw.act)<-"Activity"
# change activity labels to descriptive
desc.act<-raw.act[dataset[,2],2]
act.dataset<-dataset
act.dataset[,2]<-desc.act


firstdata<-act.dataset
names(firstdata)<-gsub("^t", "time", names(firstdata))
names(firstdata)<-gsub("^f", "frequency", names(firstdata))
names(firstdata)<-gsub("Acc", "Accelerometer", names(firstdata))
names(firstdata)<-gsub("Gyro", "Gyroscope", names(firstdata))
names(firstdata)<-gsub("Mag", "Magnitude", names(firstdata))
names(firstdata)<-gsub("BodyBody", "Body", names(firstdata))


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
require(plyr)
avgsplit<-ddply(firstdata,c("Subject","Activity"),numcolwise=(mean))
write.table(avgsplit,file="tidydata.txt")
