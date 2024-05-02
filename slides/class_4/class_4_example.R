# quant_plc_class_4.R
# lasted updated 2024-05-01 by Krista Kaput

# load -----

library(tidyverse)
library(readxl)
library(dplyr)

# load in the raw IDEA Section 611 data 
section_611_raw <- read_excel("slides/class_4/IDEA Part B FY 2011 to FY 2022 .xlsx", 
                              sheet = "Grants to States")

# load in the 2023 Minnesota graduation rate data 
mn_graduation_fy23_raw <- read_excel("slides/class_4/2023 Graduation Indicators.xlsx", 
                           sheet = "District", skip = 4)

# Use pivot_longer() function with the special education 611 funding data -------

section_611_longer <- section_611_raw |>
  # Makes all the letters in a column lowercase
  rename_with(tolower) |>
  # select the variables we want to do in the analysis 
  select(state, fy2016, fy2017, fy2018, fy2019, fy2020, fy2021, fy2022) |>
  pivot_longer(cols = starts_with("fy"), # The columns start with "fy"
               names_to = "fiscal_year", # the names of the columns will become a value in the "fiscal_year" column
               values_to = "idea_funding") |> # The values in the "fy" columns will be in the new column "idea_funding"
  # Use the gsub to remove the "fy" from the fiscal years so that the values are just the year
  mutate(fiscal_year = as.numeric(gsub("^fy", "", fiscal_year))) |>
  mutate(idea_category = "Part B, Grants to States")

# Use pivot_wider() function with the 2023 graduation rate data -----

mn_graduation_fy23_wider <- mn_graduation_fy23_raw |>
  # Makes all the letters in a column lowercase
  rename_with(tolower) |>
  # rename the columns so there isn't a space in-between the words
  rename(district = "district name",
         dist_id = "district number",
         dist_type = "district type",
         group_category = "group category",
         student_group = "student group",
         ending_status = "ending status",
         four_yr_grad_pct = "four year percent") |>
  # Select the columns we want to include in our dataframe for the pivot_wider
  select(district, dist_id, dist_type, group_category, student_group, ending_status, four_yr_grad_pct) |>
  # filter so that we are only looking at students who graduated in four years
  filter(ending_status == "Graduate") |>
  # filter the student demographics because we only want to look at race/ethnicity data
  filter(group_category == "Race/Ethnicity") |>
  # Pivot_wider! 
  pivot_wider(names_from = "student_group", # The names of the columns are from the student group column values
              values_from = "four_yr_grad_pct") |> # The four_yr_grad_pct values are the four-year graduation rates 
  # These categories are capitalized and have spaces, so we rename them!
  rename_with(tolower) |>
  rename(white_grad_pct = "white students",
         indigenous_grad_pct = "american indian students",
         asian_grad_pct = "asian students",
         black_grad_pct = "black or african american students",
         latino_grad_pct = "hispanic or latino students",
         multiracial_grad_pct = "two or more races students") |>
  mutate(year = "2023")


# Use left_join() function to join the MCA scores data with the 2023 graduation rate data 
  

# Export the data -------


# Tidy workplace ------

# This will remove extra dataframes from your environment to keep it tidy 
rm(section_611_raw)
