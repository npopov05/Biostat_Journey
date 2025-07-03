library(tidyverse)
# d for density
dnorm(x = 175, mean = 175, sd = 7)

# p for probability
pnorm(q = 168, mean = 175, sd = 7) 

# q for quantile
qnorm(p = 0.90, mean = 175, sd = 7)

# r for random
simulated_heights <- rnorm(n = 100, mean = 175, sd = 7)

# Convert our vector to a tibble for ggplot
height_df <- tibble(height = simulated_heights)

height_df |>
  ggplot(aes(x = height)) +
  geom_histogram(aes(y = ..density..), binwidth = 5, fill = "lightblue", color = "black") +
  stat_function(fun = dnorm, args = list(mean = 175, sd = 7), color = "red", size = 1) +
  labs(title = "Histogram of Simulated Heights with True Normal Curve")

#The Binomial Distribution
# d for density
dbinom(x = 5, size = 20, prob = 0.3)
# p for probability
pbinom(q = 5, size = 20, prob = 0.3)

# r for random
side_effect_counts <- rbinom(n = 10000, size = 20, prob = 0.3)

# Let's see the results as a table
table(side_effect_counts)

# And as a plot
tibble(counts = side_effect_counts) |>
  ggplot(aes(x = counts)) +
  geom_bar()

#Task
treatment_group <- tibble(biomarker_level = rnorm(n = 50, mean = 90, sd = 15), group = "Treatment")
control_group <-tibble(biomarker_level = rnorm(n = 50, mean = 100, sd = 15), group = "Control")
df <- union_all(treatment_group, control_group)
visual <- ggplot(data=df, mapping= aes(x = group, y = biomarker_level)) + geom_boxplot()
visual


