runAnalysis <- function(){

# Here are the packages you'll need for this script
##############
install.packages("downloader")
library(downloader)
install.packages("dplyr")
library(dplyr)
##############

# First we download the data.
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download(url, dest="dataset.zip", mode="wb")
unzip("dataset.zip")

# We load in 
yTest <- read.delim("UCI HAR Dataset//test//y_test.txt", sep=" ", header = FALSE)
sTest <- read.delim("UCI HAR Dataset//test//subject_test.txt", sep=" ", header = FALSE)
yTrain <- read.delim("UCI HAR Dataset//train//y_train.txt", sep=" ", header = FALSE)
sTrain <- read.delim("UCI HAR Dataset//train//subject_train.txt", sep=" ", header = FALSE)
labels <- read.delim("UCI HAR Dataset//activity_labels.txt", sep=" ", header = FALSE)
features <- read.delim("UCI HAR Dataset//features.txt", sep=" ", header = FALSE)

## This long vector will be used later in the process.

Names <- c("Subject Number", "Activity Type",
           "Time Domain - Mean Body Accelerometer Signal – X Direction",
           "Time Domain - Mean Body Accelerometer Signal – Y Direction",
           "Time Domain - Mean Body Accelerometer Signal – Z Direction ",
           "Time Domain - Std. Dev. of Body Accelerometer Signal – X Direction",
           "Time Domain - Std. Dev. of Body Accelerometer Signal – Y Direction",
           "Time Domain - Std. Dev. of Body Accelerometer Signal – Z Direction",
           "Time Domain - Mean Accelerometer Signal due to Gravity – X Direction",
           "Time Domain - Mean Accelerometer Signal due to Gravity – Y Direction",
           "Time Domain - Mean Accelerometer Signal due to Gravity – Z Direction", 
           "Time Domain - Std. Dev. of Accelerometer Signal due to Gravity – X Direction",
           "Time Domain - Std. Dev. of Accelerometer Signal due to Gravity – Y Direction",
           "Time Domain - Std. Dev. of Accelerometer Signal due to Gravity – Z Direction",
           "Time Domain - Mean Body Linear Accel. Jerk – X Direction",
           "Time Domain - Mean Body Linear Accel. Jerk – Y Direction",
           "Time Domain - Mean Body Linear Accel.  Jerk – Z Direction",
           "Time Domain - Std. Dev. of Body Linear Accel.  Jerk – X Direction",
           "Time Domain - Std. Dev. of Body Linear Accel.  Jerk – Y Direction",
           "Time Domain - Std. Dev. of Body Linear Accel.  Jerk – Z Direction",
           "Time Domain - Mean Body Gyroscope Signal – X Direction",
           "Time Domain - Mean Body Gyroscope Signal – Y Direction",
           "Time Domain - Mean Body Gyroscope Signal – Z Direction",
           "Time Domain - Std. Dev. of Body Gyroscope Signal – X Direction",
           "Time Domain - Std. Dev. of Body Gyroscope Signal – Y Direction",
           "Time Domain - Std. Dev. of Body Gyroscope Signal – Z Direction",
           "Time Domain - Mean Angular Velocity Jerk – X Direction",
           "Time Domain - Mean Angular Velocity Jerk – Y Direction",
           "Time Domain - Mean Angular Velocity Jerk – Z Direction",
           "Time Domain - Std. Dev. of Angular Velocity Jerk – X Direction",
           "Time Domain - Std. Dev. of Angular Velocity Jerk – Y Direction",
           "Time Domain - Std. Dev. of Angular Velocity Jerk – Z Direction",
           "Time Domain - Mean of Body Accelerometer Signal Magnitude",
           "Time Domain - Std. Dev. of Accelerometer Signal Magnitude",
           "Time Domain - Mean of Accelerometer Signal Magnitude due to Gravity",
           "Time Domain - Std. Dev. of Accelerometer Signal Magnitude due to Gravity",
           "Time Domain - Mean of Body Linear Accel. Jerk Magnitude",
           "Time Domain - Std. Dev. of Magnitude of Body Linear Accel. Jerk",
           "Time Domain - Mean of Body Gyroscope Signal Magnitude",
           "Time Domain - Std. Dev. of Body Gyroscope Signal Magnitude",
           "Time Domain - Mean of Body Angular Velocity Jerk Magnitude",
           "Time Domain - Std. Dev. of Body Angular Velocity Jerk Magnitude",
           "Freq. Domain - Mean Body Accelerometer Signal – X Direction",
           "Freq. Domain - Mean Body Accelerometer Signal – Y Direction",
           "Freq. Domain - Mean Body Accelerometer Signal – Z Direction",
           "Freq. Domain - Std. Dev. of Body Accelerometer Signal – X Direction",
           "Freq. Domain - Std. Dev. of Body Accelerometer Signal – Y Direction",
           "Freq. Domain - Std. Dev. of Body Accelerometer Signal – Z Direction",
           "Freq. Domain - (Weighted) Average of the Body Accelerometer Signal Frequency – X Direction",
           "Freq. Domain - (Weighted) Average of the Body Accelerometer Signal Frequency – Y Direction",
           "Freq. Domain - (Weighted) Average of the Body Accelerometer Signal Frequency – Z Direction ",
           "Freq. Domain - Mean Body Linear Accel. Jerk – X Direction",
           "Freq. Domain - Mean Body Linear Accel. Jerk – Y Direction",
           "Freq. Domain - Mean Body Linear Accel.  Jerk – Z Direction",
           "Freq. Domain - Std. Dev. of Body Linear Accel.  Jerk – X Direction",
           "Freq. Domain - Std. Dev. of Body Linear Accel.  Jerk – Y Direction",
           "Freq. Domain - Std. Dev. of Body Linear Accel.  Jerk – Z Direction",
           "Freq. Domain - (Weighted) Average of the Linear Accel. Jerk Frequency – X Direction",
           "Freq. Domain - (Weighted) Average of the Linear Accel. Jerk Frequency – Y Direction",
           "Freq. Domain - (Weighted) Average of the Linear Accel. Jerk Frequency – Z Direction",
           "Freq. Domain - Mean Body Gyroscope Signal – X Direction",
           "Freq. Domain - Mean Body Gyroscope Signal – Y Direction",
           "Freq. Domain - Mean Body Gyroscope Signal – Z Direction", 
           "Freq. Domain - Std. Dev. of Body Gyroscope Signal – X Direction",
           "Freq. Domain - Std. Dev. of Body Gyroscope Signal – Y Direction",
           "Freq. Domain - Std. Dev. of Body Gyroscope Signal – Z Direction",
           "Freq. Domain - (Weighted) Average of the Body Gyroscope Signal Frequency – X Direction",
           "Freq. Domain - (Weighted) Average of the Body Gyroscope Signal Frequency – Y Direction",
           "Freq. Domain - (Weighted) Average of the Body Gyroscope Signal Frequency – Z Direction", 
           "Freq. Domain - Mean of Body Accelerometer Signal Magnitude",
           "Freq. Domain - Std. Dev. of Accelerometer Signal Magnitude",
           "Freq. Domain - (Weighted) Average of the Accelerometer Signal Magnitude Frequency",
           "Freq. Domain - Mean of Body Linear Accel. Jerk Magnitude",
           "Freq. Domain - Std. Dev. of Body Linear Accel. Jerk Magnitude",
           "Freq. Domain - (Weighted) Average of the Body Linear Accel. Jerk Magnitude Frequency",
           "Freq. Domain - Mean of Body Gyroscope Signal Magnitude",
           "Freq. Domain - Std. Dev. of Body Gyroscope Signal Magnitude",
           "Freq. Domain - (Weighted) Average of the Body Gyroscope Signal Magnitude Frequency",
           "Freq. Domain - Mean of Body Angular Velocity Jerk Magnitude",
           "Freq. Domain - Std. Dev. of Magnitude of Body Angular Velocity Jerk",
           "Freq. Domain - (Weighted) Average of the Body Angular Velocity Jerk Magnitude Frequency")

# The X_test and X_train files need some cleaning up before they can be read in.
# We use readLines and gsub (with a regular expression) to make the spacing 
# consistent. For each data set, we name the variables using features.txt

file1 <- readLines("UCI HAR Dataset//test//X_test.txt")
file2 <- gsub("( )+"," ", file1)
tc <- textConnection(file2)
xTest2 <- read.delim(tc, sep=" ", header = FALSE)
xTest2 <- xTest2[2:562]
names(xTest2) <- features$V2
close(tc)

file3 <- readLines("UCI HAR Dataset//train//X_train.txt")
file4 <- gsub("( )+"," ", file3)
tc2 <- textConnection(file4)
xTrain2 <- read.delim(tc2, sep=" ", header = FALSE)
xTrain2 <- xTrain2[2:562]
names(xTrain2) <- features$V2
close(tc2)

# We add the activity and subject labels before merging the training and
# test data sets together
names(yTest) <- "Activity Type"
names(yTrain) <- "Activity Type"
Data1 <- cbind(sTrain, yTrain, xTrain2)
Data2 <- cbind(sTest, yTest, xTest2)
Data3 <- rbind(Data1, Data2)

# Now all of our data has been put together nicely. Next we select the
# columns of the data set that relate to mean and standard deviation.

P <- grep("mean", features$V2)
Q <- grep("std", features$V2)
L <- sort(c(P, Q))
L2 <- c(1,2,L+2) ##We've added two new columns that we need to include.
Data4 <- Data3 %>% select(L2)

# We descriptively name the variables and label the Activity Types.
names(Data4) <- Names
Data4$`Activity Type` <- factor(Data4$'Activity Type', levels = c(1:6), labels = labels[[2]])

# Finally we create our independent, tidy data set with the average of each variable
# for each activity and each subject
final_Dataset <- aggregate(Data4[,3:81], by = list('Subject Number' = Data4$`Subject Number`, 
                                    `Activity Type` = Data4$`Activity Type`), mean)
print(final_Dataset)
}