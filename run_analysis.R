# run_analysis.R
library(plyr)
library(dplyr)

setwd("/home/bvillada/getdata-032/project/UCI HAR Dataset/")

# read train data feature vectors
if (file.exists("./train/X_train.txt")){
        X_train <- data.frame(read.table("./train/X_train.txt"))       
 #       str(X_train)
}
# read train data activity labels
if (file.exists("./train/y_train.txt")){
        y_train <- data.frame(read.table("./train/y_train.txt"))
 #       str(y_train)        
}

# read train data subject ids
if (file.exists("./train/subject_train.txt")){
        subject_train <- data.frame(read.table("./train/subject_train.txt"))
#       str(subject_train)        
}

# read test data feature vectors
if (file.exists("./test/X_test.txt")){
        X_test <- data.frame(read.table("./test/X_test.txt"))         
}

# read test data activity labels
if (file.exists("./test/y_test.txt")){
        y_test <- data.frame(read.table("./test/y_test.txt"))
        #       str(y_test)        
}
# read test data subject ids
if (file.exists("./test/subject_test.txt")){
        subject_test <- data.frame(read.table("./test/subject_test.txt"))
        #       str(subject_test)        
}

# read activity ID and names
if (file.exists("./activity_labels.txt")){
        activity_labels <- data.frame(read.table("./activity_labels.txt"))
        }

colnames(y_test) <- 'activityID'
colnames(subject_test) <- "subjectID"
X_test$ID <- subject_test$subjectID
# descriptive activity labels
y_test$activityID <- activity_labels[,2][match(y_test$activityID, activity_labels[,1])]
X_test$activity <- y_test$activityID
test_label_features <- X_test

colnames(y_train) <- 'activityID'
colnames(subject_train) <- "subjectID"
X_train$ID <- subject_train$subjectID
# descriptive activity labels
y_train$activityID <-  activity_labels[,2][match(y_train$activityID, activity_labels[,1])]
X_train$activity <- y_train$activityID
train_label_features <- X_train

allData <- rbind(train_label_features,test_label_features)
allData <- allData[,c(563,1:562)]

# labels the data set with descriptive variable names.
if (file.exists("./features.txt")){
        feature_id_name <- data.frame(read.table("./features.txt",sep="", header=FALSE))
}
feature_id_name$V1 <- paste0("V",feature_id_name$V1)
beautify<-function(name){
        string <- gsub("\\(\\)","",name)        
}
colnames(allData)[2:562] <- beautify(as.character(feature_id_name$V2[match(colnames(allData)[2:562],feature_id_name$V1)]))

# subset with mean and standard deviation variables
noDuplicatesData <- allData[, !duplicated(colnames(allData))]
mean_std_data <- dplyr::select(noDuplicatesData, matches('(ID|mean|std|activity)'))

# independent tidy data set with the average of each variable for each activity and each subject
average_variable_tidy <- mean_std_data %>% group_by(activity,ID) %>% summarise_each(funs(mean))
write.table(average_variable_tidy,file="../project_average_variable_tidy_dataset.txt",row.name=FALSE)