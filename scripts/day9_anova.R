library(tidyverse)
set.seed(123)

placebo_scores <- rnorm(n = 10, mean = 25, sd = 5)
low_dose_scores <- rnorm(n = 10, mean = 20, sd = 5)
high_dose_scores <- rnorm(n = 10, mean = 18, sd = 5)

# Combine into a single tibble
depression_data <- tibble(
  group = c(rep("Placebo", 10), rep("Low Dose", 10), rep("High Dose", 10)),
  score = c(placebo_scores, low_dose_scores, high_dose_scores)
)

# It's good practice to make the group column a "factor"
depression_data$group <- factor(depression_data$group, levels = c("Placebo", "Low Dose", "High Dose"))

ggplot(depression_data, aes(x = group, y = score, fill = group)) +
  geom_boxplot() +
  labs(title = "Depression Scores by Treatment Group")

anova_result <- aov(score ~ group, data = depression_data)

# Look at the summary table
summary(anova_result)

tukey_result <- TukeyHSD(anova_result)

print(tukey_result)

plot(tukey_result)

# Task
# Simulate the data. Assume Control mean height is 20cm, 
# Fert A is 25cm, and 
# Fert B is 27cm. Use a standard deviation of 4 for all
control <- rnorm(n=15, mean = 20, sd= 4)
fert_a <- rnorm(n=15, mean = 25, sd= 4)
fert_b <- rnorm(n=15, mean = 27, sd= 4)
# Put the data into a long-format tibble.
fertilazer_data <- tibble(
  group = c(rep("Control", 15), rep("Fert_A", 15), rep("Fert_B", 15)),
  score = c(control, fert_a, fert_b)
)
fertilazer_data$group <- factor(fertilazer_data$group, levels = c("Control", "Fert_A", "Fert_B"))
# Run an ANOVA. Does it show a significant overall effect?
anova_result <- aov(score ~ group, data = fertilazer_data)
summary(anova_result)
# If yes, run a Tukey HSD test and state which specific groups are significantly
# different from each other.
tukey_result <- TukeyHSD(anova_result)
print(tukey_result)
plot(tukey_result)
