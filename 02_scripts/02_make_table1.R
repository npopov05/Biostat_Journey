# 02_make_table1.R
# This script creates and saves the demographic table.
# It assumes 'gtsummary' is loaded and 'starwars_data' exists.

print("Step 2: Creating Table 1...")

table1 <- starwars_data |>
  select(species, mass, height, sex) |>
  tbl_summary(
    by = sex,
    missing = "no" # Don't show missing counts
  ) |>
  add_overall() |>
  add_p()

# Save the table using the gtsummary::as_gt() and gt::gtsave() functions
# Ensure the '04_results/tables' folder exists
if (!dir.exists("04_results/tables")) dir.create("04_results/tables", recursive = TRUE)

gt::gtsave(gtsummary::as_gt(table1), "04_results/tables/table1_demographics.html")

print("Table 1 saved.")