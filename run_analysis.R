#Establish the location of the current working directory
wd <- getwd()

#Establish the location of the data in the UCI HAR Dataset
#You may need to edit this depending on your individual circumstances
#The root folder is the location of the 'features' metadata
root <- "/DataScience/data/UCI HAR Dataset/UCI HAR Dataset/"
# The output folder 
output <- "/Datascience/data/"
#The traindata folder is the location of the the training data set
traindata <- "/DataScience/data/UCI HAR Dataset/UCI HAR Dataset/train/"

#The tesdata folder is the location of the test data set
testdata <- "/DataScience/data/UCI HAR Dataset/UCI HAR Dataset/test/"

# Load the features data
features <- read.table(paste(wd,root,"features.txt", sep=""))
#features are the names describing the numeric data in the data set
#features[,1] contains feature numbers
#features[,2] contains the names of the all 561 features
activity_labels <- read.table(paste(wd,root,"activity_labels.txt", sep=""))


# subject_train and subject_test contain the ID number of the subject performing
# that test with each row corresponding to a row in the X_test and X_train data 
# sets.

# y_test and y_train identify which of the activities was being performed by the
# subject in each row of the X data

# Load in X_train
X_train <- read.table(paste(wd,traindata,"X_train.txt", sep=""))
# Load in y_train
y_train <- read.table(paste(wd,traindata,"y_train.txt", sep=""))
# Load in subject_train
subject_train <- read.table(paste(wd,traindata,"subject_train.txt", sep=""))

# Put all data into one training data frame
train <- data.frame(c(y_train, subject_train, X_train))

# Name the column headers -- note that the as.character was needed on the 
# feature names otherwise this returns numbers

names(train) <- c("activity", "subject",as.character(features[,2]))

# train is now a full data frame of the training data.
# Now we repeat this for the test data

X_test <- read.table(paste(wd,testdata,"X_test.txt", sep=""))
y_test <- read.table(paste(wd,testdata,"y_test.txt", sep=""))
subject_test <- read.table(paste(wd,testdata,"subject_test.txt", sep=""))
test <- data.frame(c(y_test, subject_test, X_test))
names(test) <- c("activity", "subject",as.character(features[,2]))

# Now we merge the two data frames in to one

alldata <- rbind(train, test)

# Use the GREPL function to return a logical vector of names matching the
# strings "mean()" and "std()".  Set parameter fixed=TRUE or you will get some
# mean frequency matches which I don't think are being asked for by the
# assignement.  I tried using and OR for the search criterai in GREPL but R
# was not happy.  But if we remember that TRUES and FALSES are 1s and 0s then
# we can simply run the condition separately and and them together.  The
# second part is to remember that the first two columns are "activity" and 
# "subject" and need to be included as well
meancol <- grepl("mean()", names(alldata), fixed=TRUE)
stdcol  <- grepl("std()", names(alldata), fixed=TRUE)
selectedcol <- meancol + stdcol
selectedcol[1:2] <- TRUE

# selecting the subset of data is done as follows.  as.logical was required to
# ensure that the 1 and 0 values are turned back to TRUE and FALSE after the
# vector addition done in the previous step.

selectdata <- alldata[as.logical(selectedcol)]

# Convert the integer numeric activity codes to readable lables
# First step is to convert the integers in the activity column to cahracters
# which is need to use the sub() function.
selectdata[,1] <- as.character(selectdata[,1])

# Next is to loop through the activity labels to replace each integer with a 
# character name
for (i in 1:length(activity_labels[,2])) {
selectdata[,1] <- sub(as.character(i), activity_labels[i,2], selectdata[,1])
}
# Open the data.table library so we can create a tidy subset of the selectdata
library (data.table)
# Store the original names of the columns for safe keeping. This wash because
# I had difficulty using these names later in the process
originalcolnames <- names(selectdata)

# Using data.tables was challenging working with multiple columns with the names
# specified as they were.  So here we revert back to renaming all the data
# columns to generic V3 - V68, but keeping activity and subjet for the first 2.
DTnames <- c("activity", "subject")
for (i in 3:(length(colnames) + 2)) {
        DTnames[i] <- paste("V",i,sep="")
}
names(selectdata) <- DTnames

# The data table is created from selectdata data frame.
DT <-data.table(selectdata)

# The following command takes the mean of all the data columns and groups by
# activity and subject.  Each line corresponds to a different column, but you
# are allowed to adjust the resultant aggregation name.  This is kind of like
# using the SQL AS statement in SQL to rename the aggregated variables with an
# alias.  The final line is same as GROUP BY in SQL.  Though SQL seems much 
# easier.
summarydata <- DT[,    .(tBodyAcc_Xmean =mean(V3)
        , tBodyAcc_Ymean =mean(V4)
        , tBodyAcc_Zmean =mean(V5)
        , tBodyAcc_Xstdmean =mean(V6)
        , tBodyAcc_Ystdmean =mean(V7)
        , tBodyAcc_Zstdmean =mean(V8)
        , tGravityAcc_Xmean =mean(V9)
        , tGravityAcc_Ymean =mean(V10)
        , tGravityAcc_Zmean =mean(V11)
        , tGravityAcc_Xstdmean =mean(V12)
        , tGravityAcc_Ystdmean =mean(V13)
        , tGravityAcc_Zstdmean =mean(V14)
        , tBodyAccJerk_Xmean =mean(V15)
        , tBodyAccJerk_Ymean =mean(V16)
        , tBodyAccJerk_Zmean =mean(V17)
        , tBodyAccJerk_Xstdmean =mean(V18)
        , tBodyAccJerk_Ystdmean =mean(V19)
        , tBodyAccJerk_Zstdmean =mean(V20)
        , tBodyGyro_Xmean =mean(V21)
        , tBodyGyro_Ymean =mean(V22)
        , tBodyGyro_Zmean =mean(V23)
        , tBodyGyro_Xstdmean =mean(V24)
        , tBodyGyro_Ystdmean =mean(V25)
        , tBodyGyro_Zstdmean =mean(V26)
        , tBodyGyroJerk_Xmean =mean(V27)
        , tBodyGyroJerk_Ymean =mean(V28)
        , tBodyGyroJerk_Zmean =mean(V29)
        , tBodyGyroJerk_Xstdmean =mean(V30)
        , tBodyGyroJerk_Ystdmean =mean(V31)
        , tBodyGyroJerk_Zstdmean =mean(V32)
        , tBodyAccMag_mean =mean(V33)
        , tBodyAccMag_stdmean =mean(V34)
        , tGravityAccMag_mean =mean(V35)
        , tGravityAccMag_stdmean =mean(V36)
        , tBodyAccJerkMag_mean =mean(V37)
        , tBodyAccJerkMag_stdmean =mean(V38)
        , tBodyGyroMag_mean =mean(V39)
        , tBodyGyroMag_stdmean =mean(V40)
        , tBodyGyroJerkMag_mean =mean(V41)
        , tBodyGyroJerkMag_stdmean =mean(V42)
        , fBodyAcc_Xmean =mean(V43)
        , fBodyAcc_Ymean =mean(V44)
        , fBodyAcc_Zmean =mean(V45)
        , fBodyAcc_Xstdmean =mean(V46)
        , fBodyAcc_Ystdmean =mean(V47)
        , fBodyAcc_Zstdmean =mean(V48)
        , fBodyAccJerk_Xmean =mean(V49)
        , fBodyAccJerk_Ymean =mean(V50)
        , fBodyAccJerk_Zmean =mean(V51)
        , fBodyAccJerk_Xstdmean = mean(V52)
        , fBodyAccJerk_Ystdmean = mean(V53)
        , fBodyAccJerk_Zstdmean = mean(V54)
        , fBodyGyro_Xmean = mean(V55)
        , fBodyGyro_Ymean = mean(V56)
        , fBodyGyro_Zmean = mean(V57)
        , fBodyGyro_Xstdmean = mean(V58)
        , fBodyGyro_Ystdmean = mean(V59)
        , fBodyGyro_Zstdmean = mean(V60)
        , fBodyAccMag_mean =mean(V61)
        , fBodyAccMag_stdmean =mean(V62)
        , fBodyBodyAccJerkMag_mean =mean(V63)
        , fBodyBodyAccJerkMag_stdmean =mean(V64)
        , fBodyBodyGyroMag_mean =mean(V65)
        , fBodyBodyGyroMag_stdmean =mean(V66)
        , fBodyBodyGyroJerkMag_mean =mean(V67)
        , fBodyBodyGyroJerkMag_stdmean =mean(V68)
        ),
        by=.(activity,subject) ]

#  Table is written to the output folder specified earlier.
write.table(summarydata, file = paste(wd, output,"UCI_Mean_Summary.txt", sep=""), row.names = FALSE )
