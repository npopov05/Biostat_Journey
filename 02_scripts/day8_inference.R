library(tidyverse)
set.seed(42)

# Our sample data
temps <- rnorm(n = 25, mean = 98.2, sd = 0.7)

# What does the researcher see?
mean(temps) # Should be around 98.2
sd(temps)   # Should be around 0.7

t.test(temps, mu = 98.6)

# Group A (Drug) - 30 patients, true mean reduction of 12 mmHg
group_a_drug <- rnorm(n = 30, mean = 12, sd = 5)

# Group B (Placebo) - 30 patients, true mean reduction of 5 mmHg
group_b_placebo <- rnorm(n = 30, mean = 5, sd = 5)
t.test(group_a_drug, group_b_placebo)
