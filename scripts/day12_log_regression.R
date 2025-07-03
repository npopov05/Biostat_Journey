# Load the tidyverse library
library(tidyverse)

# --- Load the Data Directly from the Source using read_csv() ---
# After inspection, the file is comma-separated, not tab-separated.
heart_disease_data_raw <- read_csv(
  "https://web.stanford.edu/~hastie/ElemStatLearn/datasets/SAheart.data",
  col_names = TRUE
)

# --- Data Cleaning and Preparation ---
# The rest of the cleaning logic can now proceed as planned.
heart_disease_data <- heart_disease_data_raw |>
  select(-row.names) |> # This will now work correctly!
  mutate(
    # The outcome 'chd' is numeric 0/1, perfect for glm()
    # The predictor 'famhist' needs to be a factor
    famhist = factor(famhist)
  )

# Now, inspect the clean data. It should have 10 columns.
glimpse(heart_disease_data)

# Fit the model: chd is our outcome, age is our predictor
chd_model <- glm(chd ~ age, data = heart_disease_data, family = "binomial")

# Get the summary
summary(chd_model)

# Exponentiate the coefficient to get the odds ratio
exp(coef(chd_model))

# Fit a multiple logistic regression model
chd_model_multi <- glm(chd ~ age + famhist, data = heart_disease_data, family = "binomial")

# Get the odds ratios
exp(coef(chd_model_multi))
