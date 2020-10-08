if(!file.exists("./CourseEraPA3.zip")){
      fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      download.file(fileURL,destfile="CourseEraPA3.zip",method="curl")
}

if(!file.exists("./UCI HAR Dataset")){
      unzip("CourseEraPA3.zip")
}

#Reading the test and training data 
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")

X_training <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_training <- read.table("./UCI HAR Dataset/train/Y_train.txt")

#Getting the subjects for test and training data 
Subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
Subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#Getting the features
Features <-  read.table("./UCI HAR Dataset/features.txt")

#Merge the test and train datasets
X <- rbind(X_test, X_training)
Y <- rbind(Y_test, Y_training)
Sub <- rbind(Subject_test, Subject_train)

names(Sub) <-c("Subject")
names(Y) <- c("Activity")
names(X) <- Features[,2]
MergeData <- cbind(Sub, Y, X)

#Selecting measurements with std or mean in the name
StdMean_data <- select(MergeData, matches("std|mean"))
MergeData2 <- cbind(Sub, Y, StdMean_data)

#Assinging descriptive names to the activities
Y<- activity_Labels[MergeData$activity,2]
MergeDataF <- cbind(Sub, Y, StdMean_data)
colnames(MergeDataF)[2] <- "Activity"

#Using descriptive names for columns 
names(MergeDataF)<- gsub("^t", "Time", names(MergeDataF))
names(MergeDataF)<- gsub("^f", "Frequency", names(MergeDataF))
names(MergeDataF)<- gsub("-", "", names(MergeDataF))
 
# Creating a second independent tidy data set with the average 
#of each variable for each activity and each subject.

df <- MergeDataF %>% group_by(Activity, Subject) %>% across(funs(mean))
write.table(df, "TidyDataSet.txt", row.name=FALSE)


