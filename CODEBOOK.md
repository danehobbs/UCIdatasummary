# Codebook.md
## Output descriptions for the file UCI_Mean_Summary.txt
### Columns
- activity - choices are (WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
- subject - unique id number for the participant in the study
For each activity and subject combination the remaining columns are the computed means for every trial
Since the assigment requested that we keep mean() and std() quantities only, many from the originaldata set were exlcuded.
Items beginning with a 't' are time domain values.  Items beginning with 'f' are frequency domain values
Items ending with "stdmean" are the mean of the indvidual standard devations from each trial.
Items endins with only "mean" are the mean of the means of each trial.
The rest of the name from the original data set and the definitions contained here-in are identical.
- tBodyAcc_Xmean
- tBodyAcc_Ymean 
- tBodyAcc_Zmean
- tBodyAcc_Xstdmean
- tBodyAcc_Ystdmean
- tBodyAcc_Zstdmean
- tGravityAcc_Xmean
- tGravityAcc_Ymean 
- tGravityAcc_Zmean
- tGravityAcc_Xstdmean
- tGravityAcc_Ystdmean
- tGravityAcc_Zstdmean
- tBodyAccJerk_Xmean
- tBodyAccJerk_Ymean
- tBodyAccJerk_Zmean
- tBodyAccJerk_Xstdmean
- tBodyAccJerk_Ystdmean
- tBodyAccJerk_Zstdmean
- tBodyGyro_Xmean
- tBodyGyro_Ymean
- tBodyGyro_Zmean
- tBodyGyro_Xstdmean
- tBodyGyro_Ystdmean
- tBodyGyro_Zstdmean
- tBodyGyroJerk_Xmean 
- tBodyGyroJerk_Ymean
- tBodyGyroJerk_Zmean
- tBodyGyroJerk_Xstdmean
- tBodyGyroJerk_Ystdmean
- tBodyGyroJerk_Zstdmean
- tBodyAccMag_mean
- tBodyAccMag_stdmean 
- tGravityAccMag_mean
- tGravityAccMag_stdmean
- tBodyAccJerkMag_mean
- tBodyAccJerkMag_stdmean
- tBodyGyroMag_mean
- tBodyGyroMag_stdmean
- tBodyGyroJerkMag_mean
- tBodyGyroJerkMag_stdmean
- fBodyAcc_Xmean
- fBodyAcc_Ymean
- fBodyAcc_Zmean
- fBodyAcc_Xstdmean
- fBodyAcc_Ystdmean
- fBodyAcc_Zstdmean
- fBodyAccJerk_Xmean
- fBodyAccJerk_Ymean 
- fBodyAccJerk_Zmean 
- fBodyAccJerk_Xstdmean
- fBodyAccJerk_Ystdmean
- fBodyAccJerk_Zstdmean
- fBodyGyro_Xmean
- fBodyGyro_Ymean
- fBodyGyro_Zmean
- fBodyGyro_Xstdmean
- fBodyGyro_Ystdmean
- fBodyGyro_Zstdmean
- fBodyAccMag_mean
- fBodyAccMag_stdmean
- fBodyBodyAccJerkMag_mean
- fBodyBodyAccJerkMag_stdmean
- fBodyBodyGyroMag_mean
- fBodyBodyGyroMag_stdmean
- fBodyBodyGyroJerkMag_mean
- fBodyBodyGyroJerkMag_stdmean
