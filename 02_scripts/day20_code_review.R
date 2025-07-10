# --- CODE TO BE REVIEWED ---

library(tidyverse)
data("starwars")

# created a subset of the data
df1 <- starwars[starwars$species=="Droid" | starwars$species=="Human",]

# group by species
df2 <- group_by(df1, species)

# calculate the mean
df3 <- summarise(df2, averageMass=mean(mass, na.rm=T))

# filter the result
result <- df3[df3$averageMass > 70,]

print(result)```

**Step 2: Your Review Checklist (10 mins)**
  
  Before you dive in, create a mental checklist based on the principles from Hour 1.
1.  **Correctness:** Does it do what it's supposed to? (Yes, it does).
2.  **Style:**
    *   Variable names? (`df1`, `df2`... not good).
    *   Spacing and assignment? (`=`, `na.rm=T`... could be better).
    *   Pipes? (It's not using the `|>` pipe, making it clunky).
3.  **Comments:** Are there any? (No).
4.  **Efficiency/Best Practice:** Is it creating unnecessary intermediate variables? (Yes, `df1`, `df2`, `df3` are all temporary).

**Step 3: Write the Review (30 mins)**
  
  Now, write out your review comments. You can do this in a text file or as comments in an R script. Frame it constructively.

**Example Review:**
  > "Hi team, thanks for this script. The logic is correct and gets the right answer, which is great. I have a few suggestions to make it a bit more readable and aligned with our team's style guide for when we check this in.
>
> 1.  **Variable Names:** The names `df1`, `df2`, and `df3` are temporary and don't describe the contents. Could we combine this into a single pipeline and assign it to a more descriptive name like `heavy_species_mass`?
>
> 2.  **Use of Pipes `|>`:** This logic is a perfect candidate for a `dplyr` pipe (`|>`). It would eliminate the need for the intermediate data frames (`df1`, `df2`) and make the flow of logic much easier to follow from top to bottom.
>
> 3.  **Style Nits:**
>     *   Could we switch the base R subsetting `[...]` on line 7 to a `filter()` verb within the pipe for consistency?
>     *   The tidyverse style guide suggests using `<-` for assignment instead of `=`, and spaces around operators.
>     *   It also suggests `na.rm = TRUE` instead of `na.rm=T` for clarity.
>
> Let me know what you think!"

**Step 4: Rewrite the Code (15 mins)**
  
  As a final step, rewrite the code yourself based on your own review. This is the "gold standard" version.

```R
# --- REWRITTEN "CLEAN" CODE ---

library(tidyverse)

# Calculate average mass for select species and filter for heavy ones
heavy_species_mass <- starwars |>
  filter(species %in% c("Droid", "Human")) |> # Use %in% for multiple "OR" conditions
  group_by(species) |>
  summarise(
    average_mass = mean(mass, na.rm = TRUE)
  ) |>
  filter(average_mass > 70)

print(heavy_species_mass)