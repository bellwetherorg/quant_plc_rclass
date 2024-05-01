# quant_plc_class_4.R
# lasted updated 2024-05-01 by Krista Kaput

# load -----

library(tidyverse)
library(readxl)
library(dplyr)

section_611_raw <- read_excel("slides/class_4/IDEA Part B FY 2011 to FY 2022 .xlsx", 
                              sheet = "Grants to States")

# clean the special education data -----

section_611_clean <- section_611_raw |>
  # Makes all the letters in a column lowercase
  rename_with(tolower) |>
  select(state, fy2016, fy2017, fy2018, fy2019, fy2020, fy2021, fy2022) |>
  pivot_longer(cols = starts_with("fy"), 
               names_to = "fiscal_year", 
               values_to = "idea_funding") |>
  # Use the gsub that's part of mutate to remove the "fy" from the fiscal years
  mutate(fiscal_year = as.numeric(gsub("^fy", "", fiscal_year))) |>
  mutate(idea_category = "Part B, Grants to States")
