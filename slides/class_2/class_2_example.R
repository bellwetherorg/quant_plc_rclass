# class_2_example 
# Last updated by Krista Kaput, 2024-03-29

# load ----------

options(scipen = 999)

library(tidyverse)
library(edbuildr)

# Krista likes to denote which spreadsheet is raw for transparency 
dist_fy19_raw <- masterpull(data_type = "geo")

# Use the "filter" function to get the Minnesota data -----------

mn_ed_data <- dist_fy19_raw |>
  filter(State == "Minnesota") 

# Use "rename" function to change names of Minnesota variables --------

mn_ed_data <- mn_ed_data |>
  rename(district = NAME,
         county = County,
         enroll = ENROLL, 
         total_local_rev = LR) 


# Use "mutate" function to create a local revenue pp variable -----
mn_ed_data <- mn_ed_data |>
  mutate(local_rev_pp = total_local_rev/enroll) 

# Filter the districts that do not have enrollment or have NA enrollment ------

mn_ed_data_clean <- mn_ed_data |>
  filter(enroll > 0)

# Use "select" function to choose the variables you want in your data frame ---------

mn_ed_data_clean <- mn_ed_data_clean |>
  select(district, county, enroll, total_local_rev, local_rev_pp)

# We can "chain" these functions together using the pipe operator -------

mn_ed_data_one_function <- dist_fy19_raw |>
  filter(State == "Minnesota") |>
  rename(district = NAME,
         county = County,
         enroll = ENROLL, 
         total_local_rev = LR) |>
  mutate(local_rev_pp = total_local_rev/enroll) |>
  filter(enroll > 0) |>
  select(district, county, enroll, total_local_rev, local_rev_pp)










