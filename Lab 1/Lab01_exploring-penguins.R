# Installing packages

#install.packages("tidyverse")
#install.packages("palmerpenguins")

# Loading dataset
library(palmerpenguins)
data <- palmerpenguins::penguins

# First 5 row in dataset
head(data,5)

# Last 5 row in datasey
tail(data,5)

# Displaying the internal structure of data
str(data)

# Number of rows in data
nrow(data)

# Number of columns in data
ncol(data)

# Produce result summaries of the results of various model fitting functions
summary(data)

# Rows name
row.names(data)

# Columns name
names(data)

# Standard deviation and variance of "flipper_length_mm" column in data
sd(data$flipper_length_mm, na.rm = TRUE)
var(data$flipper_length_mm, na.rm = TRUE)

