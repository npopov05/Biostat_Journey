# 01_load_data.R
# This script loads and cleans the Star Wars data.
# It assumes 'tidyverse' is already loaded.

print("Step 1: Loading and preparing data...")

# Use the starwars dataset included with dplyr
starwars_data <- starwars |>
  filter(!is.na(mass), !is.na(height)) # Example cleaning

print("Data loading complete.")