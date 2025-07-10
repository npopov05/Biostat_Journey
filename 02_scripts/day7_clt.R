library(tidyverse)
# Our population is uniformly distributed (flat)
population <- runif(n = 100000, min = 0, max = 5000)

# Let's visualize the population to prove it's NOT normal
ggplot(tibble(data = population), aes(x = data)) +
  geom_histogram(fill = "purple", color = "black") +
  labs(title = "Our Population Distribution (Uniform - NOT Normal)")

# This is a bit advanced, but follow the logic.
# We will use a 'for' loop to repeat the process.

# 1. Create an empty vector to store our sample means
sample_means <- numeric(5000)

# 2. Loop 5000 times
for (i in 1:5000) {
  # Take a random sample of size 30 from the population
  one_sample <- sample(population, size = 200)
  
  # Calculate its mean and store it
  sample_means[i] <- mean(one_sample)
}
  
  # Convert to a tibble for plotting
  means_data <- tibble(means = sample_means)
  
  # Plot the histogram of the SAMPLE MEANS
  ggplot(means_data, aes(x = means)) +
    geom_histogram(fill = "lightgreen", color = "black") +
    labs(title = "Distribution of the Sample Means (This is MAGIC!)")
  
# Take ONE sample of size 100
my_single_sample <- sample(population, size = 100)

# Calculate its statistics
sample_mean <- mean(my_single_sample)
sample_sd <- sd(my_single_sample)
sample_n <- 100

# Calculate the Standard Error of the Mean
se_mean <- sample_sd / sqrt(sample_n)

# Calculate the 95% Confidence Interval
lower_bound <- sample_mean - 1.96 * se_mean
upper_bound <- sample_mean + 1.96 * se_mean

# Print the results
print(paste("Sample Mean:", round(sample_mean, 2)))
print(paste("95% CI:", round(lower_bound, 2), "to", round(upper_bound, 2)))

# What was the TRUE population mean? (min=0, max=5000 -> mean=2500)
# Did our interval capture it? It should have!

