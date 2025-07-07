# Install the package once
install.packages("gtsummary")

library(gtsummary)
library(tidyverse)

# Load the sample data
data(trial)

# Let's select a few key variables for our Table 1
table1_data <- trial |>
  select(trt, age, grade, response, marker)

glimpse(table1_data)

# Create a basic summary table
table1 <- tbl_summary(table1_data)

# Print the table to the viewer
table1

# Create a summary table, stratifying by the 'trt' column
table1_by_group <- tbl_summary(
  table1_data,
  by = trt  # This is the key argument
)

table1_by_group

# Add a column for p-values to compare groups
table1_by_group_with_p <- tbl_summary(
  table1_data,
  by = trt
) |>
  add_p() # Pipe the result to the add_p() function

table1_by_group_with_p

table1_customized <- tbl_summary(
  table1_data,
  by = trt,
  label = list( # Use a list to provide new, clean labels for variables
    age ~ "Patient Age (years)",
    grade ~ "Tumor Grade"
  )
) |>
  add_p() |>
  modify_header(label ~ "**Characteristic**") |> # Change the header for the label column
  modify_spanning_header(all_stat_cols() ~ "**Treatment Group**") # Add a spanning header

table1_customized

table1_final <- tbl_summary(
  table1_data,
  by = trt,
  label = list(age ~ "Patient Age", marker ~ "Marker Level (ng/mL)"),
  
  # The 'statistic' argument is where we specify the exact stats to show
  statistic = list(
    all_continuous() ~ "{mean} ({sd})", # The default
    all_categorical() ~ "{n} / {N} ({p}%)" # Show n, N, and percent
  ),
  
  # The 'digits' argument controls decimal places
  digits = list(
    all_continuous() ~ 1 # Show 1 decimal place for continuous variables
  )
) |>
  add_p() |>
  modify_header(label ~ "**Characteristic**") |>
  add_overall() # Add a "Total" column, just like our shell!

table1_final

#Mini-project
table1_project <- tbl_summary(
  table1_data,
  by = trt,
  label = list(age ~ "Patient Age", marker ~ "Marker Level (ng/mL)"),
  
  # The 'statistic' argument is where we specify the exact stats to show
  statistic = list(
    all_continuous() ~ c("{N_nonmiss}", # N non-missing
                        "{mean} ({sd})"
                        )
    all_categorical() ~ "{n} / {N} ({p}%)" # Show n, N, and percent
  ),
  
  # The 'digits' argument controls decimal places
  digits = list(
    all_continuous() ~ 1 # Show 1 decimal place for continuous variables
  )
) |>
  add_p() |>
  modify_header(label ~ "**Characteristic**") |>
  add_overall() # Add a "Total" column, just like our shell!

table1_project