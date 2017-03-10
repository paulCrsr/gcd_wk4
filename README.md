# README

## Description

This project uses R to download, filter and tidy the [
Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) contained in the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/index.html).

### Contents

| Name | Description |
| ---- | --- |
| [run_analysis.R](./run_analysis.R) | Script to download and process raw data. |
| [tidy_data.csv](./tidy_data.csv) | Comma-separated output of run_analysis.R. (~6.9MB) |
| [CodeBook.md](./CodeBook.md) | CodeBook for tidy_data.csv |

## Running the script

From R or RStudio execute:

```
source("run_analysis.R")
```

This script:

1. Installs R packages: 
	- downloader
	- dplyr 
	- tidyr
2. Downloads raw data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to `./data/download`.
2. Unzips downloaded data to `./data/raw/`.
3. Loads and tidys raw data:
	- Merges *test* data for *mean* and *standard deviation* features.
	- Merges *training* data for *mean* and *standard deviation* features.
	- Appends the *test* and *training* data.
4. Writes the tidied data to 
 	- [tidy.csv]("./tidy.csv")
 	- [tidy.txt]("./tidy.txt")
