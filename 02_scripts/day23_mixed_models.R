install.packages("lme4")

library(lme4)
library(tidyverse)

# We will use the 'sleepstudy' dataset from lme4
# It shows the reaction time ('Reaction') of subjects on successive
# days ('Days') of sleep deprivation.
glimpse(sleepstudy)

ggplot(sleepstudy, aes(x = Days, y = Reaction, group = Subject)) +
  geom_line(alpha = 0.5) + # Individual lines
  geom_smooth(method = "lm", aes(group = 1), color = "red") + # Overall trend line
  labs(title = "Reaction Time by Days of Sleep Deprivation",
       subtitle = "Each grey line is an individual subject",
       x = "Days of Sleep Deprivation",
       y = "Average Reaction Time (ms)") +
  theme_minimal()

# Fit the random intercept model
model_intercept <- lmer(Reaction ~ Days + (1 | Subject), data = sleepstudy)

# Get the summary
summary(model_intercept)

# Fit the random slope and intercept model
model_slope <- lmer(Reaction ~ Days + (Days | Subject), data = sleepstudy)

# Get the summary
summary(model_slope)

# Get the AIC for both models
AIC(model_intercept, model_slope)

# Perform the likelihood ratio test
anova(model_intercept, model_slope)

# 1. The primary research question was to quantify the effect of sleep 
# deprivation on reaction time.
# 2. We fitted two mixed-effects models: one with a random intercept only,
# and a more complex one with both a random intercept and a random slope 
# for the effect of time. Both the AIC and the Likelihood Ratio Test (p < 0.001)
# confirmed that the random slope model provided a significantly better fit to 
# the data, indicating that individuals show different rates of change in their 
#reaction time.
# 3.  From the final model, the fixed effect for Days was 10.47 ms. 
# This means that, on average, each additional day of sleep deprivation is 
# associated with an increase of about 10.5 milliseconds in reaction time.