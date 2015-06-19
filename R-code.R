#downloading and unzipping the data
dataset_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataset_url,"UCIHARDataset.zip", method="curl")
unzip("UCIHARDataset.zip")
test.X <- read.csv("UCI HAR Dataset/test/X_test.txt",header = FALSE, sep = '')
train.X<- read.csv("UCI HAR Dataset/train/X_train.txt",header = FALSE, sep = '')
features<-read.csv("UCI HAR Dataset/features.txt",header = FALSE, sep = '')

#giving both the train and test data the variable names provided in features.txt
feat<-features[,2]
names(test.X)<-feat
names(train.X)<-feat
#Moreover adding downloading the activities and volunteers data
# and adding it to the respective data sets
test.Y<- read.csv("UCI HAR Dataset/test/Y_test.txt",header = FALSE, sep = '')
train.Y<- read.csv("UCI HAR Dataset/train/Y_train.txt",header = FALSE, sep = '')
subject.train<-read.csv("UCI HAR Dataset/train/subject_train.txt",header = FALSE, sep = '')
subject.test<-read.csv("UCI HAR Dataset/test/subject_test.txt",header = FALSE, sep = '')
train.X$activities <- train.Y[, 1]
train.X$volunteers <- subject.train[, 1]
test.X$activities <- test.Y[, 1]
test.X$volunteers <- subject.test[, 1]
#finally merging the test and train data
new.tot<-rbind(test.X,train.X)

#Extracting only the measurements on the mean and standard deviation for each measurement. 
new.tot.2<-new.tot[,grep("-mean()",names(new.tot), fixed = TRUE,  value=TRUE)]
new.tot.3<-new.tot[,grep("-std()",names(new.tot), fixed = TRUE,  value=TRUE)]
new.tot.4<-cbind(new.tot.2,new.tot.3)
#Applying descriptive activity names to the activities in the data set
new.tot$activities <- as.character(new.tot$activities)
new.tot$activities[new.tot$activities == 1] <- "Walking"
new.tot$activities[new.tot$activities == 2] <- "Walking Upstairs"
new.tot$activities[new.tot$activities == 3] <- "Walking Downstairs"
new.tot$activities[new.tot$activities == 4] <- "Sitting"
new.tot$activities[new.tot$activities == 5] <- "Standing"
new.tot$activities[new.tot$activities == 6] <- "Laying"

#making the variable names more descriptive 
names(new.tot)<-gsub("Acc", "Accelerometer", names(new.tot), ignore.case = FALSE, perl = FALSE,
     fixed = FALSE, useBytes = FALSE)
names(new.tot)<-gsub("Gyro", "Gyroscope" , names(new.tot), ignore.case = FALSE, perl = FALSE,
     fixed = FALSE, useBytes = FALSE)
names(new.tot)<-gsub("Mag", "Magnitude" , names(new.tot), ignore.case = FALSE, perl = FALSE,
     fixed = FALSE, useBytes = FALSE)
names(new.tot)<-gsub("^t", "time" , names(new.tot), ignore.case = FALSE, perl = FALSE,
     fixed = FALSE, useBytes = FALSE)
names(new.tot)<-gsub("^f", "frequency" , names(new.tot), ignore.case = FALSE, perl = FALSE,
     fixed = FALSE, useBytes = FALSE)
names(new.tot)<-gsub("-arCoeff()", "-autoregressionCoefficient" , names(new.tot), ignore.case = FALSE, perl = FALSE,
     fixed = FALSE, useBytes = FALSE)
names(new.tot)<-gsub("-iqr()", "-interquartileRange" , names(new.tot), ignore.case = FALSE, perl = FALSE,
     fixed = FALSE, useBytes = FALSE)
names(new.tot)<-gsub("-sma()", "-signalMagnitudeArea" , names(new.tot), ignore.case = FALSE, perl = FALSE,
     fixed = FALSE, useBytes = FALSE)

#Making a new tiday Data set with the average of each variable for each activity and each subject.
new.tot$activities <- as.factor(new.tot$activities)
new.tot$volunteers <- as.factor(new.tot$volunteers)
new.tot.2<-data.table(new.tot)
TidyData <- new.tot.2[, lapply(.SD, mean), by = 'volunteers,activities']

