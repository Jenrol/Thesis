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

## 2013 Data Processing
The code starts by merging plot-level observations for the first visit in 2013 (CropGrown13_visit1) with labor input data (labour_input_13) based on the household ID (HHID) and plot ID (plotID).
Then, it merges the resulting data with production data (Production_13).
A new column visit is added to indicate the visit number as 1.
Next, it merges additional data related to the household level observations (Household_13, landholding_13, landholding_use_right_13, Extension_13, Extension2_13) using the household ID (HHID).
Multiple merges are performed to combine various household-level observations.
Finally, all the data for 2013 is merged together based on the household ID (HHID) to create the plot_overall_13 dataset.

## 2015 Data Processing
Similar to the 2013 processing, the code performs merging operations for plot-level and household-level observations for 2015.
Plot-level observations are merged for both the first and second visits (CropGrown15_visit1, CropGrown15_visit2) with labor input data (labour_input_15).
Production data for 2015 (Production_15) is merged with the plot-level observations.
Household-level observations are merged, including landholding data (landholding_15), land use rights data (landholding_use_right_15), and extension data (Extension_15, Extension2_15).

## 2018 Data Processing
The code follows a similar pattern for processing the 2018 data.
Plot-level observations for the first and second visits are merged with labor input and production data.
Household-level observations, including landholding data (Landholding_18), land use rights data (landholding_use_right_18), and extension data (Extension_18, Extension2_18), are merged.

## All Year Dataframes
The code includes operations for reading additional dataframes (combined_2013, combined_2015, combined_2018, Combined_2013_2015_new, Combined_2013_2015, Var2018) using the read_dta function (assuming the data is in Stata format).
The code also performs some data transformations and manipulations on these dataframes, such as renaming variables, combining dataframes using rbind, and analyzing the data using the skim and table functions.
Other Operations

## Statistical Analysis
The code includes several statistical analyses and modeling tasks using different functions and models. Here are some of the analyses performed:

### Correlation analysis: The code calculates correlation coefficients between different variables using the cor() function.
### Probit regression: The code fits a probit regression model using the glm() function with the family = binomial(link = "probit") argument.
### IV regression: The code performs an instrumental variable (IV) regression using the ivreg() function.
### OLS regression: The code fits ordinary least squares (OLS) regression models using the lm() function.
### Propensity score matching: The code performs propensity score matching using the matchit() function.
### Descriptive statistics: The code provides summary statistics using the summary() function and the describe() function from the faraway package.
## Output and Reporting
The code uses the stargazer() function to generate summary tables for the regression models. The tables are printed to the console and can be saved as text or HTML files.

## Data Export
The code exports some of the datasets and variables to Stata data files (.dta) using the write.dta() function.
























