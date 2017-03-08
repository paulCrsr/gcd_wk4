## Install packages if required...
library("downloader")
library("dplyr")
library("tidyr")

#
# Define the paths used by the application.
#
dirs <- list(download = file.path("data","download"),
             raw      = file.path("data","raw"))
dirs$base  <- file.path(dirs$raw,"UCI HAR Dataset")
dirs$train <- file.path(dirs$base,"train")
dirs$test  <- file.path(dirs$base,"test")

# Function to capitalize words. (Copied from ?toupper documentation.)
capwords <- function(s, strict = FALSE) {
        cap <- function(s) paste(toupper(substring(s, 1, 1)),
                                 {s <- substring(s, 2); if(strict) tolower(s) else s},
                                 sep = "", collapse = " " )
        sapply(strsplit(s, split = " "), cap, USE.NAMES = !is.null(names(s)))
}

#################### Download and unzip the data (first run only) ####################

if (!file.exists(file.path(dirs$base, "README.txt"))) {
        dir.create(dirs$download, recursive = TRUE)
        downloadZipFile <- file.path(dirs$download, "datasets.zip")
        download("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                 dest=downloadZipFile,
                 mode="wb"
        )
        unzip(downloadZipFile, exdir=dirs$raw)
}

#################### Load and manipulate data ####################

# Shared lookup tables:

activity_labels <- read.table(file.path(dirs$base, "activity_labels.txt"))
names(activity_labels) <- c("activityid", "activity")
activity_labels <- mutate(activity_labels, activity=capwords(gsub("_", " ", tolower(activity))))

features <- read.table(file.path(dirs$base, "features.txt"))
names(features) <- c("featureid", "feature")

#
# Function to load and combine data.
#   param:  group "test" or "train"
#   return: combined data from subject, X and y txt files.
#
loadAndProcessGroup <- function(group) {

        message("Preparing data for: ", toupper(group))
        
        load <- function(name) {
                target <- file.path(dirs[[group]], paste0(name, "_", group ,".txt"))
                message("Loading data from: ", target, " ...")
                read.table(target, stringsAsFactors = FALSE)
        }
        
        subject <- tbl_df(load("subject"))
        names(subject) <- c("subject")
 
        activities <- load("y")
        names(activities) <- c("activityid")
        activities <- 
                merge(activities, activity_labels, by = "activityid") %>%                            # Merge text from shared lookup table
                select(activity)
                
        readings <- load("X")
        readings <- select(readings, grep(features$feature, pattern=".+(mean\\()|std\\().+"))        # Only include "mean" and "std" columns.
        names(readings) <- grep(features$feature, pattern=".+(mean\\()|std\\().+", value = TRUE)     # Only include "mean" and "std" column headers.
        names(readings) <- gsub("\\W", "", names(readings))                                          # Remove non-alphanumeric chars and convert to lower case.
        
        message("Combining...", class(subject))
        combined <- 
                mutate(group=capwords(group)) %>%
                bind_cols(subject, activities) %>%
                bind_cols(readings)

        message("... completed ", toupper(group), ".")
        combined
}

test <- loadAndProcessGroup("test")
train <- loadAndProcessGroup("train")

#################### Merge ####################

message("Binding 'test' and 'train' data...")
tidy <- bind_rows(test, train)

#################### Output ####################

message("Writing to ./data.csv ...")
write.csv(tidy, "tidy_data.csv")

message("Done!")
