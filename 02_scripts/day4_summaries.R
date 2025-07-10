library(tidyverse)
mpg |>
  summarize(avg_hwy_mpg = mean(hwy))

mpg |>
  summarize(
    avg_hwy_mpg = mean(hwy),
    sd_hwy_mpg = sd(hwy),
    total_cars = n()
  )

mpg |>
  group_by(manufacturer) |>
  summarize(avg_hwy_mpg = mean(hwy))

mpg |>
  group_by(manufacturer)

mpg |>
  group_by(manufacturer) |>
  summarize(num_models = n_distinct(model))

mpg |>
  group_by(manufacturer) |>
  summarize(avg_hwy_mpg = mean(hwy)) |>
  ungroup() # Now it's a regular, ungrouped tibble again

mpg |>
  group_by(manufacturer, cyl) |>
  summarize(avg_cty_mpg = mean(cty)) |>
  arrange(manufacturer, cyl) # Arrange to make it easier to read

mpg |>
  group_by(manufacturer) |>
  summarize(
    num_models = n_distinct(model),
    median_hwy_mpg = median(hwy)
  ) |>
  filter(num_models >= 5) |>
  arrange(desc(median_hwy_mpg))

mpg |>
  filter(cyl == 6 | cyl == 8) |>
  mutate(fuel_efficient = (cty + hwy) / 2) |>
  group_by(drv) |>
  summarise(avg_fuel_efficient = mean(fuel_efficient)) |>
  arrange(desc(avg_fuel_efficient))

  
