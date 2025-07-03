library(survival)
library(tidyverse)

lung_clean <- lung |>
  mutate(status_new = if_else(status == 2, 1, 0)) # 1=dead, 0=censored

# Fit the model with 'sex' as the predictor
cox_model_sex <- coxph(Surv(time, status_new) ~ sex, data = lung_clean)

summary(cox_model_sex)

# Fit a multiple cox model
cox_model_multi <- coxph(Surv(time, status_new) ~ age + ph.ecog, data = lung_clean)

summary(cox_model_multi)

# Test the proportional hazards assumption for our multiple model
ph_test <- cox.zph(cox_model_multi)

print(ph_test)
plot(ph_test)
plot(ph_test)

cox_model_wtloss <- coxph(Surv(time, status_new) ~ wt.loss, data = lung_clean)

summary(cox_model_wtloss)

summary(lung$wt.loss)