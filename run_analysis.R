## Install packages if required...
library("downloader")
library("dplyr")
library("tidyr")

dirs <- list(download = file.path("data","download"),
             raw      = file.path("data","raw")
             )

## Fetch and unzip the data (first run only).
if (!file.exists(file.path(dirs$raw, "UCI HAR Dataset", "README.txt"))) {
        dir.create(dirs$download, recursive = TRUE)
        downloadZipFile <- file.path(dirs$download, "datasets.zip")
        download("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                 dest=downloadZipFile,
                 mode="wb"
        )
        unzip(downloadZipFile, exdir=dirs$raw)
}
