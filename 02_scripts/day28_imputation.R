# Install once
install.packages("mice")

library(mice)
library(tidyverse)

# Use the airquality dataset
data(airquality)

# How much data is missing?
summary(airquality)
# Ozone has 37 NAs, Solar.R has 7 NAs

# Step 1: Impute the data
set.seed(123)
imputed_data <- mice(airquality, m = 5, method = 'pmm', printFlag = FALSE)

# 'imputed_data' is a special object containing 5 complete datasets
# pmm = predictive mean matching, a good default method
summary(imputed_data)

# Step 2: Analyze each of the 5 datasets
# The 'with()' function runs the lm() on each imputed dataset
model_fits <- with(imputed_data, lm(Ozone ~ Solar.R + Wind + Temp))

# Step 3: Pool the 5 sets of results into one
pooled_results <- pool(model_fits)

# Look at the final, combined results
summary(pooled_results)