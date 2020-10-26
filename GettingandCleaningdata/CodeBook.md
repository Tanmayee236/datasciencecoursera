

## CodeBook.md

This is a description of the analysis done on the dataset as described in the project assignment. The run_analysis.R does the following 

1. Download the dataset in the folder called UCI HAR Dataset
2. Load the test and training data.
3. Merge the test and train datasets
4. Selecting measurements with std or mean in the name
5. Assigning descriptive names to the activities
6. Using descriptive names for columns 
7. Creating a second independent tidy data set with the average 
of each variable for each activity and each subject.

The TidyDataSet.txt has the data averaged over 6 activities and 30 subjects. The acivities are following 

WALKING\
WALKINGUPSTAIRS\
WALKINGDOWNSTAIRS\
SITTING\
STANDING\
LAYING


