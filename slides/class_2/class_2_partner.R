# class_2_partner_assignment
# Last updated by Krista Kaput, 2024-03-29

# instructions -------

# You will need to use "rename" function to rename the following variables  
# - state
# - district_id
# - sr (state revenue)
# - total_enroll (dEnroll_district)
# - white_enroll 
# - black_enroll 
# - asian_enroll
# - multiracial_enroll
# - latino_enroll 
# - indigenous_enroll
# - mhi (median household income)
# - mpv (median property value)
# - stpov (student poverty)
# - stpop (student population)

# You will need to use "mutate" to create the following variables 

# - state_rev_pp (per-pupil state revenue)
# - indigenous_pct (percent Indigenous students)
# - black_pct (percent Black students)
# - asian_pct (percent Asian students)
# - multiracial_pct (percent Multiracial students)
# - latino_pct (percent Latino students)
# - white_pct (percent white students)
# - stpov_pct (student poverty rate)

# You will need to use "select" to select all of the variables you want in your final data frame 

# You will need to use "filter" to selct your state and to get rid of districts with no enrollment 

# When you are done, make sure you push the updates so the repository so Krista can check your work! 


# load ----------

options(scipen = 999)

library(tidyverse)
library(edbuildr)

# load in the raw fy19 district data 
dist_fy19_raw <- masterpull(data_type = "geo")


# Use the "filter" function to get your state's data -----------


# Use "rename" function to change names of your state's variables --------


# Use "mutate" function to create variables for your state -----


# Use "select" function to choose the variables you want in your data frame ---------


# Use the "filter" function to get rid of the districts that don't have any enrollment -----------







