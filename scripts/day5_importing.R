library(tidyverse)
# Load the built-in dataset into a variable
starwars_data <- starwars

# Explore it
View(starwars_data)
glimpse(starwars_data)

# Save the starwars data to a CSV in our data sub-folder
write_csv(starwars_data, "data/starwars_raw_data.csv")

# You can clear your environment by clicking the little broom icon
# in the Environment pane (top-right).

# Now, read the file back in using the relative path
my_sw_data <- read_csv("data/starwars_raw_data.csv")

# Check if it worked
glimpse(my_sw_data)

write_csv(
  # The first argument to write_csv is the data to be written.
  # You are creating this data on the fly with a dplyr pipeline.
  my_sw_data |>
    filter(!is.na(height), !is.na(mass)) |>
    group_by(species) |>
    summarise(
      number_of_characters = n_distinct(name),
      average_height = mean(height),
      average_mass = mean(mass)
    ) |>
    filter(number_of_characters > 1),
  
  # The second argument is the file path.
  "results/species_summary.csv"
  )
    