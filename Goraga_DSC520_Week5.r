# Set the working directory to the correct path
setwd("C:\\Users\\MariaStella\\Downloads\\wk5_house")

# Install and load required packages
install.packages("dplyr")
install.packages("tidyr")
install.packages("magrittr")
install.packages("purrr")

# Load the installed packages
library(dplyr)
library(tidyr)
library(magrittr)
library(purrr)

# Import the dataset scores.csv as df
df<- read.csv("C:\\Users\\MariaStella\\Downloads\\wk5_house\\house2.csv")

# Display the first few rows of the dataset
head(df)

# Display column names using the names() function
column_names <- names(df)
print(column_names)

# The 'sale_price' variable was used to perform the under mentioned operations (Task 1 to Task4). 
# null values can be removed from the 'sale_price' data as follows.
sale_price_without_nulls <- na.omit(df$sale_price)
print(head(sale_price_without_nulls))

# dplyr operations using the 'sale_price' variable. 

# GroupBy and Summarize
grouped_summary <- df %>%
  dplyr::group_by(ctyname) %>%
  dplyr::summarize(
    Total_Sale_Price = sum(`sale_price`),
    Average_Square_Feet = mean(square_feet_total_living)
  )

# Mutate
mutated_df <- df %>%
  dplyr::mutate(Sale_Price_Double = `sale_price` * 2)

# Filter
filtered_df <- df %>%
  dplyr::filter(bedrooms == 4 & bath_full_count == 2)

# Select
selected_columns <- df %>%
  dplyr::select(ctyname, `sale_price`, square_feet_total_living)

# Arrange
arranged_df <- df %>%
  dplyr::arrange(desc(year_built))

# Other similar operations:
# Count distinct values in ctyname
distinct_count <- df %>%
  dplyr::count(ctyname, name = "City_Count")

# Calculate cumulative sum of `sale_price` within each ctyname
cumulative_sum <- df %>%
  dplyr::arrange(ctyname, `sale_price`) %>%
  dplyr::group_by(ctyname) %>%
  dplyr::mutate(Cumulative_Sale_Price = cumsum(`sale_price`))

# Print the results
cat("GroupBy and Summarize:\n")
print(grouped_summary)

cat("Mutate:\n")
head(mutated_df)

cat("Filter:\n")
head(filtered_df)

cat("Select:\n")
head(selected_columns)

cat("Arrange:\n")
head(arranged_df)

cat("Count Distinct:\n")
print(distinct_count)

cat("Cumulative Sum:\n")
head(cumulative_sum)

# Use purrr functions on the df dataset
# Function 1: Use zip_n to combine `sale_price` and square_feet_total_living columns into a list
combined_cols <- df %>%
  dplyr::mutate(combined = purrr::pmap(list(`sale_price`, square_feet_total_living), c))

# Function 2: Use filter to retain rows where bedrooms is greater than 3
filtered_df <- df %>%
  dplyr::filter(bedrooms > 3)

# Function 3: Use discard to remove rows where bath_full_count is 0
filtered_df_no_zero_bath <- df %>%
  dplyr::filter(bath_full_count != 0)

# Function 4: Use compact to remove NULL elements from a list
compact_list <- list(a = 1, b = NULL, c = 3) %>%
  purrr::compact()

# Display the results
cat("Combined Columns:\n")
print(combined_cols$combined)

cat("Filtered Rows (bedrooms > 3):\n")
print(filtered_df)

cat("Filtered Rows (bath_full_count not 0):\n")
print(filtered_df_no_zero_bath)

cat("Compact List:\n")
print(compact_list)

# Use cbind and rbind functions on the df dataset
# Create a new data frame to demonstrate cbind
df2 <- data.frame(`sale_price` = rep(c(500000, 600000, 700000), length.out = nrow(df)),
                  square_feet_total_living = rep(c(2500, 3000, 3500), length.out = nrow(df)),
                  ctyname = rep(c("REDMOND", "BELLEVUE", "SEATTLE"), length.out = nrow(df)))

# Use cbind to combine df and df2 by columns
combined_by_columns <- cbind(df, df2)
cat("Combined by Columns:\n")
print(combined_by_columns)

# Use rbind to combine df and df2 by rows
combined_by_rows <- rbind(df, df2)
cat("Combined by Rows:\n")
print(combined_by_rows)

# Using one variable, split a string, then concatenate 
# the results back together.


# Do it in more detail by using another variable.
# Example using one variable (ctyname)
df$City_Split <- strsplit(as.character(df$ctyname), "")
df <- cbind(df, t(sapply(df$City_Split, c)))

# Display the updated dataset
head(df)

# Concatenate the results for 'ctyname'
df$City_Joined <- sapply(df$City_Split, function(x) paste(x, collapse = ""))
df <- df[, -which(colnames(df) %in% c("City_Split"))]  # Remove intermediate columns

# Display the final updated dataset
head(df)


