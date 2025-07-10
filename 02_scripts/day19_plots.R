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
# --- Prepare Data (same as before) ---
lung_clean <- lung |>
  mutate(
    status_event = if_else(status == 2, 1, 0),
    sex_factor = factor(sex, levels = c(1, 2), labels = c("Male", "Female"))
  )

# --- Fit the model (same as before) ---
km_fit_sex <- survfit(Surv(time, status_event) ~ sex_factor, data = lung_clean)


# --- Create the plot using survminer's ggsurvplot() ---
p_km_final <- ggsurvplot(
  km_fit_sex,
  data = lung_clean,
  
  # --- Plot Customization ---
  pwal = TRUE,                      # Add log-rank p-value to the plot
  conf.int = TRUE,                  # Add confidence intervals
  risk.table = TRUE,                # Add the risk table
  risk.table.col = "strata",        # Color the risk table rows by group
  risk.table.y.text = FALSE,        # Don't show y-axis text on risk table
  
  # --- Aesthetics ---
  palette = c("#0072B2", "#D55E00"), # Custom colors
  size = 1,                         # Line size
  
  # --- Labels ---
  title = "Female Patients Show Significantly Improved Survival",
  subtitle = "Kaplan-Meier estimate for the NCCTG Lung Cancer cohort",
  xlab = "Time in Days",
  ylab = "Overall Survival Probability",
  legend.title = "",                # Remove legend title
  legend.labs = c("Male", "Female") # Set legend labels
)

# Print the plot object
print(p_km_final)