# 03_make_plot.R
# This script creates and saves a plot.
# It assumes 'ggplot2' is loaded and 'starwars_data' exists.

print("Step 3: Creating plot...")

my_plot <- ggplot(starwars_data, aes(x = mass, y = height, color = gender)) +
  geom_point() +
  theme_minimal() +
  labs(title = "Mass vs. Height by Gender in Star Wars")

# Ensure the '04_results/figures' folder exists
if (!dir.exists("04_results/figures")) dir.create("04_results/figures", recursive = TRUE)

ggsave("04_results/figures/mass_vs_height.png", plot = my_plot)

print("Plot saved.")