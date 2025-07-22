# Install the package. It's large and may take a few minutes.
install.packages("rstanarm")

library(rstanarm)
library(tidyverse)

# Fit the Bayesian linear model
# We set a seed for the simulation aspect of the model fitting
set.seed(42)
b_model <- stan_lm(mpg ~ wt, data = mtcars, prior=NULL)

# Print the summary
print(b_model, digits = 3)

plot(b_model)

posterior_interval(b_model, prob = 0.95)

