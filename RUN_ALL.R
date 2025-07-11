# RUN_ALL.R
# Master script to run the entire analysis pipeline for the Biostat Journey project.

# --- 1. SETUP ---
# Clear environment to ensure a fresh run
rm(list = ls())

# Load all necessary libraries for the entire project
print("Loading libraries...")
library(tidyverse)
library(gtsummary)
library(gt) # Needed for gtsave()

# --- 2. EXECUTE PIPELINE ---
print("--- STARTING ANALYSIS PIPELINE ---")

# Source each script in the correct order
source("02_scripts/01_load_data.R")
source("02_scripts/02_make_table1.R")
source("02_scripts/03_make_plot.R")

# --- 3. FINISH ---
print("--- ANALYSIS PIPELINE COMPLETE ---")
print("Check the '04_results' folder for output.")