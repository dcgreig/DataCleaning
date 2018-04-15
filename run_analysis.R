# File: run_analysis.R
# Purpose: Prepare a tidy dataset from training and test data sets sourced from accelerometer samples of a number
#           of test subject.
# Author: D. Greig
# Date: 2018-04-15

# merge training and test sets

# extract measurements on mean and standard deviation for each measurement

# add descriptive activity names

# add meaningful labels

# creation of tidy data with averages of each variable for each activity and each subject

runanalysis <- function() {

    library(dplyr)
    
    # get headers for data file
    features<-read.table("./data/features.txt")
    
    # create test dataframe
    testraw <- read.table("./data/test/X_test.txt")
    testsubjects <- read.table("./data/test/subject_test.txt")
    testactivity <- read.table("./data/test/y_test.txt")
    
    # get column names for test
    names(testraw) <- features$V2
    names(testsubjects) <- c("subject")
    names(testactivity) <- c("activity")
    # prepend activity and subject columns
    testraw <- cbind(testactivity, testraw)
    testraw <- cbind(testsubjects, testraw)
    
    # create train dataframe
    trainraw <- read.table("./data/train/x_train.txt")
    trainsubjects <- read.table("./data/train/subject_train.txt")
    trainactivity <- read.table("./data/train/y_train.txt")
    
    # get column names for train
    names(trainraw) <- features$V2
    names(trainsubjects) <- c("subject")
    names(trainactivity) <- c("activity")
    # prepend activity and subject columns
    trainraw <- cbind(trainactivity, trainraw)
    trainraw <- cbind(trainsubjects, trainraw)
    
    # merge test and train dataframes
    bothraw <- rbind(testraw, trainraw)
    
    # name the activities
    bothraw$activity <- sub("1", "walking", bothraw$activity)
    bothraw$activity <- sub("2", "walkingupstairs", bothraw$activity)
    bothraw$activity <- sub("3", "walkingdownstairs", bothraw$activity)
    bothraw$activity <- sub("4", "sitting", bothraw$activity)
    bothraw$activity <- sub("5", "standing", bothraw$activity)
    bothraw$activity <- sub("6", "laying", bothraw$activity)
    

    # limit data to means and standard deviation columns only
    stdcols <- grep("std", features$V2, value=TRUE)
    meancols <- grep("mean", features$V2, value = TRUE)
    allcols <- c("subject", "activity", meancols, stdcols)
    bothraw <- bothraw[,allcols]

    # clean up column names (remove parentheses and hyphens)
    names(bothraw) <- tolower(gsub("[()-]","",names(bothraw)))
    
    # Create tidy dataset:
    #   group by subject and activity
    #   apply mean function to all columns (except group by columns)
    tidy <- tbl_df(bothraw) %>%
                group_by(subject,activity) %>% 
                    summarize_all(funs(mean))

    # create output file
    write.table(tidy, "./tidy.txt", row.name=FALSE)
}