# GCD
## GCD Assignment Week 4

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

### Review criteria 

1. The submitted data set is tidy.
2. The Github repo contains the required scripts.
3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4. The README that explains the analysis files is clear and understandable.
5. The work submitted for this project is the work of the student who submitted it.

### Getting and Cleaning Data Course Project 

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

### Data Source

Description:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Instruction
You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### How to run the run_analysis.R script
Please notes that the analysis files is ordered not strictly based on the instruction above, although the end product would be same

To replicate this result please see that you have plyr package active by loading it with library(plyr) or require(plyr), if you had't installed it yet do install.packages("plyr")

ensure that the data had been extracted and your working directory had been set on the immediate parent directory of the extracted folder before running R

copy the content of run_analysis.R and paste into your R console to run the analysis

### Workflow of the sript

PLEASE NOTE THAT THIS SCRIPT IS NOT STRUCTURE STRICTLY AS IN THE INSTRUCTION
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
* read labels/colnames of the data from features.txt
* filter which column names which represents mean/stdev as required in the instruction
* note that the condition for grep was strict (ex:mean() instead of wildcard seacrh)
* the argument was that since the instruction ask for mean and std, while other variable contains mean (that is not mean()) had no corresponding std stats
4. Appropriately labels the data set with descriptive variable names. 
* read activity labels
* change activity labels to descriptive
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
6. at the end of running the script you will get avgsplit, which is the mean and standard deviation of the variables found in the data folder in train and test data to further analyze the data you might want to look into each activity mean and standard deviation and variability between a person and another

