# Install once
install.packages("gsDesign")

library(gsDesign)

# 1. Define parameters
alpha <- 0.05
power <- 0.90
hr <- 0.7
median_surv_control <- 24

# 2. Convert median survival to a monthly event rate (lambda)
# This is the expected rate for the control group
lambda_control <- log(2) / median_surv_control

# 3. Use nSurv() to calculate sample size
# T = total study duration for first patient enrolled (18+12=30)
# minfup = minimum follow-up for last patient enrolled (12)
power_result_surv <- nSurv(
  lambdaC = lambda_control,
  hr = hr,
  eta = 0, # Assumes 0 dropout rate for simplicity
  T = 30,
  minfup = 12,
  alpha = alpha,
  beta = 1 - power, # The function uses beta (Type II error)
  ratio = 1 # 1:1 allocation
)

# Print the result
power_result_surv



