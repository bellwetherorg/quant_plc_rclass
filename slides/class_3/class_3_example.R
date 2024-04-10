# class_3_example 
# Last updated by Krista Kaput, 2024-04-10

# Load ----------

# When we are printing out numbers that it isn't using scientific notation 
options(scipen = 999)

library(tidyverse)
library(edbuildr)

# Krista likes to denote which spreadsheet is raw for transparency 
dist_fy19_raw <- masterpull(data_type = "geo")

# Filter Minnesota data and clean -----

# filter, rename, and mutate data for Minnesota 
mn_ed_data <- dist_fy19_raw |>
  # filter function is used to choose all rows (districts) for Minnesota 
  filter(State == "Minnesota") |>
  # rename function is used to rename variables. The renamed variable is on the left
  # and the variable we are renaming is on the right 
  rename(district = NAME,
         county = County,
         enroll = ENROLL, 
         total_local_rev = LR,
         total_state_rev = SR,
         total_state_local_rev = SLR, 
         urbanicity = dUrbanicity,
         operational_schools = dOperational_schools, 
         district_type = dType, 
         white_enroll = dWhite, 
         sped_enroll = dIEP, 
         ell_enroll = dLEP, 
         econ_dis_enroll = StPov,
         bipoc_pct = pctNonwhite, 
         pov_pct = StPovRate,
         median_house_income = MHI, 
         median_prop_value = MPV) |>
  # The mutate functions creates new variables 
  mutate(bipoc_enroll = enroll - white_enroll,
         ell_pct = ell_enroll/enroll, 
         sped_pct = sped_enroll/enroll, 
         local_rev_pp = total_local_rev/enroll,
         state_rev_pp = total_state_rev/enroll,
         local_state_rev_pp = total_state_local_rev/enroll) |>
  # The select function chooses the columns that will be in our new dataframe 
  select(district, county, enroll, local_rev_pp, state_rev_pp, local_state_rev_pp, 
         total_local_rev, total_state_rev, total_state_local_rev, urbanicity, 
         operational_schools, district_type, pov_pct, bipoc_pct, ell_pct, sped_pct)


# Step #1: Create a basic scatter plot for Minnesota ----------
ggplot(mn_ed_data, aes(x = pov_pct, y = local_rev_pp)) +
  geom_point()


















