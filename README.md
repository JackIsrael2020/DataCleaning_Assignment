---
title: "ReadME"
author: "Jack Israel"
date: "28/06/2020"
output: html_document
---

# Analysis Process

## Cleaning Step

After downloading the data and reading in the simpler data sets (y_test.txt, y_train.txt, subject_test.txt, subject_train.txt & features.txt) we perform some cleaning on the main data sets, X_Test.txt and X_Train.txt. All multiple-spaces in the text files were replaced with single spaces, using a regular expression in gsub(). Without this cleaning, the resulting data frames had more columns than there were variables and many instances of NA values.

## Step 1.
We complete Step 1. of the instructions by applying the list of variable names from features.txt to the data (creating Data1 and Data2) and merging all the data sets together (into Data3).

## Step 2.
For Step 2. we select the necessary columns of Data3 (those relating to calculated means and standard deviations) to form Data4 using grep() and select().

## Step 3-4.
We complete both Steps 3. and 4. in a short space of time, by adding descriptive names for the activity types (by labeling the factor) and the variables of the data set. The activity names clearly indicate what type of activity the subject is performing. Similarly, the variable names thoroughly describe the meaning of the value, whether the value is an original measurement or a derived value and whether it was taken in the time domain or the frequency domain.

## Step 5.
Finally, we complete Step 5. by creating final_dataset, an independent, tidy data set.
Each row of final_Dataset is a vector of average measurements taken over multiple instances of the same subject performing the same activity. This is easily done using the aggregate() function.

## Why the Data Set is Tidy?
This is a tidy data set because, along with human readable variable names, it fulfils the major principles of Tidy Data:

* There is one variable per column
* There is one observation per row
* There is only one kind of variable, so there is only one table.
