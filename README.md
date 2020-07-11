# getting_and_cleaning_data_project

Run_analysis.R was used to summarize the activity data provided by the UCI.
Check CodeBook.md for details about the measurements and the provided data.

The script works best if the folder "UCI HAR Dataset" containing all the initial data
in the original structure, is found in the working directory (which should not be the "UCI HAR Dataset"
folder itself).
The data are originally provided as .txt and can be loaded with the function

```r
read.table()
```

The descriptions of the activities and the measurement variables are imported together
with the data sets, and the colnames() were set to the feature description using

```r
colnames(test_set) <- features$V2
colnames(training_set) <- features$V2
```

To each data set the subject IDs and the activity IDs were added.

```r
cbind()
```

The training and the test set were combined using the rbind function.

#Selecting variables and cleaning the data
Using the dplyr package the columns containing mean and sd were selected.

```r
data_set%>%
    select(subject, activity, contains("mean()"), contains("std()"))
```

Activity labels were added as factors.

Finally, a tidy data set was created, averaging als measurements by subject and activity.

```r
library(tidyr)
data_avg <- data_mean%>%
    gather(measurement, value, -subject, -activity)%>%
    group_by(subject, activity, measurement)%>%
    summarize(average = mean(value))
```

The tidy data set is available as tidy_data_set.csv