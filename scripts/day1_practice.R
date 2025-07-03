# My first R script - Day 1
# The hash symbol creates a comment, which R ignores.
patient_age <- 35
patient_weight_kg <- 72.5
patient_id <- "P001"

# Calculate Body Mass Index (BMI) - let's assume height is 1.75 meters
patient_height_m <- 1.75
patient_bmi <- patient_weight_kg / (patient_height_m * patient_height_m)

# A vector of blood pressure readings
bp_readings <- c(120, 122, 118, 125, 121)

# Now use the mean() function on our object
mean_bp <- mean(bp_readings)
?mean