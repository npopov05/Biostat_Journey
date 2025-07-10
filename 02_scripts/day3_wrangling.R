library(tidyverse)
View(mpg)
filter(mpg, manufacturer == "audi")
filter(mpg, manufacturer == "audi", cyl > 4)
filter(mpg, hwy > 30)
arrange(mpg, desc(hwy))
arrange(mpg, (manufacturer), desc(displ))
select(mpg, manufacturer, model, year)
select(mpg, manufacturer:cyl) # Selects all columns from manufacturer to cyl
select(mpg, -trans, -drv) # Selects all columns EXCEPT trans and drv
mutate(mpg, avg_mpg = (cty + hwy) / 2)
mutate(mpg, efficiency_category = if_else(hwy > 25, "Efficient", "Not Efficient"))
#Find the model and hwy mileage for all cars made by Toyota, and 
#show the most efficient ones first.
mpg |>
  filter(manufacturer == "toyota") |>
  arrange(desc(hwy)) |>
  select(model, hwy)

#Create a new variable called cyl_per_displ (cylinders per litre of displacement). 
#For cars with 4-wheel drive (drv == "4"), show only the manufacturer, model, 
#and this new variable, sorted to show the highest cyl_per_displ first.
mpg |>
  filter(drv == "4") |>
  mutate(cyl_per_displ = cyl / displ) |>
  arrange(desc(cyl_per_displ)) |>
  select(manufacturer, model, cyl_per_displ)

# Find all 2-seater cars (class == "2seater"). Of those, which car has the best highway gas mileage for its engine size?
mpg |>
  filter(class == "2seater") |>
  mutate(hwy_per_displ = hwy / displ) |>
  arrange(desc(hwy_per_displ)) |>
  select(manufacturer, model, hwy_per_displ)

