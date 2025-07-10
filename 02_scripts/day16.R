# Install if you haven't already
install.packages("usethis")

# Run the function to create and open a .gitignore file
usethis::use_git_ignore(c("*.RData", ".Rhistory", "data/"))