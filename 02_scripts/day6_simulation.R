library(tidyverse)
# Simulate 10 trials
rbinom(n = 10, size = 20, prob = 0.6)

# Simulate 10,000 trials
simulation_results <- rbinom(n = 10000, size = 20, prob = 0.6)

# Put results in a tibble to use ggplot
simulation_df <- tibble(successes = simulation_results)

# Plot the histogram
ggplot(simulation_df, aes(x = successes)) +
  geom_histogram(binwidth = 1, color = "white", fill = "steelblue") +
  labs(
    title = "Distribution of Successes in 10,000 Simulated Trials",
    subtitle = "20 patients per trial, 60% success rate",
    x = "Number of Successful Patients",
    y = "Frequency (Number of Trials)"
  )


# Simulate 5,000 heights
simulated_heights <- rnorm(n = 5000, mean = 178, sd = 8)

# Put in a tibble
heights_df <- tibble(height = simulated_heights)

# Plot the histogram
ggplot(heights_df, aes(x = height)) +
  geom_histogram(aes(y = after_stat(density)), bins = 30, color = "white", fill = "darkgreen") +
  stat_function(fun = dnorm, args = list(mean = 178, sd = 8), color = "red", size = 1) +
  labs(title = "Simulated Heights vs. True Normal Curve")

simulated_cholesterol = rnorm(n = 1000, mean = 210, sd = 2.5)
cholesterol_df = tibble(cholesterol = simulated_cholesterol)
ggplot(cholesterol_df, aes(x = cholesterol)) +
  geom_histogram(aes(y = after_stat(density)), bins = 30, color = "white", fill = "darkgreen") +
  stat_function(fun = dnorm, args = list(mean = 210, sd = 2.5), color = "red", size = 1) +
  labs(title = "Simulated cholesterol vs True Normal Curve")
# To answer the question about the range
summary(cholesterol_df$cholesterol)

# Or more simply
range(cholesterol_df$cholesterol)