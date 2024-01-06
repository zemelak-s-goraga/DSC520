# Set the working directory to the correct path
setwd("/resources/labs/R101")

# Import the dataset scores.csv as df
df <- read.csv("/resources/labs/R101/scores.csv")

# Display the first few rows of the dataset
head(df)

# Function to identify observational units
observational_units <- function(df) {
  return(nrow(df))
}

observational_units(df)

# Function to identify variables and their types
identify_variables <- function(data) {
  cat("Variables and their types:\n")
  for (col in names(data)) {
    cat(col, ": ", ifelse(is.factor(data[[col]]), "Categorical", "Quantitative"), "\n")
  }
}

# Function to create variables for Regular and Sports sections
create_section_variables <- function(data) {
  regular_section <- subset(data, Section == "Regular")
  sports_section <- subset(data, Section == "Sports")
  return(list(regular_section = regular_section, sports_section = sports_section))
}

# Function to plot scores and number of students by section
plot_scores_by_section <- function(data) {
  par(mfrow = c(1, 2))
  plot(data$Score[data$Section == "Regular"], data$Count[data$Section == "Regular"],
       main = "Regular Section",
       xlab = "Score",
       ylab = "Number of Students",
       col = "blue")
  
  plot(data$Score[data$Section == "Sports"], data$Count[data$Section == "Sports"],
       main = "Sports Section",
       xlab = "Score",
       ylab = "Number of Students",
       col = "red")
  
  par(mfrow = c(1, 1))  # Reset to single plot layout
}

# Call the functions
observational_units(df)
identify_variables(df)
sections_data <- create_section_variables(df)
plot_scores_by_section(df)

# Perform descriptive statistics for each section
summary_regular_section <- summary(sections_data$regular_section$Score)
summary_sports_section <- summary(sections_data$sports_section$Score)

# Print the summaries
cat("\nSummary for Regular Section:\n")
print(summary_regular_section)

cat("\nSummary for Sports Section:\n")
print(summary_sports_section)


