library(tidyverse)

# Use the mtcars dataset and make 'cyl' a factor
cars_data <- as_tibble(mtcars) |>
  mutate(cyl = factor(cyl))
ggplot(cars_data, aes(x = hp, y = mpg, color = cyl)) +
  geom_point()

p1 <- ggplot(cars_data, aes(x = hp, y = mpg, color = cyl)) +
  geom_point(size = 2.5, alpha = 0.8) + # Make points bigger and slightly transparent
  labs(
    title = "Higher Horsepower is Associated with Lower Fuel Efficiency",
    subtitle = "Relationship between Gross Horsepower and Miles per Gallon (MPG)",
    x = "Gross Horsepower (hp)",
    y = "Miles Per Gallon (MPG)",
    color = "Number of \nCylinders" # Use \n for a line break in the legend title
  )

p1

p2 <- p1 +
  scale_color_brewer(palette = "Set1") + # Use a colorblind-friendly palette
  theme_minimal(base_size = 14) # Use a minimal theme with a larger base font size

p2

library(ggsurvfit)
library(survival) # We still need this for the survfit object
lung_clean <- lung |>
  mutate(
    status_event = if_else(status == 2, 1, 0),
    sex_factor = factor(sex, levels = c(1, 2), labels = c("Male", "Female"))
  )
km_fit_sex <- survfit(Surv(time, status_event) ~ sex_factor, data = lung_clean)
p_km1 <- ggsurvfit(km_fit_sex) +
  labs(
    title = "Survival of Lung Cancer Patients by Sex",
    x = "Time in Days",
    y = "Survival Probability"
  )

p_km1

library(survival)
library(tidyverse)
library(survminer)

# The final, publication-quality plot
p_km_final <- ggsurvfit(km_fit_sex, size = 1) + # Make survival lines thicker
  add_confidence_interval() +
  add_risk_table(
    risk.table.title = "Number of patients at risk",
    risk.table.y.text = FALSE, # Remove the y-axis tick labels on the risk table
    size = 4 # Font size for risk table
  ) +
  scale_color_manual(values = c("Male" = "#0072B2", "Female" = "#D55E00")) + # Custom, colorblind-friendly colors
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) + # Format y-axis as percentage
  labs(
    title = "Female Patients Show Significantly Improved Survival",
    subtitle = "Kaplan-Meier estimate for the NCCTG Lung Cancer cohort",
    x = "Time in Days",
    y = "Overall Survival Probability"
  ) +
  theme_classic(base_size = 14) +
  theme(
    legend.title = element_blank(), # Remove the legend title
    legend.position = "top" # Move legend to the top
  )

p_km_final