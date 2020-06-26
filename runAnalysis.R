install.packages("downloader")
library(downloader)

#if(!)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download(url, dest="dataset.zip", mode="wb")
unzip("dataset.zip")

xTest <- read.delim("C:/Users/JackRhys/Desktop/datasciencecoursera/DataCleaning_Assignment/X_test")
xTest <- read.delim("X_test")