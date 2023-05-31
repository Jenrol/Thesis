# Thesis
This code is designed to import and process data from multiple datasets related to agricultural surveys conducted in different years (2013, 2015, and 2018).
 The code performs various data import and manipulation tasks using R programming language.

## Prerequisites
Before running the code, ensure that the required R packages are installed. The code checks for the following packages and installs them if not already installed:

foreign
haven
tidyverse
skimr
mvprobit
psych
stargazer
## Data Import
The code imports data from multiple CSV and DTA files for the respective years (2013, 2015, and 2018). 
The datasets are imported and stored in separate data frames for each year. 
The data files are expected to be present in the specified directory path ("C:/users/admin/desktop/One_Drive_Moved/DATA").

## Data Manipulation
The code performs various data manipulation tasks by selecting specific variables from the imported datasets. 
The selected variables are stored in separate data frames for further analysis. The code includes the following data manipulation tasks for each year:

## Year 2013
Selects variables from the 2013 data related to households, landholding, landholding use rights, labour input, crop grown, production, livestock, extension, farm implements, and animal power.
## Year 2015
Selects variables from the 2015 data related to households, landholding, landholding use rights, labour input, crop grown, production, livestock, extension, farm implements, and animal power.
## Year 2018
Selects variables from the 2018 data related to households, landholding, labour input, crop grown, production, livestock, extension, farm implements, and animal power.
## Output
The code generates multiple data frames containing the selected variables for each year. The data frames can be used for further analysis and exploration.

Please ensure that the data files are present in the specified directory and the required R packages are installed before running the code.






