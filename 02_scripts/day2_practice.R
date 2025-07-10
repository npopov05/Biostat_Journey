library(tidyverse)
ggplot(data = mpg) +
  aes(x = displ, y = hwy, color = class) +
  geom_point()
ggsave("my_first_plot.png")