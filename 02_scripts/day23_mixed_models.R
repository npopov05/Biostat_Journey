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