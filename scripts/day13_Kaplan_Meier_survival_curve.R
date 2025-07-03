# Install once
install.packages("survival")

library(survival)
library(tidyverse)

# We'll use the 'lung' dataset, built into the survival package
# It contains data from a clinical trial on lung cancer patients
glimpse(lung)

lung_clean <- lung |>
  mutate(status_new = if_else(status == 2, 1, 0)) # 1=dead, 0=censored
surv_obj <- Surv(time = lung_clean$time, event = lung_clean$status_new)

km_fit_overall <- survfit(surv_obj ~ 1)

# Print the results
print(km_fit_overall)

plot(km_fit_overall, 
     xlab = "Time in Days", 
     ylab = "Overall Survival Probability",
     main = "Kaplan-Meier Curve for Lung Cancer Patients")

# Fit the model, stratifying by sex
km_fit_by_sex <- survfit(Surv(time, status_new) ~ sex, data = lung_clean)

plot(km_fit_by_sex,
     col = c("blue", "red"), # Assign colors to the curves
     xlab = "Time in Days",
     ylab = "Survival Probability",
     main = "Kaplan-Meier Survival by Sex")

# Add a legend to make it readable
legend("topright", 
       legend = c("Male", "Female"), 
       col = c("blue", "red"), 
       lty = 1)

# Perform the log-rank test
logrank_test <- survdiff(Surv(time, status_new) ~ sex, data = lung_clean)

print(logrank_test)