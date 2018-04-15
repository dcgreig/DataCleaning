# File: README.md

-------------------------
Description:
The purpose of this project is to clean data from multiple files in order to produce a single tidy data set.  The 
source for this data is accelerometer measurements taken from 30 participants engaging in a variety of activities (sitting, standing, climbing stairs, lying down).  

Given the output from the Data Source link in the References link below, the included R function will merge data
from the test and training data sets, extracting only measurements for mean and standard deviation.  The resulting data will then be massaged in order to make the variables meaningfully-named and the activities easier to read.

This data will then be converted into a tidy data set, by grouping the data by user and activity, and averaging the resulting measurements.  The tidy data is then written to an output file, tidy.txt.

-------------------------
Execution:
The included file, run_analysis.R can be executed from an R environment in order to load the 
analysis function, runanalysis().  When run, runanalysis() will produce an output file, tidy.txt.

The function assumes that the data set below exists in s subdirectory called data, with the following files:
data\activity_labels.txt <-- Links the class labels with their activity name
data\features.txt  <-- List of all features
data\features_info.txt <-- Shows information about the variables used on the feature vector
data\test <-- test data set
data\train <-- training data set

For more information on the file structure, please see the README.txt in the zip file below.

-------------------------
References:

Data Description:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data Source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip