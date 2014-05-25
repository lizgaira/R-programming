list.files()
features<-read.delim("features.txt", sep=" ", dec=".", header=F)
head(features)
features[1:20,]
dim(features)
class(features)
labels<-read.delim("activity_labels.txt", sep=" ", dec=".", header=F)
labels
dim(labels)

#TRAIN
subjtrain<-read.delim("train\\subject_train.txt", sep=" ", dec=".", header=F)
head(subjtrain)
tail(subjtrain)
table(subjtrain)
dim(subjtrain)
names(subjtrain)<-"subject"
trainX<-read.table("train\\X_train.txt", header=F)
head(trainX)
dim(trainX)
summary(trainX)
names(trainX)<-features$V2
trainY<-read.delim("train\\y_train.txt", sep=" ", dec=".", header=F)
head(trainY)
dim(trainY)
tail(trainY)
names(trainY)<-"act_code"

#TEST
subjtest<-read.delim("test\\subject_test.txt", sep=" ", dec=".", header=F)
head(subjtest)
dim(subjtest)
table(subjtest)
names(subjtest)<-"subject"
testX<-read.table("test\\X_test.txt", header=F)
head(testX)
dim(testX)
testX[1:20,1:20]
summary(testX)
names(testX)<-features$V2

testY<-read.delim("test\\y_test.txt", sep=" ", dec=".", header=F)
head(testY)
dim(testY)
table(testY)
testY[100:150,]
names(testY)<-"act_code"

#create training set and test set:
train_set<-cbind(subjtrain,trainY,trainX)
test_set<-cbind(subjtest,testY,testX) 
table(names(train_set) %in% names(test_set))#563

#rbind training and test sets:
data<-rbind(train_set,test_set)
##we have all data together for all subjects in the study.

#mean and sd for every feature:
means<-as.data.frame(apply(data[,3:563],2,mean))
names(means)<-c("mean")
sds<-as.data.frame(apply(data[,3:563],2,sd))
names(sds)<-c("sd")
df_mean_sd<-cbind(means,sds)
head(df_mean_sd)

#descriptive activity names to name the activities in the data set:
labels2<-as.vector(labels$V2)
class(labels2)
names(data)
class(data$act_code)
data$activity<-data$act_code
data$activity[data$activity==1]<-labels2[1]
data$activity[data$activity==2]<-labels2[2]
data$activity[data$activity==3]<-labels2[3]
data$activity[data$activity==4]<-labels2[4]
data$activity[data$activity==5]<-labels2[5]
data$activity[data$activity==6]<-labels2[6]
table(data$act_code)
table(data$activity)

#dataset with average of each variable for each activity and each subject
data2<-data[,c(1,564,3:563)]
library(reshape2)
data3 <- melt(data2, id=c("activity","subject")) 
names(data3)
#data3[1:35,]
df_average_act_subject<-dcast(data3, activity + subject ~ variable, fun.aggregate=mean)
head(df_average_act_subject)[1:10]
dim(df_average_act_subject)
#write.table(df_average_act_subject,"tidydataset.txt", sep="\t",dec=".", row.names=F)
