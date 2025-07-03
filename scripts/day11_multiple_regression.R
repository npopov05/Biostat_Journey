library(tidyverse)
car_data <- as_tibble(mtcars)
# The formula is now mpg ~ predictor1 + predictor2
mpg_model_multi <- lm(mpg ~ wt + hp, data = car_data)

# Get the summary
summary(mpg_model_multi)

car_data_factored <- car_data |>
  mutate(am = factor(am, levels = c(0, 1), labels = c("Automatic", "Manual")))

mpg_model_categorical <- lm(mpg ~ wt + am, data = car_data_factored)
summary(mpg_model_categorical)

# Puts 4 diagnostic plots on one screen
par(mfrow = c(2, 2)) 
plot(mpg_model_multi)
par(mfrow = c(1, 1)) # Resets the plotting window

# Using the car_data tibble, fit a multiple linear regression model to predict 
# a car's horsepower (hp). Use two predictors: the car's displacement (disp) and
# number of cylinders (cyl).

hp_model_multy <- lm(hp ~ disp + cyl, data = car_data)
summary(hp_model_multy)


# Ensure we are using the original, base R mtcars
data(mtcars, package = "datasets")

# Now, convert THAT specific version to a tibble
car_data_base <- as_tibble(mtcars)

# Now, run the model using this explicitly sourced data
hp_model_base <- lm(hp ~ disp + cyl, data = car_data_base)

# Look at the summary
summary(hp_model_base)

# Use the explicitly loaded data
data(mtcars, package = "datasets")
car_data_base <- as_tibble(mtcars)

# Select only the columns we are using
model_vars <- car_data_base |>
  select(hp, disp, cyl)

# Calculate the variance-covariance matrix
cov(model_vars)