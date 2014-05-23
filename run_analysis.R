url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# check if folder or zip file for dataset exists and download and unzip zip file if necessary 
if (!file.exists("UCI HAR Dataset") & !file.exists("getdata_projectfiles_UCI HAR Dataset.zip")) {
        download.file(url, destfile="getdata_projectfiles_UCI HAR Dataset.zip", method="curl")
}

if (!file.exists("UCI HAR Dataset")){
        unzip("getdata_projectfiles_UCI HAR Dataset.zip")
}

# read data into R
f <- read.table("./UCI HAR Dataset/features.txt", head=F)
a <- read.table("./UCI HAR Dataset/activity_labels.txt")
s_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
s_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

# merge measured data with subjects and activity labels
X_test <- cbind(s_test, y_test, X_test)
X_train <- cbind(s_train, y_train, X_train)

# merge training and test data
X <- rbind(X_train, X_test)
colnames(X) <- c("subject", "activity", as.character(f[,2]))


# rename activities
X$activity[X$activity == 1] <- as.character(a$V2[as.numeric(a$V1)==1])
X$activity[X$activity == 2] <- as.character(a$V2[as.numeric(a$V1)==2])
X$activity[X$activity == 3] <- as.character(a$V2[as.numeric(a$V1)==3])
X$activity[X$activity == 4] <- as.character(a$V2[as.numeric(a$V1)==4])
X$activity[X$activity == 5] <- as.character(a$V2[as.numeric(a$V1)==5])
X$activity[X$activity == 6] <- as.character(a$V2[as.numeric(a$V1)==6])
X$activity <- tolower(X$activity)
X$activity <- gsub(pattern="_", x=X$activity, replacement="")
X$activity <- gsub(pattern="down", x=X$activity, replacement="Down")
X$activity <- gsub(pattern="up", x=X$activity, replacement="Up")

# extract data corresponding to the mean and standard deviation of each feature
n <- c(grep("std\\(\\)", names(X)), grep("mean\\(\\)", names(X)))
n <- sort(n)
Y <- X[, n]
Y <- cbind(X[,1:2], Y)


# make variable names more readable: remove "()" and "-" from column names, 
# change "BodyBody" to "Body", "mean" to "Mean" and "std" to "Std" 
names(Y) <- gsub(pattern="\\(|\\)", x=names(Y), replacement="")
names(Y) <- gsub(pattern="-", x=names(Y), replacement="")
names(Y) <- gsub(pattern="BodyBody", x=names(Y), replacement="Body")
names(Y) <- gsub(pattern="mean", x=names(Y), replacement="Mean")
names(Y) <- gsub(pattern="std", x=names(Y), replacement="Std")


# create new data set with the average of each variable for each activity
# and each subject.
aggY <- aggregate(Y[, 3:68], by=list(Y$subject, Y$activity), FUN=mean)
colnames(aggY) <- colnames(Y)
write.table(aggY, file="tidyData.txt", quote=F, sep="\t", col.names=T, 
            row.names=F)







