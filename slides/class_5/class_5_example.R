# class_5_example 
# lasted updated 2024-05-22 by Krista Kaput

# load -----

library(tidyverse)
library(readxl)
library(dplyr)
library(edbuildr)

options(scipen = 999)

# load in the Minnesota 2022 MCA Reading data 

mn_mca_frpl_district_fy22_raw <- read_excel("slides/class_5/2022 MCA FRPL MN.xlsx", 
                                    skip = 1)

# load in the Minnesota free and reduced price (FRPL) count 

mn_frpl_district_raw <- read_csv("slides/class_5/SchoolDistrictsFreeReducedPriceLunchEligibility2017to18.csv")

# clean the MCA data ------

mn_mca_frpl_district_fy22 <- mn_mca_frpl_district_fy22_raw |>
  rename_with(tolower) |> # This makes all of the column names lower cased
  filter(grade == 0) |>
  rename(dist_number = "district number",
         dist_type = "district type",
         district = "district name",
         total_tested = "total tested",
         does_not_meet_count = "count level d",
         partially_meets_count = "count level p",
         meets_count = "count level m",
         exceeds_count = "count level e") |>
  select(dist_number, dist_type, district, total_tested, does_not_meet_count,
         partially_meets_count, meets_count, exceeds_count)


# Clean the district FRPL data ------

mn_frpl_district_clean <- mn_frpl_district_raw |>
  rename_with(tolower) |>
  rename(dist_id = "districtnum",
         district = schooldistrict,
         total_enroll = totalstudents, 
         free_lunch_count = freeelignum,
         reduced_lunch_count = reduceelignum, 
         frpl_count = totalelignum) |>
  select(dist_id, district, total_enroll, free_lunch_count, reduced_lunch_count,
         frpl_count)

# Create the unique identifier -----

# Create a unique identifer with paste0
mn_mca_frpl_district_fy22_clean <- mn_mca_frpl_district_fy22 |>
  # This tells us that we want the number to have 4 values 
  mutate(dist_number = str_pad(dist_number, width = 4, pad = "0"),
         dist_id = paste0(dist_type, dist_number))

# Another way to do this is with paste

mn_mca_frpl_district_fy22_other <- mn_mca_frpl_district_fy22 |>
  # This tells us that we want the number to have 4 values 
  mutate(dist_number = str_pad(dist_number, width = 4, pad = "0"),
         dist_id = paste(dist_type, dist_number, sep = ""))

# We know that we need 


# Tidy workd space -----

rm(mn_mca_frpl_district_fy22_raw, mn_frpl_district_raw)





