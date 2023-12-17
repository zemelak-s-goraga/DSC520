# Set the working directory
# setwd("labs/R101")

# Read the CSV file into a data frame as df
df <- read.csv("df.csv")

# Display the first few rows of the dataset
head(df)


# Load necessary library
library(ggplot2)

# Display structure of the data frame
str(df)

# Display number of rows
nrow(df)

# Display number of columns
ncol(df)

## Create Histogram
ggplot(df, aes(x = HSDegree)) +
  geom_histogram(binwidth = 2, fill = "blue", color = "black") +
  labs(title = "Distribution of High School Degrees",
       x = "Percentage of Population with High School Degree",
       y = "Frequency")


# Summary Statistics and Skewness 

# Install the moments package
if (!requireNamespace("moments", quietly = TRUE)) {
  install.packages("moments")
}

# Load the moments package
library(moments)

# Create the dataframe
df <- data.frame(HSDegree = c(89.1, 86.8, 88, 86.9, 88.8, 73.6, 74.5, 77.5, 84.6, 80.6, 86.8, 78.6, 86.6, 88.1, 77.6, 88.1, 87.4, 87.6, 78.4, 83.6, 91.9, 85.5, 92.8, 94.1, 89.8, 89.3, 89.5, 90.1, 90.2, 91.6, 88.4, 89, 87.3, 86.3, 80.9, 87.9, 87.7, 90.1, 84.9, 88.9, 90.3, 88.4, 91.3, 88, 91.8, 85.5, 92.3, 82.9, 90.3, 90.7, 85, 95.5, 88.8, 88.5, 91.9, 90.4, 90.9, 85.5, 84.4, 82.5, 89.1, 92.3, 94.1, 92.2, 83.9, 90.1, 89.1, 89.3, 93.6, 84.9, 93.2, 89.9, 90, 93.2, 88.2, 84.5, 91.5, 88.3, 85.5, 83.4, 89.1, 93.1, 91.7, 83.8, 86.2, 88, 70.5, 90.6, 80, 90.3, 90.7, 86.8, 80.4, 89.8, 87.4, 89, 89.5, 92.4, 88.1, 90, 90.5, 89.7, 91.1, 86.8, 88.6, 91.1, 90.2, 93.9, 93.9, 92.3, 91.5, 84.9, 93.7, 82.6, 82, 86.7, 87.4, 83, 93.7, 77.6, 91.9, 75.8, 88.6, 79.8, 62.2, 85.9, 84.9, 88.6, 89.5, 93.7, 91.5, 92.3, 90.3, 92, 94.9, 86.9))

# Summary statistics
summary_stats <- summary(df$HSDegree)
print(summary_stats)

# Check skewness using moments package
skewness_value <- skewness(df$HSDegree)
print(paste("Skewness:", skewness_value))


# 5.1. A normal curve to the Histogram.

# the dataset
HSDegree <- c(89.1, 86.8, 88, 86.9, 88.8, 73.6, 74.5, 77.5, 84.6, 80.6, 86.8, 78.6, 86.6, 88.1, 77.6, 88.1, 87.4, 87.6, 78.4, 83.6, 91.9, 85.5, 92.8, 94.1, 89.8, 89.3, 89.5, 90.1, 90.2, 91.6, 88.4, 89, 87.3, 86.3, 80.9, 87.9, 87.7, 90.1, 84.9, 88.9, 90.3, 88.4, 91.3, 88, 91.8, 85.5, 92.3, 82.9, 90.3, 90.7, 85, 95.5, 88.8, 88.5, 91.9, 90.4, 90.9, 85.5, 84.4, 82.5, 89.1, 92.3, 94.1, 92.2, 83.9, 90.1, 89.1, 89.3, 93.6, 84.9, 93.2, 89.9, 90, 93.2, 88.2, 84.5, 91.5, 88.3, 85.5, 83.4, 89.1, 93.1, 91.7, 83.8, 86.2, 88, 70.5, 90.6, 80, 90.3, 90.7, 86.8, 80.4, 89.8, 87.4, 89, 89.5, 92.4, 88.1, 90, 90.5, 89.7, 91.1, 86.8, 88.6, 91.1, 90.2, 93.9, 93.9, 92.3, 91.5, 84.9, 93.7, 82.6, 82, 86.7, 87.4, 83, 93.7, 77.6, 91.9, 75.8, 88.6, 79.8, 62.2, 85.9, 84.9, 88.6, 89.5, 93.7, 91.5, 92.3, 90.3, 92, 94.9, 86.9)

# Plot histogram
hist(HSDegree, freq = FALSE, col = "lightblue", main = "Normal Distribution Curve", xlab = "HSDegree")

# Add normal distribution curve
mu <- mean(HSDegree)
sigma <- sd(HSDegree)
x <- seq(min(HSDegree), max(HSDegree), length = 100)
y <- dnorm(x, mean = mu, sd = sigma)
lines(x, y, col = "red", lwd = 2)


# Load necessary library
library(ggplot2)

ggplot(df, aes(sample = HSDegree)) +
  geom_qq() +
  geom_qq_line(color = "red") +
  labs(title = "Probability Plot of High School Degrees",
       x = "Theoretical Quantiles",
       y = "Sample Quantiles")


# Install and load the pastecs package
install.packages("pastecs")
library(pastecs)

# Display descriptive statistics
stat.desc(df$HSDegree)
