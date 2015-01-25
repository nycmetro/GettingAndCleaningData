#Leo Ruane
#1.25.15
#Script Getting and Cleaning Data Course Project
#Check for packages install and load
#Download project data
#Merge the selected test/train datasets and label
#take only std|mean labelled columns from X dataset
#combine dataset
#melt and dcast to produce a tidy file with means for Subject and activites by std/mean measures 

if (!"data.table" %in% installed.packages()) install.packages(data.table) 
  require(data.table)

if (!"reshape2" %in% installed.packages()) install.packages(reshape2) 
  require(reshape2)

if (!"stringr" %in% installed.packages()) install.packages(stringr) 
  require(stringr)


filename = "tidydataset.txt" 
dataDir <- "./UCI HAR Dataset" 
dirname <- paste0(dataDir,"/")

cat("Generate a tidy dataset and write it to the file", filename, "!\nPlease wait ...\n") 


if(!file.exists(dataDir)){ 
         cat("Download and unzip data in current working directory:\n", getwd(), "\n...\n") 
         temp <- tempfile() 
         fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
         download.file(fileUrl, temp) 
         unzip(temp) 
         unlink(temp) 
         dateDownloaded <- date() 
} 

#Get activity
dataFile <- paste0(dirname, "activity_labels.txt")
activity.labels <- read.table(dataFile)[,2]

#Get Feature
dataFile <- paste0(dirname, "features.txt")
features <- read.table(dataFile )[,2]
meanstd.features <-  grepl("mean|std", features)

#Get y 
dataFile <- paste0(dirname, "test/y_test.txt")
y.test <-read.table(dataFile)
dataFile <- paste0(dirname, "train/y_train.txt")
y.train <-read.table(dataFile)

#Get X
dataFile <- paste0(dirname, "test/X_test.txt")
X.test <-read.table(dataFile)
dataFile <- paste0(dirname, "train/X_train.txt")
X.train <-read.table(dataFile)

#Get Subject
dataFile <- paste0(dirname, "test/subject_test.txt")
subject.test <- read.table(dataFile)
dataFile <- paste0(dirname, "train/subject_train.txt")
subject.train <- read.table(dataFile)
subject <- rbind(subject.test , subject.train)
names(subject) <- "Subject"


#join y dataset and label columns
y <- rbind(y.test,y.train)
y[,2] <- activity.labels[y[,1]]
names(y) <- c("Activity_ID","Activity")

#join y dataset and label columns
X <- rbind(X.test,X.train)
names(X) <- features
X <- X[,meanstd.features]

# clean the features columns names to make more descriptive
clean.features <- colnames(X)
clean.features <- str_replace_all(clean.features, "\\(\\)\\-" , ".")
clean.features <- str_replace_all(clean.features, "mean" , "Mean")
clean.features <- str_replace_all(clean.features, "std" , "Std")
clean.features <- str_replace_all(clean.features, "\\(\\)" , "")
clean.features <- str_replace_all(clean.features, "-" , ".")
names(X) <- clean.features

#Combine Subject , y and X datasets
data <- cbind(as.data.table(subject),y,X)

#melt and dcast data to produce tidy data with Subject and activity means for mean and std columns
id.labels   = c("Subject", "Activity_ID", "Activity")
measures = setdiff(colnames(data), id.labels)
melt_data      = melt(data, id = id.labels, measure.vars = measures)
tidy_data   = dcast(melt_data, Subject + Activity ~ variable, fun = mean)

#Write tidy data to file
write.table(tidy_data,filename,row.names = FALSE)

cat("Analysis complete tidy data set written to ", filename) 
#clean up memmory
rm(list = ls())
