rm(list = ls())

getwd()

setwd("C:/users/admin/desktop/One_Drive_Moved/DATA")
check.packages <- function(pkg) {
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg))
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}
packages <- c("foreign", "haven", "tidyverse", "skimr")
check.packages(packages)
install.packages("mvprobit")
install.packages("psych")
library(psych)
library(stargazer)


#Importing 2013 data 
HH13 <- read.csv("agsec1_19.csv")
LH13<-read.csv("agsec2a_13.csv")
LHU13<-read.csv("agsec2b_13.csv")
LI_13<-read.csv("agsec3a_13.csv")
LI2_13<-read.csv("agsec3b_13.csv")
CG_visit1_13<-read.csv("agsec4a_13.csv")
CG_visit2_13<-read.csv("agsec4b_13.csv")
QP_13<-read.csv("agsec5a_13.csv")
QP2_13<-read.csv("agsec5b_13.csv")
LS_13<-read.csv("agsec6a_13.csv")
LS2_13<-read.csv("agsec6b_13.csv")
LS3_13<-read.csv("agsec6c_13.csv")
Ext_13<-read.csv("agsec9_13.csv")
Ext2_13<-read.csv("agsec9a_13.csv")
FI_13<-read.csv("agsec10_13.csv")
AP_13<-read.csv("agsec11_13.csv")


#Importing 2015 data 
HH15 <- read.csv("agsec1.csv")
LH15<-read.csv("agsec2a.csv")
LHU15<-read.csv("agsec2b.csv")
LI_15<-read.csv("agsec3a.csv")
LI2_15<-read.csv("agsec3b.csv")
CG_visit1_15<-read.csv("agsec4a.csv")
CG_visit2_15<-read.csv("agsec4b.csv")
QP_15<-read.csv("agsec5a.csv")
QP2_15<-read.csv("agsec5b.csv")
LS_15<-read.csv("agsec6a.csv")
LS2_15<-read.csv("agsec6b.csv")
LS3_15<-read.csv("agsec6c.csv")
Ext_15<-read.csv("agsec9a.csv")
Ext2_15<-read.csv("agsec9b.csv")
FI_15<-read.csv("agsec10.csv")
AP_15<-read.csv("agsec11.csv")

#Importing 2018 data
HH18<-read_dta("AGSEC1.dta")
LH_18<-read_dta("AGSEC2A.dta")
LHU_18<-read_dta("AGSEC2B.dta")
LI_18<-read_dta("AGSEC3A.dta")
LI2_18<-read_dta("AGSEC3B.dta")
CG_visit1_18<-read_dta("AGSEC4A.dta")
CG_visit2_18<-read_dta("AGSEC4B.dta")
QP_18<-read_dta("AGSEC5A.dta")
QP2_18<-read_dta("AGSEC5B.dta")
LS_18<-read_dta("AGSEC6A.dta")
LS2_18<-read_dta("AGSEC6B.dta")
LS3_18<-read_dta("AGSEC6C.dta")
Ext_18<-read_dta("AGSEC9A.dta")
Ext2_18<-read_dta("AGSEC9B.dta")
FI_18<-read_dta("AGSEC10.dta")
AP_18<-read_dta("AGSEC11.dta")
combined<-read_dta("Combined_2018.dta")
skim(combined)
write.dta(HH18, "Household18.dta")
Dwelling<-read_dta("GSEC9.dta")
Asset<-read_dta("GSEC14.dta")

summary(Asset$h14q05)
# Selecting variable
#year 2013
Household_13<-select(HH13,HHID,region,urban)
Household_13$hhsize<-NA
Household_13$urban[Household_13$urban=="0"]<-2
landholding_13<-select(LH13, HHID,parcelID,a2aq1owned,a2aq4,a2aq5,a2aq6,a2aq7,a2aq8,a2aq10,a2aq11a,a2aq11b,a2aq15a,a2aq15b,a2aq16,a2aq17,a2aq18,a2aq19)
landholding_use_right_13<-select(LHU13,HHID,parcelID,a2bq1owned,a2bq4,a2bq5,a2bq6,a2bq7,a2bq8,a2bq9,a2bq10,a2bq11,a2bq12a,a2bq12b,a2bq14,a2bq15,a2bq16,a2bq17)
labour_input_13<-select(LI_13,HHID,parcelID,plotID,a3aq4,a3aq5,a3aq6,a3aq7,a3aq8,a3aq12,a3aq13,a3aq15,a3aq16, a3aq17,a3aq18,a3aq22,a3aq24b,a3aq24a,a3aq25,a3aq26,a3aq27,a3aq3_1)
labour_input2_13<-select(LI2_13,HHID,parcelID,plotID,a3bq4,a3bq5,a3bq6,a3bq7,a3bq8,a3bq12,a3bq13,a3bq15,a3bq16,a3bq17,a3bq18,a3bq22,a3bq24b,a3bq24a,a3bq25,a3bq26,a3bq27,a3bq3_1)
CropGrown13_visit1<-select(CG_visit1_13,HHID,parcelID,plotID,cropID,a4aq6_1,a4aq8,a4aq9,a4aq9_1,a4aq9_2,a4aq16,a4aq11a,a4aq11b,a4aq12a,a4aq12b,a4aq13,a4aq14,a4aq10,a4aq15,a4aq7)
CropGrown13_visit2<-select(CG_visit2_13,HHID,parcelID,plotID,cropID,a4bq6_1,a4bq8,a4bq9,a4bq9_1,a4bq9_2,a4bq16,a4bq11a,a4bq11b,a4bq12a,a4bq12b,a4bq13,a4bq14,a4bq10,a4bq15,a4bq7)
Production_13<-select(QP_13,HHID,parcelID,plotID,cropID,a5aq5_1,a5aq6a,a5aq6c,a5aq6d,a5aq6e,a5aq6e_1,a5aq6f,a5aq6f_1,a5aq7a,a5aq7b,a5aq7c,a5aq8,a5aq9,a5aq10,a5aq12,a5aq6b)
Production2_13<-select(QP2_13,HHID,parcelID,plotID,cropID,a5bq5_1,a5bq6a,a5bq6c,a5bq6d,a5bq6e,a5bq6e_1,a5bq6f,a5bq6f_1,a5bq7a,a5bq7b,a5bq7c,a5bq8,a5bq9,a5bq10,a5bq12,a5bq6b)
Livestock_cattle_13<-select(LS_13,HHID,a6aq3a)
Livestock_goat_13<-select(LS2_13, HHID,a6bq3a)
Livestock_poultry_13<-select(LS3_13,HHID,a6cq2,a6cq3a)
Extension_13<-select(Ext_13,HHID,a9q2,a9q4a,a9q4b,a9q4c,a9q4d,a9q5a,a9q5b,a9q5d,a9q6a,a9q6b,a9q7,a9q8,a9q9,a9q10,a9q2)
Extension2_13<-select(Ext2_13,HHID,a9q11,a9q12,a9q13,a9q14,a9q15,a9q16)
Farm_Implement_13<-select(FI_13, HHID,A10itemcod,a10q1, a10q2,a10q3,a10q4,a10q6)
Animal_power_13<-select(AP_13,HHID, a11q2,a11q3)

#to select variable needed from the dataset15
Household_15<-select(HH15,HHID,region,urban)
Household_15$hhsize<-NA
landholding_15<-select(LH15, HHID,parcelID,a2aq1owned,a2aq4,a2aq5,a2aq6,a2aq7,a2aq8,a2aq10,a2aq11a,a2aq11b,a2aq15a,a2aq15b,a2aq16,a2aq17,a2aq18,a2aq19)
landholding_use_right_15<-select(LHU15,HHID,parcelID,a2bq1owned,a2bq4,a2bq5,a2bq6,a2bq7,a2bq8,a2bq9,a2bq10,a2bq11,a2bq12a,a2bq12b,a2bq14,a2bq15,a2bq16,a2bq17)
labour_input_15<-select(LI_15,HHID,parcelID,plotID,a3aq4,a3aq5,a3aq6,a3aq7,a3aq8,a3aq12,a3aq13,a3aq15,a3aq16, a3aq17,a3aq18,a3aq22,a3aq24b,a3aq24a,a3aq25,a3aq26,a3aq27,a3aq3_1)
labour_input2_15<-select(LI2_15,HHID,parcelID,plotID,a3bq4,a3bq5,a3bq6,a3bq7,a3bq8,a3bq12,a3bq13,a3bq15,a3bq16,a3bq17,a3bq18,a3bq22,a3bq24b,a3bq24a,a3bq25,a3bq26,a3bq27,a3bq3_1)
CropGrown15_visit1<-select(CG_visit1_15,HHID,parcelID,plotID,cropID,a4aq6_1,a4aq8,a4aq9,a4aq9_1,a4aq9_2,a4aq16,a4aq11a,a4aq11b,a4aq12a,a4aq12b,a4aq13,a4aq14,a4aq10,a4aq15,a4aq7)
CropGrown15_visit2<-select(CG_visit2_15,HHID,parcelID,plotID,cropID,a4bq6_1,a4bq8,a4bq9,a4bq9_1,a4bq9_2,a4bq16,abaq11a,a4bq11b,a4bq12a,a4bq12b,a4bq13,a4bq14,a4bq10,a4bq15,a4bq7)
Production_15<-select(QP_15,HHID,parcelID,plotID,cropID,a5aq5_1,a5aq6a,a5aq6b,a5aq6d,a5aq6e,a5aq6e_1,a5aq6f,a5aq6f_1,a5aq7a,a5aq7b,a5aq7c,a5aq8,a5aq9,a5aq10,a5aq12,a5aq6c)
Production2_15<-select(QP2_15,HHID,parcelID,plotID,cropID,a5bq5_1,a5bq6a,a5bq6b,a5bq6d,a5bq6e,a5bq6e_1,a5bq6f,a5bq6f_1,a5bq7a,a5bq7b,a5bq7c,a5bq8,a5bq9,a5bq10,a5bq12,a5bq6c)
Livestock_cattle_15<-select(LS_15,HHID,a6aq2,a6aq3a)
Livestock_goat_15<-select(LS2_15,HHID, a6bq2,a6bq3a)
Livestock_poultry_15<-select(LS3_15,HHID,a6cq2,a6cq3a)
Extension_15<-select(Ext_15,HHID,a9q4a,a9q4b,a9q4c,a9q4d,a9q5a,a9q5b,a9q5d,a9q6a,a9q6b,a9q7,a9q8,a9q9,a9q10,a9q2)
Extension2_15<-select(Ext2_15,HHID,a9q11,a9q12,a9q13,a9q14,a9q15,a9q16)
Farm_Implement_15<-select(FI_15, HHID,A10itemcod,a10q1,a10q2,a10q3,a10q4,a10q6)
Animal_power_13<-select(AP_15,HHID, a11q2,a11q3)

# to select variable needed from the dataset 18
Household_18<-select(HH18,t0_hhid,region,urban,hhsize)
Landholding_18<-select(LH_18,t0_hhid,parcelID,a2aq1owned,s2aq4,s2aq5,s2aq6,s2aq7,s2aq8,s2aq10,s2aq11a,s2aq11b,s2aq15a,s2aq15b,s2aq16,s2aq17,a2aq18,s2aq19)
landholding_use_right_18<-select(LHU_18,t0_hhid,parcelID,a2bq1owned,s2aq04,s2aq05,s2aq06,s2aq07,s2aq08,a2bq09,a2bq10,a2bq11,a2bq12a,a2bq12b,s2aq16,s2aq17,a2aq18,s2aq19)
labour_input_18<-select(LI_18,t0_hhid,parcelID,pltid,s3aq04,s3aq05,s3aq06,s3aq07,s3aq08,s3aq12,s3aq13,s3aq15,s3aq16,s3aq17,s3aq18,s3aq22,s3aq24a,s3aq24b,s3aq25,s3aq26,s3aq27)
labour_input_18$s3aq03_1<-NA
labour_input2_18<-select(LI2_18,t0_hhid,parcelID,pltid,s3bq04,s3bq05,s3bq06,s3bq07,s3bq08,s3bq12,s3bq13,s3bq15,s3bq16,s3bq17,s3bq18,s3bq22,s3bq24a,s3bq24b,s3bq25,s3bq26,s3bq27,s3bq03_1)
CropGrown18_visit1<-select(CG_visit1_18,t0_hhid,parcelID,pltid,cropID,s4aq06_1,s4aq08,s4aq09,s4aq09_1,s4aq09_2,s4aq16,s4aq11a,s4aq11b,s4aq12a,s4aq12b,s4aq13,s4aq14,s4aq10,s4aq15,s4aq07)
CropGrown18_visit2<-select(CG_visit2_18,t0_hhid,parcelID,pltid,cropID,s4bq06_1,s4bq08,s4bq09,s4bq09_1,s4bq09_2,s4bq16,s4bq11a,s4bq11b,s4bq12a,s4bq12b,s4bq13,s4bq14,s4bq10,s4bq15,s4bq07)
Production_18<-select(QP_18,t0_hhid,parcelID,pltid,cropID,s5aq05_1,s5aq06a_1,a5aq6b,a5aq6d,s5aq06e_1,s5aq06e_1_1,s5aq06f_1,s5aq06f_1_1,s5aq07a_1,s5aq07b_1,s5aq07c_1,s5aq08_1,s5aq09_1,s5aq10_1,s5aq12_1)
Production_18$a5aq6c<-NA
Production2_18<-select(QP2_18,t0_hhid,parcelID,pltid,cropID,s5bq05_1,s5bq06a_1,a5bq6c,a5bq6d,s5bq06e_1,s5bq06e_1_1,s5bq06f_1,s5bq06f_1_1,s5bq07a_1,s5bq07b_1,s5bq07c_1,s5bq08_1,s5bq09_1,s5bq10_1,s5bq12_1,a5bq6b)
Livestock_cattle_18<-select(LS_18,t0_hhid,s6aq03a)
Livestock_cattle_18<-mutate (Livestock_cattle_18,a6aq2=ifelse(s6aq03a >=1,"1","2"))
Livestock_goat_18<-select(LS2_18,t0_hhid, s6bq03a)
Livestock_goat_18<-mutate (Livestock_goat_18,a6bq2=ifelse(s6bq03a >=1,"1","2"))
Livestock_poultry_18<-select(LS3_18,t0_hhid,s6cq03a)
Livestock_poultry_18<-mutate (Livestock_poultry_18,a6cq2=ifelse(s6cq03a >=1,"1","2"))
Extension_18<-select(Ext_18,to_hhid,h9q04a,h9q04b,h9q04c,h9q05ag__1,h9q05ag__2,h9q05ag__4,h9q06a,h9q06b,h9q07a,h9q08a,h9q09,h9q10a)
Extension_18$h9q2<-NA
colnames(Extension_18)[colnames(Extension_18)=="to_hhid"]<-"t0_hhid"
Extension2_18<-select(Ext2_18,t0_hhid,h9q11a,h9q12a,h9q13a,h9q14a,h9q15a,h9q16a)
Farm_Implement_18<- select(FI_18,t0_hhid,A10itemcod_ID,s10q01a,s10q02a,s10q03aa,s10q04a,s10q06a)
Animal_power_18<-select(AP_18,to_hhid, s11q02,s11q03)

#creating database
#first visit 2013
#merge plot level observation 
Plot_L1_13<-merge(labour_input_13,CropGrown13_visit1, by=c("HHID", "plotID"))
Plot_L2_13<-merge(Plot_L1_13,Production_13,by=c("HHID", "plotID"))
Plot_L2_13$visit<-1


#Farm<-merge(Farm_Implement_13,Animal_power_13, by="HHID")
#second visit 2013
Plot2_L1_13<-merge(labour_input2_13,CropGrown13_visit2, by=c("HHID", "plotID"))
Plot2_L2_13<-merge(Plot2_L1_13,Production2_13,by=c("HHID", "plotID"))
Plot2_L2_13$visit<-2

#merge household level observation 2013
HH1_13<-merge(Household_13,landholding_13, by= "HHID")
HH2_13<-merge(HH1_13,landholding_use_right_13,by="HHID")
Ext13<-merge(Extension_13,Extension2_13,by="HHID")

HH3_13<-merge(HH1_13,Extension_13,by="HHID")
HH4_13<-merge(HH3_13,Extension2_13,by="HHID")

#merge all 2013 together
names(Plot_L2_13) <- names(Plot2_L2_13)
Plot_data13<-rbind(Plot_L2_13,Plot2_L2_13)
plot_overall_13<-merge(Plot_data13,HH4_13, by="HHID")

#2015 DATAFRAME
#first visit 2015
#merge plot level observation 2015
Plot_L1_15<-merge(labour_input_15,CropGrown15_visit1, by=c("HHID", "plotID"))
Plot_L2_15<-merge(Plot_L1_15,Production_15,by=c("HHID", "plotID"))


#second visit 2015
Plot2_L1_15<-merge(labour_input2_15,CropGrown15_visit2, by=c("HHID", "plotID"))
Plot2_L2_15<-merge(Plot2_L1_15,Production2_15,by=c("HHID", "plotID"))

#merge household level observation 2015
HH1_15<-merge(Household_15,landholding_15, by= "HHID")
HH2_15<-merge(HH1_15,landholding_use_right_15,by="HHID")
Ext15<-merge(Extension_15,Extension2_15)

HH3_15<-merge(HH2_15,Extension_15,by="HHID")
HH4_15<-merge(HH3_15,Extension2_15,by="HHID")


#first visit 2018
#merge plot level observation 2018
Plot_L1_18<-merge(labour_input_18,CropGrown18_visit1, by=c("t0_hhid", "pltid"))
Plot_L2_18<-merge(Plot_L1_18,Production_18,by=c("t0_hhid", "pltid"))


#second visit 2018
Plot2_L1_18<-merge(labour_input2_18,CropGrown18_visit2, by=c("t0_hhid", "pltid"))
Plot2_L2_18<-merge(Plot2_L1_18,Production2_18,by=c("t0_hhid", "pltid"))

#merge household level observation 2018
HH1_18<-merge(Household_18,Landholding_18, by= "t0_hhid")
HH2_18<-merge(HH1_18,landholding_use_right_18,by="t0_hhid")
Ext18<-merge(Extension_18,Extension2_18, by="t0_hhid")
HH3_18<-merge(HH2_18,Extension_18,by="t0_hhid")
HH4_18<-merge(HH3_18,Extension2_18,by="t0_hhid")

#All year data frame from dta file
combined_2013<-read_dta("data_2013.dta")
combined_2015<-read_dta("data_2015.dta")
combined_2018<-read_dta("data_2018.dta")
combined_ALL<-read_dta("Combined_2013_2015_2018_new.dta")
Combined_2013_15<-read_dta("Combined_2013_2015 (1).dta")
names(Var2018)<-names(Combined_2013_15)
Var2018<-read_dta("DATAS_2018.dta")
rbind(Combined_2013_15,Var2018)
skim(Combined_2013_15)
table(Combined_2013_15$a2aq18)

#selecting variables from dta files
DATA_2013<-select(combined_2013,HHID,plotID,cropID,parcelID,h2q3,h2q8,h2q10,h4q4,h4q5,h4q7,h4q15g,HHASH_ID,h14Bq2,
                  region,urban,a2aq1owned,a2aq4,a2aq5,a2aq6,a2aq7,a2aq8,a2aq10,a2aq11a,a2aq11b,a2aq15a,a2aq15b,a2aq16,a2aq17,
                  a2aq18,a2aq19,a3bq4,a3bq5,a3bq6,a3bq7,a3bq8,a3bq12,a3bq13,a3bq15,a3bq16,a3bq17,a3bq18,a3bq22,a3bq24b,a3bq24a,a3bq25,a3bq26,a3bq27,a3bq3_1,
                  a4bq6_1,a4bq8,a4bq9,a4bq9_1,a4bq9_2,a4bq16,a4bq11a,a4bq11b,a4bq13,a4bq14,a4bq10,a4bq15,a4bq7,a5bq5_1,a5bq6a,a5bq6c,a5bq6d,
                  a5bq6e,a5bq6e_1,a5bq6f,a5bq6f_1,a5bq7a,a5bq7b,a5bq7c,a5bq8,a5bq9,a5bq10,a5bq12,a5bq6b,a5bq14a,a5bq14b,a5bq15,
                  a9q3,a9q11,a9q12,a9q13,a9q14,a9q15,a9q16)
DATA_2013$YEAR<-2013

DATA_2015<-select(combined_2015,HHID, plotID,cropID,parcelID,h2q3,h2q8,h2q10,h4q4,h4q5,h4q7,h4q15g,HHASH_ID,h14Bq2,
                  region,urban,a2aq1owned,a2aq4,a2aq5,a2aq6,a2aq7,a2aq8,a2aq10,a2aq11a,a2aq11b,a2aq15a,a2aq15b,a2aq16,a2aq17,a2aq18,a2aq19,
                  a3bq4,a3bq5,a3bq6,a3bq7,a3bq8,a3bq12,a3bq13,a3bq15,a3bq16,a3bq17,a3bq18,a3bq22,a3bq24b,a3bq24a,a3bq25,a3bq26,a3bq27,a3bq3_1,
                 a4bq6_1,a4bq8,a4bq9,a4bq9_1,a4bq9_2,a4bq16,abaq11a,a4bq11b,a4bq13,a4bq14,a4bq10,a4bq15,a4bq7,
                  a5bq5_1,a5bq6a,a5bq6b,a5bq6d,a5bq6e,a5bq6e_1,a5bq6f,a5bq6f_1,a5bq7a,a5bq7b,a5bq7c,a5bq8,a5bq9,a5bq10,a5bq12,a5bq6c,
                  a5bq14a,a5bq114b,a5bq15,a9q3,a9q11,a9q12,a9q13,a9q14,a9q15,a9q16)
DATA_2015$YEAR<-2015
skim(DATA_2015)

DATA_2018<-select(combined_2018,t0_hhid,pltid,cropID,parcelID,h2q3,h2q8,h2q10,s4q04,s4q05,s4q07,h4q15g,
                  h14q02,h14q03,region,urban,a2aq1owned,s2aq4,s2aq5,s2aq6,s2aq7,s2aq8,s2aq10,s2aq11a,s2aq11b,s2aq15a,s2aq15b,s2aq16,s2aq17,a2aq18,s2aq19,
                  s3bq04,s3bq05,s3bq06,s3bq07,s3bq08,s3bq12,s3bq13,s3bq15,s3bq16,s3bq17,
                  s3bq18,s3bq22,s3bq24a,s3bq24b,s3bq25,s3bq26,s3bq27,s3bq03_1,s4bq06_1,s4bq08,s4bq09,s4bq09_1,s4bq09_2,s4bq16,s4bq11a,s4bq11b,
                  s4bq13,s4bq14,s4bq10,s4bq15,s4bq07,s5bq05_1,s5bq06a_1,a5bq6c,a5bq6d,s5bq06e_1,s5bq06e_1_1,s5bq06f_1,s5bq06f_1_1,s5bq07a_1,s5bq07b_1,s5bq07c_1,
                  s5bq08_1,s5bq09_1,s5bq10_1,s5bq12_1,a5bq6b,s5bq14a_2,s5bq14b_2,s5bq15_2,h9q03a__1,h9q11a,h9q12a,h9q13a,h9q14a,h9q15a,h9q16a)
DATA_2018$YEAR<-2018
library(foreign)



Variables_2018<-select(combined_2018,t0_hhid,hhid,interview__key,pltid,cropID,parcelID,h2q3,h2q8,h2q9c,h2q10,s4q04,s4q05,s4q07,s4q09,s4q10,s4q12,h4q15g,s11q01,
                       h11q02,IncomeSource,s11q04,h14q02,h14q03,h14q05,region,urban,hhsize,lvstck,hh_anm,hh_plty,a2aq1owned,s2aq4,s2aq5,s2aq6,s2aq7,s2aq8,
                       s2aq10,s2aq11a,s2aq15a,s2aq15b,a2aq28,a2aq29a,s2aq16,s2aq17,a2aq18,s2aq19,s2aq20,s2aq23,s2aq27__0,a2aq34,h9q03a__1,h9q03a__2,h9q03a__3,
                       h9q03a__4,h9q03a__5,h9q03a__6,h9q03a__7,s4bq06_1,s4bq08,s4bq09,s4bq09_1,s4bq16,s4bq11a,s4bq11b,s4bq13,s4bq10,s4bq15,s4bq07,
                       s3aq03b,s3bq03_1, s3bq03a,s3bq04,s3bq05,s3bq06,s3bq07,s3bq08,s3bq09,s3bq13,s3bq15,s3bq16,s3bq17,s3bq18,s3bq22,s3bq24a,s3bq24b,s3bq27,s3bq35b)

DEP_inorganic<-Variables_2018[! is.na(Variables_2018$s3bq13),]
DEP_seed<-DEP_inorganic[! is.na(DEP_inorganic$s4bq13),]
skim(DEP_seed)

Variables_18<-select(combined_2018,t0_hhid,h2q3,h2q8,h2q10,s4q04,s4q07,IncomeSource,h14q02,h14q05,region,urban,hhsize,lvstck,
                     hh_anm,a2aq1owned,s2aq5,s2aq6,s2aq7,s2aq16,s2aq17,a2aq18,s2aq19,h9q03a__1,h9q11a,h9q12a,h9q13a,h9q14a,h9q15a,h9q16a,
                     s4bq08,s4bq13,s4bq07,s3bq04,s3bq13,s3bq22,s4bq13,s4bq07,s5bq09_1,s5bq06a_1,a5bq6c,a5bq6d,s5bq07a_1,
                     s5bq07b_1,s5bq07c_1,s5bq08_1,s5bq12_1,a5bq6b,s5bq14a_2,s5bq14b_2,s5bq15_2)

dataset_18<-select(combined_2018,t0_hhid,h2q3,h2q8,s4q07,h14q02,h14q05,urban,hhsize,lvstck,
                     hh_anm,a2aq1owned,s2aq5,s2aq6,h9q03a__1,h9q11a,h9q12a,h9q13a,h9q14a,h9q15a,h9q16a,
                     s4bq08,s4bq13,s4bq07,s3bq04,s3bq13,s3bq22,s4bq13,s4bq07,s5bq09_1,
                     s5bq08_1,s5bq12_1,a5bq6b,s5bq14a_2,s5bq14b_2,s5bq15_2)
table(Variables_18$region)
summary(Variables_18$IncomeSource)

# replacing binary values to match the whole data set 
dataset_18$Mstatus<-ifelse(Variables_18$h2q10>2,0,1)
dataset_18$literacy<-ifelse(Variables_18$s4q04>2,1,0)
dataset_18$soiltype<-ifelse(Variables_18$s2aq16>1,0,1)
dataset_18$soilqlty<-ifelse(Variables_18$s2aq17>2,1,0)
dataset_18$water<-ifelse(Variables_18$a2aq18>1,1,0)
dataset_18$hilly<-ifelse(Variables_18$s2aq19>2,0,1)
dataset_18$gentleslope<-ifelse(Variables_18$s2aq19>2,1,0)
dataset_18$tenure<-ifelse(Variables_18$s2aq7>3,1,0)
dataset_18$nonfarm_income<-ifelse(Variables_18$IncomeSource>20,1,0)
dataset_18$central<-ifelse(Variables_18$region>1,0,1)
dataset_18$eastern<-ifelse(Variables_18$region>2,0,1)
dataset_18$Northern<-ifelse(Variables_18$region>5,1,0)
dataset_18$yield<-Variables_18$s5bq06a_1*Variables_18$a5bq6d

describe(DATA_new)
DATA_new_omit<-na.omit(DATA_new)
Variables_18$region[Variables_18$region==1]<-5
Variables_18$region[Variables_18$region==3]<-8

Variables_18$s2aq19[Variables_18$s2aq19==2]<-7
Variables_18$s2aq19[Variables_18$s2aq19==4]<-2
plot(dataset_18$h2q8)
write.dta(dataset_18, "2018_data.dta")

D2018<-read_dta("2018_data.dta")
DATA_new<-read_dta("data_new_2018.dta")


#Removing duplicates
obj_18 <- dplyr::distinct(OBJ, t0_hhid, .keep_all = TRUE)

obj_unique_cleaned_18 <- obj_18[ which(stringr::str_detect(obj_18$t0_hhid,"H")), ]
describe(obj_unique_cleaned_18)
cor(obj_unique_cleaned_18,use="complete.obs")

# multivariate probit analysis
mvprob1<-mvprobit(cbind(s4bq13,s3bq04,s3bq13,s3bq22)~h2q3,h2q8,s4q07,urban,
                  hhsize,lvstck,a2aq1owned,h9q03a__1,h9q12a,s4bq08,Mstatus,
                  literacy,water,central,eastern,Northern,yield,data=obj_unique_cleaned_18,
                  iterlim=1,)

# summary analysis per region
D2018 %>%
  group_by(urban)%>%
  summarize(sum_area=sum(s2aq5,na.rm=TRUE),
            count=n(),
            average_area=mean(s2aq5,na.rm=TRUE))
summary(D2018$s2aq5)
table(D2018$urban)

D2018 %>%
  group_by(Northern)%>%
  summarize(sum_area=sum(s2aq5,na.rm=TRUE),
            count=n(),
            average_area=mean(s2aq5,na.rm=TRUE))

#replacing NAs with mean values of the variable
#in parcel size by overall mean
D2018$s2aq5[which(is.na(D2018$s2aq5))]<-mean(D2018$s2aq5,na.rm = TRUE)

#asset value by mean
D2018$h14q05[which(is.na(D2018$h14q05))]<-mean(D2018$h14q05,na.rm = TRUE)

#output sold
D2018$s5bq08_1[which(is.na(D2018$s5bq08_1))]<-mean(D2018$s5bq08_1,na.rm = TRUE)

#yield
D2018$yield[which(is.na(D2018$yield))]<-mean(D2018$yield,na.rm = TRUE)

#in age
D2018$h2q8[which(is.na(D2018$h2q8))]<-mean(D2018$h2q8,na.rm = TRUE)

#in householdsize
D2018$hhsize[which(is.na(D2018$hhsize))]<-mean(D2018$hhsize,na.rm = TRUE)

#in area planted
D2018$s4bq07[which(is.na(D2018$s4bq07))]<-mean(D2018$s4bq07,na.rm = TRUE)

#in highest education completed
D2018$s4q07[which(is.na(D2018$s4q07))]<-mean(D2018$s4q07,na.rm = TRUE)

#replacing NAs in binary variables with zero
D2018$s3bq13[which(is.na(D2018$s3bq13))]<-0
D2018$s3bq22[which(is.na(D2018$s3bq22))]<-0
D2018$s3bq04[which(is.na(D2018$s3bq04))]<-0
D2018$h9q16a[which(is.na(D2018$h9q16a))]<-0
D2018$h9q15a[which(is.na(D2018$h9q15a))]<-0
D2018$s4bq08[which(is.na(D2018$s4bq08))]<-0
D2018$h9q13a[which(is.na(D2018$h9q13a))]<-0
D2018$h9q14a[which(is.na(D2018$h9q14a))]<-0
D2018$h9q12a[which(is.na(D2018$h9q12a))]<-0
D2018$h9q11a[which(is.na(D2018$h9q11a))]<-0
D2018$h9q03a__1[which(is.na(D2018$h9q03a__1))]<-0
D2018$h2q3[which(is.na(D2018$h2q3))]<-0
D2018$hh_anm[which(is.na(D2018$hh_anm))]<-0
D2018$lvstck[which(is.na(D2018$lvstck))]<-0
D2018$urban[which(is.na(D2018$urban))]<-0
D2018$eastern[which(is.na(D2018$eastern))]<-0
D2018$Northern[which(is.na(D2018$Northern))]<-0
D2018$central[which(is.na(D2018$central))]<-0
D2018$Mstatus[which(is.na(D2018$Mstatus))]<-0
D2018$tenure[which(is.na(D2018$tenure))]<-0
D2018$nonfarm_income[which(is.na(D2018$nonfarm_income))]<-0
D2018$literacy[which(is.na(D2018$literacy))]<-0

DATA_ALL<-select(D2018,t0_hhid,h2q3,h2q8,s4q07,h14q02,h14q05,urban,hhsize,lvstck,hh_anm,a2aq1owned,
                 s2aq5,h9q03a__1,h9q11a,h9q12a,h9q13a,h9q14a,h9q15a,h9q16a,s4bq08,s4bq13,s4bq07,
                 s3bq04,s3bq13,s3bq22,s5bq08_1,s5bq12_1,Mstatus,literacy,water,tenure,nonfarm_income,
                 central,eastern,Northern,yield)
describe(DATA_ALL)
#exclude Nas from use of inorganic fertiliser
DATA_chem<-D2018[! is.na(D2018$s4bq13),]

describe(DATA_chem)
#changing dummy variables to 1 and 0
D2018$s3bq13[D2018$s3bq13=="2"]<-0
D2018$s3bq22[D2018$s3bq22=="2"]<-0
D2018$s3bq04[D2018$s3bq04=="2"]<-0
D2018$h9q16a[D2018$h9q16a=="2"]<-0
D2018$h9q15a[D2018$h9q15a=="2"]<-0
D2018$s4bq08[D2018$s4bq08=="1"]<-0
D2018$s4bq08[D2018$s4bq08=="2"]<-1
D2018$s4bq13[D2018$s4bq13=="1"]<-0
D2018$s4bq13[D2018$s4bq13=="2"]<-1
D2018$h9q13a[D2018$h9q13a=="2"]<-0
D2018$h9q14a[D2018$h9q14a=="2"]<-0
D2018$h9q12a[D2018$h9q12a=="2"]<-0
D2018$h9q11a[D2018$h9q11a=="2"]<-0
D2018$h9q03a__1[D2018$h9q03a__1=="2"]<-0
D2018$h2q3[D2018$h2q3=="2"]<-0
D2018$hh_anm[D2018$hh_anm=="2"]<-0
D2018$lvstck[D2018$lvstck=="2"]<-0
D2018$urban[D2018$urban=="2"]<-0



str(DATA_chem)    
str(dataset_18)
#changing variable to integer
D2018$sex<-as.integer(D2018$h2q3)
D2018$age<-as.integer(D2018$h2q8)
D2018$areaplanted<-as.integer(D2018$s4bq07)
D2018$assetvalue<-as.integer(D2018$h14q05)
D2018$URBAN<-as.integer(D2018$urban)
D2018$householdsize<-as.integer(D2018$hhsize)
D2018$inorgfert<-as.integer(D2018$s3bq13)
D2018$parcelsize<-as.integer(D2018$s2aq5)
D2018$NAADtrain<-as.integer(D2018$h9q12a)
D2018$farmgrp<-as.integer(D2018$h9q14a)
D2018$educ<-as.integer(D2018$s4q07)
D2018$YIELD<-as.integer(D2018$yield)
D2018$typeAsset<-as.integer(D2018$h14q02)
D2018$ownparcel<-as.integer(D2018$a2aq1owned)
D2018$infoagri<-as.integer(D2018$h9q03a__1)
D2018$infoNAAD<-as.integer(D2018$h9q11a)
D2018$participateNAAD<-as.integer(D2018$h9q12a)
D2018$infogrp<-as.integer(D2018$h9q13a)
D2018$membergrp<-as.integer(D2018$h9q14a)
D2018$infoNAADint<-as.integer(D2018$h9q15a)
D2018$participateNAADINT<-as.integer(D2018$h9q16a)
D2018$cropdiverse<-as.integer(D2018$s4bq08)
D2018$orgfert<-as.integer(D2018$s3bq04)
D2018$improvedseed<-as.integer(D2018$s4bq13)
D2018$pesticide<-as.integer(D2018$s3bq22)
D2018$whosold<-as.integer(D2018$s5bq09_1)
D2018$saleharvest<-as.integer(D2018$s5bq14a_2)
D2018$salevalue<-as.integer(D2018$s5bq08_1)
D2018$harvestgive<-as.integer(D2018$s5bq14b_2)
D2018$harvestseed<-as.integer(D2018$s5bq15_2)
D2018$livestock<-as.integer(D2018$lvstck)
D2018$smallanimal<-as.integer(D2018$hh_anm)
D2018$distance<-as.integer(D2018$s2aq6)
VARIABLES_2018<-select(D2018,t0_hhid,sex,age,areaplanted,assetvalue,URBAN,householdsize,
                       inorgfert,parcelsize,NAADtrain,farmgrp,educ,YIELD,typeAsset,
                       ownparcel,infoagri,infoNAAD,participateNAAD,infogrp,membergrp,
                       infoNAADint,participateNAADINT,cropdiverse,orgfert,improvedseed,
                       pesticide,whosold,saleharvest,salevalue,harvestgive,harvestseed,
                       Mstatus,literacy,soiltype,soilqlty,water,hilly,gentleslope,tenure,
                       nonfarm_income,central,eastern,Northern,livestock,smallanimal,distance)


DATA_chem_cleaned <- dplyr::distinct(DATA_chem, t0_hhid, .keep_all = TRUE)

DATA_chem_cleaned_18 <- DATA_chem_cleaned[ which(stringr::str_detect(DATA_chem_cleaned$t0_hhid,"H")), ]


describe(DATA_chem_cleaned_18)




#Installing packages for statistical analysis
install.packages("mvProbit")
install.packages("Hmisc")
library(mvProbit)
library(Hmisc)
library(lmtest)

install.packages("faraway")
install.packages("ivreg")
library(faraway)
library(mvprobit)
library(ivreg)
require(stargazer)
write.dta(VARIABLES_2018, "ALL_2018.dta")
ALL<-read_dta("ALL_2018.dta")
DATA_new<-read_dta("data_new_2018.dta")
DATA_new$t0_hhid<-NAAD$t0_hhid
NAAD<-select(ALL,t0_hhid,participateNAAD,infogrp,infoNAADint,participateNAADINT,infoNAAD,nonfarm_income)
DD2018<-merge(DATA_new,NAAD ,by = "t0_hhid")
data_daa<- na.omit(DD2018)
DATA_use<-data_daa
DD2018_cleaned <- DD2018[ which(stringr::str_detect(DD2018$t0_hhid,"H")), ]
DD2018_cleaned_omit<-na.omit(DD2018_cleaned)
describe(data_daa)
?mvprobit
?ivreg
DATA_use$gender[DATA_use$gender=="2"]<-0
DATA_use$urban[DATA_use$urban=="2"]<-0
DATA_use$lvstck[DATA_use$lvstck=="2"]<-0
DEP<-select(DATA_use,seed,pesticide,organicfert,inorganicfert)
INDEP<-select(DATA_use,age,gender,lvstck,assetvalue,urban,hhsize,cropsystem,yield,
              areafarmed,maritalstatus,education,landown,participateNAAD)
#rounding off values
round(cor(DEP),digits = 2)
round(cor(INDEP),digits = 2)
round(cor(DATA_use),digits = 2)
str(data_daa)

# correlation analysis
rcorr(as.matrix(DATA_use),type="pearson")

cor(DATA_use)
DATA_use$agesq<-DATA_use$age*DATA_use$age
DATA_use$logyield<-log(DATA_use$yield)
write.dta(DATA_use, "DATA_USE.dta")
# Regression alnalysis for all dependent variables

factor<-glm(seed~age+gender+cropsystem+areafarmed+urban
         +inorganicfert+organicfert+infogrp+participateNAAD
         +pesticide+education+hhsize+lvstck+landown, 
         data = DATA_use,family = binomial(link="probit"))
summary(factor)
SLS<-ivreg(seed~gender+age+cropsystem+areafarmed
            +inorganicfert+participateNAAD+organicfert+infogrp
            +pesticide|age+cropsystem+areafarmed
            +inorganicfert+participateNAAD+organicfert+infogrp
            +pesticide+maritalstatus+urban,
            data = DATA_use)
summary(SLS)
summary(SLS,diagnostics = TRUE)
factor1<-glm(inorganicfert~age+gender+cropsystem+areafarmed
             +organicfert+infogrp+participateNAAD
             +pesticide+education+hhsize+lvstck+urban+landown,
            data = DATA_use,family = binomial(link="probit"))
factor2<-glm(organicfert~age+gender+seed+cropsystem+areafarmed
             +inorganicfert+pesticide+infogrp+participateNAAD
             +education+hhsize+lvstck+urban+landown,
             data = DATA_use,family = binomial(link="probit"))
factor3<-glm(pesticide~age+gender+cropsystem+areafarmed
             +inorganicfert+organicfert+infogrp+participateNAAD
             +seed+education+hhsize+lvstck+urban+landown,
             data = DATA_use,family = binomial(link="probit"))
summary(factor)
summary(factor1)
summary(factor2)
summary(factor3)
stargazer(factor, factor1, factor2, factor3, align = TRUE, type = "text")
#comparison using OLS
REG_OLS1<-lm(seed~age+gender+cropsystem+areafarmed
            +inorganicfert+organicfert+infogrp+participateNAAD
            +pesticide+education+hhsize+lvstck+landown, 
            data = DATA_use)
summary(factor)

REG_OLS2<-lm(inorganicfert~age+gender+cropsystem+areafarmed
             +organicfert+infogrp+participateNAAD
             +pesticide+education+hhsize+lvstck+landown,
             data = DATA_use)
REG_OLS3<-lm(organicfert~age+gender+seed+cropsystem+areafarmed
             +inorganicfert+pesticide+infogrp+participateNAAD
             +education+hhsize+lvstck+landown,
             data = DATA_use)
REG_OLS4<-lm(pesticide~age+gender+cropsystem+areafarmed
             +inorganicfert+organicfert+infogrp+participateNAAD
             +seed+education+hhsize+lvstck+landown,
             data = DATA_use)
REG_OLS5<-lm(participateNAAD~age+gender+cropsystem+areafarmed+infogrp+education+hhsize+lvstck+landown,
          data = DATA_use)
stargazer(REG_OLS1,factor, align = TRUE, type = "text")
stargazer(REG_OLS2,factor1, align = TRUE, type = "text")
#obtaining residual
DATA_use$resid_seed_probit<-resid(factor)
DATA_use$resid_inorganicfert_probit<-resid(factor1)
DATA_use$resid_organic_probit<-resid(factor2)
DATA_use$resid_pesticide_probit<-resid(factor3)

Resid_All<-select(DATA_use,resid_seed,resid_inorganicfert,resid_organic,resid_pesticide)
rcorr(as.matrix(Resid_All),type="pearson")

#test for multicollinearity
vif(factor)
vif(factor1)
vif(factor2)
vif(factor3)
bptest(factor)
test<-glm(seed~participateNAAD+infogrp,data = DATA_use,family = binomial(link="probit"))

cor(DATA_use$maritalstatus,DATA_use$gender)

?mvProbit
cor(DATA_use$age,DATA_use$yield)
objectives1<-mvProbit(cbind(seed,organicfert,inorganicfert,pesticide)~age+gender+cropsystem+areafarmed
                      +yield+urban++participateNAAD+infogrp
                      ,data = (DATA_use),iterlim=1,nGHK = 1022)
summary(objectives1)


describe(DATA_use)

#propensity score matching
# Create smoker status factor variable for plotting
DATA_use$participateNAAD.factor <- factor(DATA_use$participateNAAD, labels = c("Non-participate","participate"))

REG1<-glm(participateNAAD~age+gender+cropsystem+areafarmed+infogrp+education+hhsize+lvstck+landown,
          family = binomial (link = "probit"),
          data = DATA_use)

summary(REG1)
DATA_use$pscore <- fitted (REG1)
ggplot(DATA_use, aes(x=pscore))+
  geom_histogram(aes(color=participateNAAD,fill=participateNAAD.factor),
                 position="identity",bins =20)+
  ggtitle("Histogram of PS by treatment")


ggplot(DATA_use, aes(x=pscore))+
  geom_density(aes( fill=participateNAAD.factor, alpha=0.8))+
  ggtitle("Density of PS by treatment")

m.out <-matchit(participateNAAD~age+gender+cropsystem+areafarmed+infogrp+education+hhsize+lvstck+landown,
                data=DATA_use)
baltab <- bal.tab(m.out, un = TRUE, disp.v.ratio = TRUE)
baltab

love.plot(baltab, stat = "mean.diffs", threshold = 0.05, stars = "raw") # Shows stars for unstardardized (binary) variables
love.plot(baltab, stat = "variance.ratios", threshold = 0.05, stars = "raw")

matched_data <- match.data(m.out)
REG2<-lm(yield~participateNAAD, data=matched_data)
REG3<-lm(yield~participateNAAD+age+gender+cropsystem+areafarmed+infogrp+education+hhsize+lvstck+landown,, data=matched_data, weights = matched_data$weights )
summary(REG3)
REG4<-lm(yield~participateNAAD, data=DATA_use)
REG5<-lm(yield~participateNAAD+age+gender+cropsystem+areafarmed+infogrp+education+hhsize+lvstck+landown,, data=DATA_use )
summary(REG5)
vif(REG3)
stargazer(REG2,REG3, align = TRUE, type = "text")
table(DATA_use$seed)
table(DATA_use$organicfert)
table(DATA_use$inorganicfert)
table(DATA_use$pesticide)

#estimating effect on yield using fitted value from the probit regression

DATA_use$fitted_seed_probit<-fitted(factor)
DATA_use$fitted_inorganicfert_probit<-fitted(factor1)
DATA_use$fitted_organicfert_probit<-fitted(factor2)
DATA_use$fitted_pesticide_probit<-fitted(factor3)
DATA_use$fitted_NAAD_probit<-fitted(REG1)

#fitted value from OLS
DATA_use$fitted_seed_OLS<-fitted(REG_OLS1)
DATA_use$fitted_inorganicfert_OLS<-fitted(REG_OLS2)
DATA_use$fitted_organicfert_OLS<-fitted(REG_OLS3)
DATA_use$fitted_pesticide_OLS<-fitted(REG_OLS4)
DATA_use$fitted_NAAD_OLS<-fitted(REG_OLS5)

Reg_yield<-lm(yield~fitted_seed_OLS+fitted_inorganicfert_OLS+fitted_organicfert_OLS+fitted_pesticide_OLS+
                fitted_NAAD_OLS, data=DATA_use)
summary(Reg_yield)
Reg_yield2<-lm(yield~fitted_NAAD_OLS+fitted_inorganicfert_OLS+fitted_organicfert_OLS+fitted_pesticide_OLS+fitted_seed_OLS+
                 age+gender+cropsystem+areafarmed+infogrp+
                 education+hhsize+lvstck+landown, data=DATA_use)
summary(Reg_yield2)

Reg_yield3<-lm(yield~participateNAAD+fitted_inorganicfert_OLS+fitted_organicfert_OLS+fitted_pesticide_OLS+fitted_seed_OLS, data=DATA_use)
summary(Reg_yield3)

vif(Reg_yield)
stargazer(Reg_yield,Reg_yield2,Reg_yield3, align = TRUE, type = "text")

#estimating impact of NAAD on technology adoption
DATA_use$tech4<-DATA_use$seed*DATA_use$inorganic*DATA_use$organic*DATA_use$pesticide

table(DATA_use$tech4)

#estimating impact of NAAD on asset value
Reg_asset<-lm(assetvalue~fitted_seed_OLS+fitted_inorganicfert_OLS+fitted_organicfert_OLS+fitted_pesticide_OLS+
                fitted_NAAD_OLS, data=DATA_use)
summary(Reg_asset)
Reg_asset2<-lm(assetvalue~participateNAAD+fitted_seed_OLS+fitted_inorganicfert_OLS+fitted_organicfert_OLS+fitted_pesticide_OLS, 
               data = DATA_use)
summary(Reg_asset2)

Reg_asset3<-lm(assetvalue~participateNAAD+age+gender+cropsystem+areafarmed+infogrp+
                 fitted_seed_OLS+fitted_inorganicfert_OLS+fitted_organicfert_OLS+fitted_pesticide_OLS+
                 education+hhsize+lvstck+landown, data=DATA_use)
stargazer(Reg_asset,Reg_asset2,Reg_asset3, align = TRUE, type = "text")

#Adding consumption dataset to the variables
consumption<-read_dta("GSEC15B.dta")
summary(consumption)
HH18<-read_dta("AGSEC1.dta")
CONSUME_ONLY<-select(consumption,hhid,CEB07,CEB09,CEB11,CEB013)
CONSUME_ONLY$value_consume_home<-CONSUME_ONLY$CEB07
CONSUME_ONLY$value_consume_awayhome<-CONSUME_ONLY$CEB09
CONSUME_ONLY$value_consume_homeproduce<-CONSUME_ONLY$CEB11
CONSUME_ONLY$value_consume_kind<-CONSUME_ONLY$CEB013


CONSUME_ONLY$value_consume_home[which(is.na(CONSUME_ONLY$value_consume_home))]<-0
CONSUME_ONLY$value_consume_awayhome[which(is.na(CONSUME_ONLY$value_consume_awayhome))]<-0
CONSUME_ONLY$value_consume_homeproduce[which(is.na(CONSUME_ONLY$value_consume_homeproduce))]<-0
CONSUME_ONLY$value_consume_kind[which(is.na(CONSUME_ONLY$value_consume_kind))]<-0
CONSUME_ONLY$consume_all<-CONSUME_ONLY$value_consume_home+CONSUME_ONLY$value_consume_awayhome+CONSUME_ONLY$value_consume_homeproduce+CONSUME_ONLY$value_consume_kind
combine<-merge(CONSUME_ONLY,HH18, by="hhid")
Yewo<-select(combine,hhid,t0_hhid,CEB07,CEB09)
consumption_variable<-select(combine,hhid,t0_hhid,consume_all,CEB07,CEB09 )
consumption_variable$conko<-consumption_variable$consume_all

Yewo<-select(consumption_variable,hhid,t0_hhid,conko,CEB07,CEB09)
write.dta(Yewo, "conko.dta")
summary(consumption_variables)
consumption_variable$consume_all<-as.integer(consumption_variable$consume_all)
consumption_variable$t0_hhid<-as.integer(consumption_variable$t0_hhid)
# extract data into stata
write.dta(consumption_variable, "CONSUMPTION.dta")
write.dta(DATA_use, "DATASET_USE.dta")
summary(DD2018$yield)
summary(DATA_use$yield)
summary(DATA_new$yield)

#asset data
ASSET_data<-read_dta("GSEC14.dta")
Asset_ONLY<-select(ASSET_data,hhid,h14q05)
combine_asset<-combine<-merge(Asset_ONLY,HH18, by="hhid")
combine_asset$ASSET_ALL<-combine_asset$h14q05
ASSET<-select(combine_asset,t0_hhid,ASSET_ALL)
write.dta(ASSET, "ASSET_VALUE.dta")

#ALL DATA FOR ANALYSIS
DATA<-read_dta("DATASET_USE.dta")
Reg1<-lm(logyield~xb1+xb2+xb3+xb4+xb5+hhsize+landown+gender+logareafarmed
         +cropsystem+education, data=DATA)
summary(Reg1)
vif(Reg1)
Reg2<-lm(logyield~hhsize+landown+gender+logareafarmed
         +cropsystem+education+seed_resid+inorganicfert_resid+
           organicfert_resid+pesticide_resid+participateNAAD_resid, data=DATA)
summary(Reg2)

Reg_asset<-lm(assetvalue_USD~xb1+xb2+xb3+xb4+xb5+hhsize+landown+gender+logareafarmed
         +cropsystem+education, data=DATA)
summary(Reg_asset)
vif(Reg_asset)
Reg_asset1<-lm(assetvalue_USD~xb1+xb5+hhsize+landown+logareafarmed
              +education, data=DATA)
summary(Reg_asset1)
eg_asset_DWH<-lm(assetvalue_USD~seed_resid+participateNAAD_resid+hhsize+landown+logareafarmed
                  +education+urban+age, data=DATA)
summary(Reg_asset_DWH)

Reg_consume<-lm(perconsume_USD~xb1+xb2+xb3+xb4+xb5+hhsize+landown+gender+logareafarmed
              +cropsystem+education, data=DATA)
summary(Reg_consume)
vif(Reg_consume)
DATA<-read_dta("DATASET_USE.dta")
dtanikan<-select(DATA2,gender,age,urban,lvstck,cropsystem,areafarmed,yield,
                 landown,education,seed,inorganicfert,organicfert,pesticide,participateNAAD,
                 infogrp,logyield,logareafarmed,extension,logasset_value)
cor(dtanikan)
str(dtanikan)
DATA2<-read_dta("dataset_asset.dta")
DATA2<-read_dta("dATA_NEW.dta")
Reg_yiedl<-lm(logyield~seed+inorganicfert+organicfert+pesticide+participateNAAD+landown+logareafarmed
              +cropsystem, data=DATA2)
Reg_yield2<-lm(logyield~xb1+xb2+xb3+xb4+xb5+landown+logareafarmed
              +cropsystem, data=DATA2)
summary(Reg_yield2)

vif(Reg_yield2)
describe(DATA2$logyield)
describe(DATA2$logasset_value)
describe(DATA2$logareafarmed)

stargazer(Reg_yiedl,Reg_yield2, align = TRUE, type = "text")
describe(dtanikan)
describe(DATA2$ASSET_ALL)
describe(DATA2$seed)
table(DATA2$seed)
 