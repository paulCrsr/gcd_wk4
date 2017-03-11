# Code Book

This code book describes the data derived from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip using [run_analysis.R](./run_analysis.R) and held in:

 * [merged.csv](#mergedcsv) (and .txt)
 * [averages.csv](#averagescsv) (and .txt)

This complements the information available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

### Raw Data Description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## merged.csv

Produced by merging raw *Test* and *Training* data into a single dataset. Dimensions: rows=10,299, columns: 60

### Key columns 

 - `subject`: ID of volunteer. Values: `1-30`.
 - `group`: Partition volunteer was randomized to.  Values: `Test`, `Train`.
 - `activity`: Activity performed by the volunteer. Values: `Laying`, `Sitting`, `Standing`, `Walking`, `Walking Downstairs`, `Walking Upstairs`.

### Feature Columns	
The 57 remaining feature columns are a subset of the features contained in the raw data containing only `mean` and `standard deviation` data. Each value is normalized and bounded within [-1,1].

 - tBodyAccmeanX
 - tBodyAccmeanY
 - tBodyAccmeanZ
 - tBodyAccstdX
 - tBodyAccstdY
 - tBodyAccstdZ
 - tGravityAccmeanX
 - tGravityAccmeanY
 - tGravityAccmeanZ
 - tGravityAccstdX
 - tGravityAccstdY
 - tGravityAccstdZ
 - tBodyAccJerkmeanX
 - tBodyAccJerkmeanY
 - tBodyAccJerkmeanZ
 - tBodyAccJerkstdX
 - tBodyAccJerkstdY
 - tBodyAccJerkstdZ
 - tBodyGyromeanX
 - tBodyGyromeanY
 - tBodyGyromeanZ
 - tBodyGyrostdX
 - tBodyGyrostdY
 - tBodyGyrostdZ
 - tBodyGyroJerkmeanX
 - tBodyGyroJerkmeanY
 - tBodyGyroJerkmeanZ
 - tBodyGyroJerkstdX
 - tBodyGyroJerkstdY
 - tBodyGyroJerkstdZ
 - tBodyAccMagmean
 - tGravityAccMagmean
 - tBodyAccJerkMagmean
 - tBodyGyroMagmean
 - tBodyGyroJerkMagmean
 - fBodyAccmeanX
 - fBodyAccmeanY
 - fBodyAccmeanZ
 - fBodyAccstdX
 - fBodyAccstdY
 - fBodyAccstdZ
 - fBodyAccJerkmeanX
 - fBodyAccJerkmeanY
 - fBodyAccJerkmeanZ
 - fBodyAccJerkstdX
 - fBodyAccJerkstdY
 - fBodyAccJerkstdZ
 - fBodyGyromeanX
 - fBodyGyromeanY
 - fBodyGyromeanZ
 - fBodyGyrostdX
 - fBodyGyrostdY
 - fBodyGyrostdZ
 - fBodyAccMagmean
 - fBodyBodyAccJerkMagmean
 - fBodyBodyGyroMagmean
 - fBodyBodyGyroJerkMagmean

## averages.csv

Produced by grouping and summarising `merged.csv`. Dimensions: rows=2,280, columns: 4.

Each row contains the average measurement value (normalised to the range [-1, 1]) for a subject and activity.

### Columns

 - `subject`: ID of volunteer. Values: `1-30`.
 - `activity`: Activity performed by the volunteer. Values: `Laying`, `Sitting`, `Standing`, `Walking`, `Walking Downstairs`, `Walking Upstairs`.
 - `measurement`: The name of the measurement.
 - `average`: The average (mean) of the measurement for the subject and activity.
