library(tidyverse)
# Load the mtcars dataset and convert it to a tibble
car_data <- as_tibble(mtcars)
ggplot(car_data, aes(x = wt, y = mpg)) +
  geom_point(size = 3, color = "darkblue") +
  labs(title = "Car Weight vs. Miles Per Gallon",
       x = "Weight (1000 lbs)",
       y = "Miles Per Gallon")
# Just the coefficient
cor(car_data$wt, car_data$mpg) 
# Output: [1] -0.8676594

# The full test
cor.test(car_data$wt, car_data$mpg)

# Fit the model
mpg_model <- lm(mpg ~ wt, data = car_data)

# Get the summary of the model
summary(mpg_model)

ggplot(car_data, aes(x = wt, y = mpg)) +
  geom_point(size = 3, color = "darkblue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") + # "lm" means linear model
  labs(title = "Car Weight vs. Miles Per Gallon with Regression Line",
       x = "Weight (1000 lbs)",
       y = "Miles Per Gallon")