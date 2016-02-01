#Codebook

GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.

## Data Source

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

==================================================================
###Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

## Methodology
    *Merges the training and the test sets to create one data set.
    *Extracts only the measurements on the mean and standard deviation for each measurement.
    *Uses descriptive activity names to name the activities in the data set
    *Appropriately labels the data set with descriptive variable names.
    *From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Work Steps

1. Download the data and its accompanying description in

Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Desc: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

2. Extract the archived file data
3. Set your working folder in the parent folder of the extracted file folder
4. Read README.txt and features.txt to get some preliminary info on the data
5. There are a lots of datasets, but we will only use some of them

## Codes


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

> ftr.id
 [1] "tBodyAcc-mean()-Y"           "tBodyAcc-mean()-Z"          
 [3] "tBodyAcc-std()-X"            "tBodyAcc-std()-Y"           
 [5] "tBodyAcc-std()-Z"            "tGravityAcc-mean()-X"       
 [7] "tGravityAcc-mean()-Y"        "tGravityAcc-mean()-Z"       
 [9] "tGravityAcc-std()-X"         "tGravityAcc-std()-Y"        
[11] "tGravityAcc-std()-Z"         "tBodyAccJerk-mean()-X"      
[13] "tBodyAccJerk-mean()-Y"       "tBodyAccJerk-mean()-Z"      
[15] "tBodyAccJerk-std()-X"        "tBodyAccJerk-std()-Y"       
[17] "tBodyAccJerk-std()-Z"        "tBodyGyro-mean()-X"         
[19] "tBodyGyro-mean()-Y"          "tBodyGyro-mean()-Z"         
[21] "tBodyGyro-std()-X"           "tBodyGyro-std()-Y"          
[23] "tBodyGyro-std()-Z"           "tBodyGyroJerk-mean()-X"     
[25] "tBodyGyroJerk-mean()-Y"      "tBodyGyroJerk-mean()-Z"     
[27] "tBodyGyroJerk-std()-X"       "tBodyGyroJerk-std()-Y"      
[29] "tBodyGyroJerk-std()-Z"       "tBodyAccMag-mean()"         
[31] "tBodyAccMag-std()"           "tGravityAccMag-mean()"      
[33] "tGravityAccMag-std()"        "tBodyAccJerkMag-mean()"     
[35] "tBodyAccJerkMag-std()"       "tBodyGyroMag-mean()"        
[37] "tBodyGyroMag-std()"          "tBodyGyroJerkMag-mean()"    
[39] "tBodyGyroJerkMag-std()"      "fBodyAcc-mean()-X"          
[41] "fBodyAcc-mean()-Y"           "fBodyAcc-mean()-Z"          
[43] "fBodyAcc-std()-X"            "fBodyAcc-std()-Y"           
[45] "fBodyAcc-std()-Z"            "fBodyAccJerk-mean()-X"      
[47] "fBodyAccJerk-mean()-Y"       "fBodyAccJerk-mean()-Z"      
[49] "fBodyAccJerk-std()-X"        "fBodyAccJerk-std()-Y"       
[51] "fBodyAccJerk-std()-Z"        "fBodyGyro-mean()-X"         
[53] "fBodyGyro-mean()-Y"          "fBodyGyro-mean()-Z"         
[55] "fBodyGyro-std()-X"           "fBodyGyro-std()-Y"          
[57] "fBodyGyro-std()-Z"           "fBodyAccMag-mean()"         
[59] "fBodyAccMag-std()"           "fBodyBodyAccJerkMag-mean()" 
[61] "fBodyBodyAccJerkMag-std()"   "fBodyBodyGyroMag-mean()"    
[63] "fBodyBodyGyroMag-std()"      "fBodyBodyGyroJerkMag-mean()"
[65] "fBodyBodyGyroJerkMag-std()" 

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

> head(dataset)
  Subject Activity tBodyAcc-mean()-Y tBodyAcc-mean()-Z tBodyAcc-std()-X
1       1        5       -0.01641057        -0.1235202       -0.9982453
2       1        5       -0.01946716        -0.1134617       -0.9953796
3       1        5       -0.02620065        -0.1232826       -0.9960915
4       1        5       -0.01656965        -0.1153619       -0.9981386
5       1        5       -0.01009785        -0.1051373       -0.9973350
6       1        5       -0.01964078        -0.1100221       -0.9969210
  tBodyAcc-std()-Y tBodyAcc-std()-Z tGravityAcc-mean()-X tGravityAcc-mean()-Y
1       -0.9753002       -0.9603220            0.9665611           -0.1415513
2       -0.9671870       -0.9789440            0.9668781           -0.1420098
3       -0.9834027       -0.9906751            0.9676152           -0.1439765
4       -0.9808173       -0.9904816            0.9682244           -0.1487502
5       -0.9904868       -0.9954200            0.9679482           -0.1482100
6       -0.9671859       -0.9831178            0.9679295           -0.1442821
  tGravityAcc-mean()-Z tGravityAcc-std()-X tGravityAcc-std()-Y
1           0.10937881          -0.9974113          -0.9894474
2           0.10188392          -0.9995740          -0.9928658
3           0.09985014          -0.9966456          -0.9813928
4           0.09448590          -0.9984293          -0.9880982
5           0.09190972          -0.9989793          -0.9867539
6           0.09314463          -0.9993325          -0.9885747
  tGravityAcc-std()-Z tBodyAccJerk-mean()-X tBodyAccJerk-mean()-Y
1          -0.9316387            0.07400671           0.005771104
2          -0.9929172            0.07363596           0.003104037
3          -0.9784764            0.07732061           0.020057642
4          -0.9787449            0.07344436           0.019121574
5          -0.9973064            0.07793244           0.018684046
6          -0.9920159            0.08217077          -0.017014670
  tBodyAccJerk-mean()-Z tBodyAccJerk-std()-X tBodyAccJerk-std()-Y
1           0.029376633           -0.9955481           -0.9810636
2          -0.009045631           -0.9907428           -0.9809556
3          -0.009864772           -0.9926974           -0.9875527
4           0.016779979           -0.9964202           -0.9883587
5           0.009344434           -0.9948136           -0.9887145
6          -0.015798166           -0.9952056           -0.9848308
  tBodyAccJerk-std()-Z tBodyGyro-mean()-X tBodyGyro-mean()-Y tBodyGyro-mean()-Z
1           -0.9918457        -0.01611162        -0.08389378         0.10058429
2           -0.9896866        -0.03169829        -0.10233542         0.09612688
3           -0.9934976        -0.04340998        -0.09138618         0.08553770
4           -0.9924549        -0.03396042        -0.07470803         0.07739203
5           -0.9922663        -0.02877551        -0.07039311         0.07901214
6           -0.9884251        -0.02860025        -0.08304673         0.09546456
  tBodyGyro-std()-X tBodyGyro-std()-Y tBodyGyro-std()-Z tBodyGyroJerk-mean()-X
1        -0.9831200        -0.9890458        -0.9891212            -0.11050283
2        -0.9762921        -0.9935518        -0.9863787            -0.10848567
3        -0.9913848        -0.9924073        -0.9875542            -0.09116989
4        -0.9851836        -0.9923781        -0.9874019            -0.09077010
5        -0.9851808        -0.9921175        -0.9830768            -0.09424758
6        -0.9881772        -0.9892057        -0.9791538            -0.09708861
  tBodyGyroJerk-mean()-Y tBodyGyroJerk-mean()-Z tBodyGyroJerk-std()-X
1            -0.04481873            -0.05924282            -0.9898726
2            -0.04241031            -0.05582883            -0.9884618
3            -0.03633262            -0.06046466            -0.9911194
4            -0.03763253            -0.05828932            -0.9913545
5            -0.04335526            -0.04193600            -0.9916216
6            -0.04158928            -0.04470456            -0.9904185
  tBodyGyroJerk-std()-Y tBodyGyroJerk-std()-Z tBodyAccMag-mean()
1            -0.9972926            -0.9938510         -0.9792892
2            -0.9956321            -0.9915318         -0.9837031
3            -0.9966410            -0.9933289         -0.9865418
4            -0.9964730            -0.9945110         -0.9928271
5            -0.9960147            -0.9930906         -0.9942950
6            -0.9954146            -0.9904868         -0.9874657
  tBodyAccMag-std() tGravityAccMag-mean() tGravityAccMag-std()
1        -0.9760571            -0.9792892           -0.9760571
2        -0.9880196            -0.9837031           -0.9880196
3        -0.9864213            -0.9865418           -0.9864213
4        -0.9912754            -0.9928271           -0.9912754
5        -0.9952490            -0.9942950           -0.9952490
6        -0.9827460            -0.9874657           -0.9827460
  tBodyAccJerkMag-mean() tBodyAccJerkMag-std() tBodyGyroMag-mean()
1             -0.9912535            -0.9916944          -0.9806831
2             -0.9885313            -0.9903969          -0.9763171
3             -0.9930780            -0.9933808          -0.9820599
4             -0.9934800            -0.9958537          -0.9852037
5             -0.9930177            -0.9954243          -0.9858944
6             -0.9913143            -0.9894478          -0.9855007
  tBodyGyroMag-std() tBodyGyroJerkMag-mean() tBodyGyroJerkMag-std()
1         -0.9837542              -0.9951232             -0.9961016
2         -0.9860515              -0.9934032             -0.9950910
3         -0.9873511              -0.9955022             -0.9952666
4         -0.9890626              -0.9958076             -0.9952580
5         -0.9864403              -0.9952748             -0.9952050
6         -0.9846253              -0.9937188             -0.9952695
  fBodyAcc-mean()-X fBodyAcc-mean()-Y fBodyAcc-mean()-Z fBodyAcc-std()-X
1        -0.9974507        -0.9768517        -0.9735227       -0.9986803
2        -0.9935941        -0.9725115        -0.9833040       -0.9963128
3        -0.9954906        -0.9835697        -0.9910798       -0.9963121
4        -0.9972859        -0.9823010        -0.9883694       -0.9986065
5        -0.9966567        -0.9869395        -0.9927386       -0.9976438
6        -0.9958491        -0.9676116        -0.9841233       -0.9974612
  fBodyAcc-std()-Y fBodyAcc-std()-Z fBodyAccJerk-mean()-X fBodyAccJerk-mean()-Y
1       -0.9749298       -0.9554381            -0.9950322            -0.9813115
2       -0.9655059       -0.9770493            -0.9909937            -0.9816423
3       -0.9832444       -0.9902291            -0.9944466            -0.9887272
4       -0.9801295       -0.9919150            -0.9962920            -0.9887900
5       -0.9922637       -0.9970459            -0.9948507            -0.9882443
6       -0.9679258       -0.9828873            -0.9947551            -0.9832403
  fBodyAccJerk-mean()-Z fBodyAccJerk-std()-X fBodyAccJerk-std()-Y
1            -0.9897398           -0.9966523           -0.9820839
2            -0.9875663           -0.9912488           -0.9814148
3            -0.9913542           -0.9913783           -0.9869269
4            -0.9906244           -0.9969025           -0.9886067
5            -0.9901575           -0.9952180           -0.9901788
6            -0.9873372           -0.9962421           -0.9882634
  fBodyAccJerk-std()-Z fBodyGyro-mean()-X fBodyGyro-mean()-Y fBodyGyro-mean()-Z
1           -0.9926268         -0.9773867         -0.9925300         -0.9896058
2           -0.9904159         -0.9754332         -0.9937147         -0.9867557
3           -0.9943908         -0.9871096         -0.9936015         -0.9871913
4           -0.9929065         -0.9824465         -0.9929838         -0.9886664
5           -0.9930667         -0.9848902         -0.9927862         -0.9807784
6           -0.9879085         -0.9860273         -0.9904991         -0.9784560
  fBodyGyro-std()-X fBodyGyro-std()-Y fBodyGyro-std()-Z fBodyAccMag-mean()
1        -0.9849043        -0.9871681        -0.9897847         -0.9808566
2        -0.9766422        -0.9933990        -0.9873282         -0.9877948
3        -0.9928104        -0.9916460        -0.9886776         -0.9875187
4        -0.9859818        -0.9919558        -0.9879443         -0.9935909
5        -0.9852871        -0.9916595        -0.9853661         -0.9948360
6        -0.9887881        -0.9884058        -0.9811471         -0.9821347
  fBodyAccMag-std() fBodyBodyAccJerkMag-mean() fBodyBodyAccJerkMag-std()
1        -0.9758658                 -0.9903355                -0.9919603
2        -0.9890155                 -0.9892801                -0.9908667
3        -0.9867420                 -0.9927689                -0.9916998
4        -0.9900635                 -0.9955228                -0.9943890
5        -0.9952833                 -0.9947329                -0.9951562
6        -0.9847729                 -0.9878858                -0.9905461
  fBodyBodyGyroMag-mean() fBodyBodyGyroMag-std() fBodyBodyGyroJerkMag-mean()
1              -0.9882956             -0.9833219                  -0.9958539
2              -0.9892548             -0.9860277                  -0.9950305
3              -0.9894128             -0.9878358                  -0.9952207
4              -0.9914330             -0.9890594                  -0.9950928
5              -0.9905000             -0.9858609                  -0.9951433
6              -0.9882692             -0.9845685                  -0.9956415
  fBodyBodyGyroJerkMag-std()
1                 -0.9963995
2                 -0.9951274
3                 -0.9952369
4                 -0.9954648
5                 -0.9952387
6                 -0.9946391

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

> names(firstdata)
 [1] "Subject"                                       
 [2] "Activity"                                      
 [3] "timeBodyAccelerometer-mean()-Y"                
 [4] "timeBodyAccelerometer-mean()-Z"                
 [5] "timeBodyAccelerometer-std()-X"                 
 [6] "timeBodyAccelerometer-std()-Y"                 
 [7] "timeBodyAccelerometer-std()-Z"                 
 [8] "timeGravityAccelerometer-mean()-X"             
 [9] "timeGravityAccelerometer-mean()-Y"             
[10] "timeGravityAccelerometer-mean()-Z"             
[11] "timeGravityAccelerometer-std()-X"              
[12] "timeGravityAccelerometer-std()-Y"              
[13] "timeGravityAccelerometer-std()-Z"              
[14] "timeBodyAccelerometerJerk-mean()-X"            
[15] "timeBodyAccelerometerJerk-mean()-Y"            
[16] "timeBodyAccelerometerJerk-mean()-Z"            
[17] "timeBodyAccelerometerJerk-std()-X"             
[18] "timeBodyAccelerometerJerk-std()-Y"             
[19] "timeBodyAccelerometerJerk-std()-Z"             
[20] "timeBodyGyroscope-mean()-X"                    
[21] "timeBodyGyroscope-mean()-Y"                    
[22] "timeBodyGyroscope-mean()-Z"                    
[23] "timeBodyGyroscope-std()-X"                     
[24] "timeBodyGyroscope-std()-Y"                     
[25] "timeBodyGyroscope-std()-Z"                     
[26] "timeBodyGyroscopeJerk-mean()-X"                
[27] "timeBodyGyroscopeJerk-mean()-Y"                
[28] "timeBodyGyroscopeJerk-mean()-Z"                
[29] "timeBodyGyroscopeJerk-std()-X"                 
[30] "timeBodyGyroscopeJerk-std()-Y"                 
[31] "timeBodyGyroscopeJerk-std()-Z"                 
[32] "timeBodyAccelerometerMagnitude-mean()"         
[33] "timeBodyAccelerometerMagnitude-std()"          
[34] "timeGravityAccelerometerMagnitude-mean()"      
[35] "timeGravityAccelerometerMagnitude-std()"       
[36] "timeBodyAccelerometerJerkMagnitude-mean()"     
[37] "timeBodyAccelerometerJerkMagnitude-std()"      
[38] "timeBodyGyroscopeMagnitude-mean()"             
[39] "timeBodyGyroscopeMagnitude-std()"              
[40] "timeBodyGyroscopeJerkMagnitude-mean()"         
[41] "timeBodyGyroscopeJerkMagnitude-std()"          
[42] "frequencyBodyAccelerometer-mean()-X"           
[43] "frequencyBodyAccelerometer-mean()-Y"           
[44] "frequencyBodyAccelerometer-mean()-Z"           
[45] "frequencyBodyAccelerometer-std()-X"            
[46] "frequencyBodyAccelerometer-std()-Y"            
[47] "frequencyBodyAccelerometer-std()-Z"            
[48] "frequencyBodyAccelerometerJerk-mean()-X"       
[49] "frequencyBodyAccelerometerJerk-mean()-Y"       
[50] "frequencyBodyAccelerometerJerk-mean()-Z"       
[51] "frequencyBodyAccelerometerJerk-std()-X"        
[52] "frequencyBodyAccelerometerJerk-std()-Y"        
[53] "frequencyBodyAccelerometerJerk-std()-Z"        
[54] "frequencyBodyGyroscope-mean()-X"               
[55] "frequencyBodyGyroscope-mean()-Y"               
[56] "frequencyBodyGyroscope-mean()-Z"               
[57] "frequencyBodyGyroscope-std()-X"                
[58] "frequencyBodyGyroscope-std()-Y"                
[59] "frequencyBodyGyroscope-std()-Z"                
[60] "frequencyBodyAccelerometerMagnitude-mean()"    
[61] "frequencyBodyAccelerometerMagnitude-std()"     
[62] "frequencyBodyAccelerometerJerkMagnitude-mean()"
[63] "frequencyBodyAccelerometerJerkMagnitude-std()" 
[64] "frequencyBodyGyroscopeMagnitude-mean()"        
[65] "frequencyBodyGyroscopeMagnitude-std()"         
[66] "frequencyBodyGyroscopeJerkMagnitude-mean()"    
[67] "frequencyBodyGyroscopeJerkMagnitude-std()"   

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
require(plyr)
avgsplit<-ddply(firstdata,c("Subject","Activity"),numcolwise=(mean))
write.table(avgsplit,file="tidydata.txt")

> head(avgsplit)
  Subject Activity timeBodyAccelerometer-mean()-Y
1       1   LAYING                    -0.01507440
2       1   LAYING                    -0.02056096
3       1   LAYING                    -0.01786855
4       1   LAYING                    -0.01727572
5       1   LAYING                    -0.01681910
6       1   LAYING                    -0.01714630
  timeBodyAccelerometer-mean()-Z timeBodyAccelerometer-std()-X
1                    -0.11816739                    -0.9148112
2                    -0.09682457                    -0.9848826
3                    -0.10762126                    -0.9941946
4                    -0.10948053                    -0.9961353
5                    -0.10798311                    -0.9967754
6                    -0.10801374                    -0.9949281
  timeBodyAccelerometer-std()-Y timeBodyAccelerometer-std()-Z
1                    -0.8952311                    -0.8917481
2                    -0.9911184                    -0.9821118
3                    -0.9963717                    -0.9956151
4                    -0.9958116                    -0.9986892
5                    -0.9972564                    -0.9954216
6                    -0.9983591                    -0.9920114
  timeGravityAccelerometer-mean()-X timeGravityAccelerometer-mean()-Y
1                        -0.2550438                         0.7746587
2                        -0.2101478                         0.7739047
3                        -0.2087648                         0.7717121
4                        -0.2095641                         0.7710966
5                        -0.2087481                         0.7710371
6                        -0.2087170                         0.7712911
  timeGravityAccelerometer-mean()-Z timeGravityAccelerometer-std()-X
1                         0.5897765                       -0.7837423
2                         0.5851198                       -0.9603428
3                         0.5899473                       -0.9887928
4                         0.5901047                       -0.9959341
5                         0.5894140                       -0.9994640
6                         0.5893347                       -0.9996283
  timeGravityAccelerometer-std()-Y timeGravityAccelerometer-std()-Z
1                       -0.9889256                       -0.8953808
2                       -0.9889778                       -0.9653030
3                       -0.9975690                       -0.9960094
4                       -0.9984650                       -0.9987791
5                       -0.9986247                       -0.9967349
6                       -0.9992096                       -0.9971625
  timeBodyAccelerometerJerk-mean()-X timeBodyAccelerometerJerk-mean()-Y
1                         0.02344686                       0.0008133385
2                         0.06717800                       0.0156378930
3                         0.08249848                       0.0083569472
4                         0.07399550                       0.0137821200
5                         0.07712244                       0.0113804070
6                         0.07560895                       0.0123352010
  timeBodyAccelerometerJerk-mean()-Z timeBodyAccelerometerJerk-std()-X
1                       0.0528113250                        -0.9474534
2                      -0.0161861860                        -0.9928808
3                       0.0002341825                        -0.9948885
4                      -0.0073714967                        -0.9943904
5                       0.0034761282                        -0.9948394
6                       0.0013993239                        -0.9923668
  timeBodyAccelerometerJerk-std()-Y timeBodyAccelerometerJerk-std()-Z
1                        -0.8972260                        -0.9781684
2                        -0.9894338                        -0.9916484
3                        -0.9914021                        -0.9937718
4                        -0.9931776                        -0.9961810
5                        -0.9935192                        -0.9951597
6                        -0.9927182                        -0.9916361
  timeBodyGyroscope-mean()-X timeBodyGyroscope-mean()-Y
1                 0.03155195                -0.13199514
2                 0.00925711                -0.07879312
3                -0.01342439                -0.07537083
4                -0.02495981                -0.07613394
5                -0.02955039                -0.06808514
6                -0.03043115                -0.07348808
  timeBodyGyroscope-mean()-Z timeBodyGyroscope-std()-X
1                 0.54327885                -0.9551393
2                 0.25756479                -0.9811718
3                 0.10054482                -0.9901304
4                 0.04303757                -0.9961805
5                 0.04594675                -0.9991454
6                 0.05559069                -0.9991156
  timeBodyGyroscope-std()-Y timeBodyGyroscope-std()-Z
1                -0.9336056                -0.8118869
2                -0.9927193                -0.8922664
3                -0.9961534                -0.9470252
4                -0.9950712                -0.9890233
5                -0.9954884                -0.9942387
6                -0.9948875                -0.9944557
  timeBodyGyroscopeJerk-mean()-X timeBodyGyroscopeJerk-mean()-Y
1                    -0.11906637                    -0.04878607
2                    -0.11001902                    -0.03683308
3                    -0.10579546                    -0.04196709
4                    -0.10094779                    -0.04047405
5                    -0.09961923                    -0.04033080
6                    -0.09820626                    -0.04124388
  timeBodyGyroscopeJerk-mean()-Z timeBodyGyroscopeJerk-std()-X
1                    -0.15544951                    -0.9697419
2                    -0.12362339                    -0.9970592
3                    -0.09094212                    -0.9977386
4                    -0.06044516                    -0.9986279
5                    -0.04775066                    -0.9988554
6                    -0.04609417                    -0.9986589
  timeBodyGyroscopeJerk-std()-Y timeBodyGyroscopeJerk-std()-Z
1                    -0.9531439                    -0.9721019
2                    -0.9972440                    -0.9976071
3                    -0.9981612                    -0.9942198
4                    -0.9984311                    -0.9945972
5                    -0.9981309                    -0.9974129
6                    -0.9980935                    -0.9969627
  timeBodyAccelerometerMagnitude-mean() timeBodyAccelerometerMagnitude-std()
1                            -0.9051229                           -0.8316961
2                            -0.9874461                           -0.9784704
3                            -0.9979876                           -0.9960974
4                            -0.9995045                           -0.9987054
5                            -0.9990577                           -0.9982736
6                            -0.9974295                           -0.9958729
  timeGravityAccelerometerMagnitude-mean()
1                               -0.9051229
2                               -0.9874461
3                               -0.9979876
4                               -0.9995045
5                               -0.9990577
6                               -0.9974295
  timeGravityAccelerometerMagnitude-std()
1                              -0.8316961
2                              -0.9784704
3                              -0.9960974
4                              -0.9987054
5                              -0.9982736
6                              -0.9958729
  timeBodyAccelerometerJerkMagnitude-mean()
1                                -0.9603565
2                                -0.9927420
3                                -0.9951306
4                                -0.9966514
5                                -0.9962646
6                                -0.9935103
  timeBodyAccelerometerJerkMagnitude-std() timeBodyGyroscopeMagnitude-mean()
1                               -0.9022409                        -0.7775618
2                               -0.9932015                        -0.9152190
3                               -0.9946894                        -0.9734010
4                               -0.9956492                        -0.9820991
5                               -0.9958706                        -0.9844125
6                               -0.9931882                        -0.9881455
  timeBodyGyroscopeMagnitude-std() timeBodyGyroscopeJerkMagnitude-mean()
1                       -0.8116484                            -0.9732644
2                       -0.8986040                            -0.9975084
3                       -0.9729105                            -0.9977556
4                       -0.9930515                            -0.9983250
5                       -0.9944482                            -0.9989408
6                       -0.9962197                            -0.9987064
  timeBodyGyroscopeJerkMagnitude-std() frequencyBodyAccelerometer-mean()-X
1                           -0.9403461                          -0.9263140
2                           -0.9986554                          -0.9868744
3                           -0.9984269                          -0.9936148
4                           -0.9986951                          -0.9957499
5                           -0.9991240                          -0.9965112
6                           -0.9991912                          -0.9947016
  frequencyBodyAccelerometer-mean()-Y frequencyBodyAccelerometer-mean()-Z
1                          -0.8869485                          -0.9287921
2                          -0.9890077                          -0.9833792
3                          -0.9942589                          -0.9951969
4                          -0.9934525                          -0.9972675
5                          -0.9950610                          -0.9947361
6                          -0.9956667                          -0.9915643
  frequencyBodyAccelerometer-std()-X frequencyBodyAccelerometer-std()-Y
1                         -0.9103749                         -0.9056274
2                         -0.9838941                         -0.9918461
3                         -0.9943630                         -0.9968263
4                         -0.9962350                         -0.9964720
5                         -0.9968216                         -0.9977321
6                         -0.9949227                         -0.9991905
  frequencyBodyAccelerometer-std()-Z frequencyBodyAccelerometerJerk-mean()-X
1                         -0.8810446                              -0.9491758
2                         -0.9817975                              -0.9928884
3                         -0.9953648                              -0.9944850
4                         -0.9990237                              -0.9947379
5                         -0.9953860                              -0.9953079
6                         -0.9920588                              -0.9930335
  frequencyBodyAccelerometerJerk-mean()-Y
1                              -0.8980041
2                              -0.9901112
3                              -0.9920715
4                              -0.9931140
5                              -0.9940554
6                              -0.9926230
  frequencyBodyAccelerometerJerk-mean()-Z
1                              -0.9729599
2                              -0.9907912
3                              -0.9921734
4                              -0.9944597
5                              -0.9937920
6                              -0.9907660
  frequencyBodyAccelerometerJerk-std()-X frequencyBodyAccelerometerJerk-std()-Y
1                             -0.9502229                             -0.9036754
2                             -0.9934960                             -0.9892862
3                             -0.9958856                             -0.9911211
4                             -0.9944429                             -0.9937461
5                             -0.9947047                             -0.9932537
6                             -0.9922280                             -0.9933625
  frequencyBodyAccelerometerJerk-std()-Z frequencyBodyGyroscope-mean()-X
1                             -0.9824606                      -0.9521760
2                             -0.9909196                      -0.9815916
3                             -0.9939737                      -0.9887787
4                             -0.9966357                      -0.9962521
5                             -0.9951122                      -0.9985080
6                             -0.9909207                      -0.9985199
  frequencyBodyGyroscope-mean()-Y frequencyBodyGyroscope-mean()-Z
1                      -0.9331338                      -0.8355401
2                      -0.9939633                      -0.8983206
3                      -0.9968874                      -0.9503627
4                      -0.9972731                      -0.9901535
5                      -0.9968899                      -0.9940334
6                      -0.9964727                      -0.9924212
  frequencyBodyGyroscope-std()-X frequencyBodyGyroscope-std()-Y
1                     -0.9562644                     -0.9342784
2                     -0.9811450                     -0.9919288
3                     -0.9904897                     -0.9956296
4                     -0.9960867                     -0.9938215
5                     -0.9993898                     -0.9946098
6                     -0.9993353                     -0.9939175
  frequencyBodyGyroscope-std()-Z frequencyBodyAccelerometerMagnitude-mean()
1                     -0.8216842                                 -0.8751096
2                     -0.8999714                                 -0.9821810
3                     -0.9505844                                 -0.9950606
4                     -0.9894638                                 -0.9983908
5                     -0.9947283                                 -0.9977332
6                     -0.9958203                                 -0.9948534
  frequencyBodyAccelerometerMagnitude-std()
1                                -0.8361963
2                                -0.9784844
3                                -0.9967772
4                                -0.9984494
5                                -0.9982830
6                                -0.9965089
  frequencyBodyAccelerometerJerkMagnitude-mean()
1                                     -0.9102897
2                                     -0.9925130
3                                     -0.9945059
4                                     -0.9962083
5                                     -0.9969963
6                                     -0.9929767
  frequencyBodyAccelerometerJerkMagnitude-std()
1                                    -0.8914699
2                                    -0.9929612
3                                    -0.9935549
4                                    -0.9933149
5                                    -0.9926728
6                                    -0.9920904
  frequencyBodyGyroscopeMagnitude-mean() frequencyBodyGyroscopeMagnitude-std()
1                             -0.8759977                            -0.8062476
2                             -0.9324914                            -0.8957467
3                             -0.9846662                            -0.9705476
4                             -0.9960271                            -0.9920600
5                             -0.9963313                            -0.9938579
6                             -0.9969887                            -0.9960884
  frequencyBodyGyroscopeJerkMagnitude-mean()
1                                 -0.9524838
2                                 -0.9985372
3                                 -0.9983322
4                                 -0.9985448
5                                 -0.9988506
6                                 -0.9991169
  frequencyBodyGyroscopeJerkMagnitude-std()
1                                -0.9305440
2                                -0.9985563
3                                -0.9983418
4                                -0.9986934
5                                -0.9993605
6                                -0.9989476


