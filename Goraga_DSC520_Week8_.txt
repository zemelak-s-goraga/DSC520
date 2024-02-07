---
title: "Regression Analysis of a Real Estate Dataset"
author: "Zemelak Goraga"
date: "2024-02-3"
Assignment: DSC520/Week8
output:
  pdf_document: default
---

```{r}
# specify CRAN mirror for R session
options(repos = c(CRAN = "https://cran.rstudio.com"))
```

```{r}
# Set the working directory to the correct path
setwd("C:\\Users\\MariaStella\\Downloads\\wk5_house")

```

```{r}
# Install and load required packages
install.packages("dplyr")
install.packages("tidyr")
install.packages("magrittr")
install.packages("purrr")

```

```{r}
# Load the installed packages
library(dplyr)
library(tidyr)
library(magrittr)
library(purrr)
```

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
# Load the dataset
df<- read.csv("C:\\Users\\MariaStella\\Downloads\\wk5_house\\house2.csv")
```

```{r}
head(df)
```

```{r}
# Display column names using the names() function
column_names <- names(df)
print(column_names)
```

```{r}
# inspect the dataset
str(df)
```
```{r}
# inspect the dataset
summary(df)
```

```{r}
# Data cleanup and transformations
# Rename 'Sale Date' as 'sale_date', 'Sale Price' as 'sale_price'
colnames(df)[colnames(df) == "Sale.Date"] <- "sale_date"
colnames(df)[colnames(df) == "Sale.Price"] <- "sale_price"
```


```{r}
# Inspect columns heading after renaming the variables
head(df)
```

```{r}
# Data wrangling in detail
# Convert sale_date to Date type
df$sale_date <- as.Date(df$sale_date, format="%m/%d/%Y")
```

```{r}
# Handle missing values
df[is.na(df)] <- 0  # Replace NA with 0, you may choose a different strategy
```

```{r}
# Linear regression model with 'sq_ft_lot' predicting Sale Price
model1 <- lm(sale_price ~ sq_ft_lot, data = df)
summary(model1)
```


```{r}
# Residuals and plotting
residuals1 <- resid(model1)
plot(residuals1)
```

```{r}
head(residuals1, 50)
````

```{r}
# QQ plot for residuals
qqnorm(residuals1)
qqline(residuals1)
```

```{r}
# Multiple predictor variables model
model2 <- lm(sale_price ~ sq_ft_lot + bedrooms + bath_full_count + year_built, data = df)
summary(model2)
```

```{r}
# Residuals and plotting for the second model
residuals2 <- resid(model2)
plot(residuals2)
```
```{r}
head(residuals2, 50)
```
```{r}
# QQ plot for residuals of the second model
qqnorm(residuals2)
qqline(residuals2)
```

```{r}
# ANOVA to compare models
anova(model1, model2)
```


```{r}
# Install the ‘Metrics’ package in R Studio
install.packages("Metrics")
```

```{r}
# Use the 'rmse' function for the first model
library(Metrics)
preds1 <- predict(object = model1, newdata = df)
rmse1 <- rmse(df$sale_price, preds1)
```

```{r}
head(preds1, 50)
```

```{r}
rmse1
```
```{r}
# RMSE for the second model
preds2 <- predict(object = model2, newdata = df)
rmse2 <- rmse(df$sale_price, preds2)
```


```{r}
head(preds2, 50)
```


```{r}
rmse2
```

## Questions and Answers


# Question:
Explain any transformations or modifications you made to the dataset:

# Answer:

After inspecting the dataset, the following data cleanup and transformations were performed:

Renamed 'Sale Date' to 'sale_date' and 'Sale Price' to 'sale_price'.
Converted the 'sale_date' column to the Date type.
Handled missing values by replacing NA with 0.


# Question:
10.1 What does the plot tell you about your predictions?

# Answer:
The plot of residuals helps visualize the variance and distribution of errors in predictions. The spread and pattern of residuals provide insights into model performance.


# Question:
Explain why you think each of these variables may add explanatory value to the model:

# Answer:
In the second model, 'sq_ft_lot,' 'bedrooms,' 'bath_full_count,' and 'year_built' were included as they are likely influential factors in determining house prices. These variables represent aspects such as size, amenities, and age, which can contribute to the variability in sale prices.


# Question:
What does the plot tell you about your predictions?

# Answer:
The plot of residuals for the second model provides insights into the distribution of errors and model performance.The residuals plot for the second model continues to show a random pattern, similar to the first model. This consistency indicates that the additional predictors did not introduce any significant systematic bias in the predictions.


# Question:
Do your residuals meet the normality assumption?

# Answer:
The QQ plot of residuals suggests that they are approximately normally distributed. However, to confirm normality, formal statistical tests such as the Shapiro-Wilk test could be performed.

# Question:
Compare the results between your first and second model:

# Answer:
Comparing the results between the first and second models, the second model shows improvement with a higher R-squared value. This is because it considers additional factors that contribute to the variability in sale prices.

# Question:
Does your new model show an improvement over the first?

# Answer:
Yes, the second model demonstrates improvement over the first model, as evidenced by the higher R-squared value and capturing more variability in sale prices than the first model that only considers 'sq_ft_lot.'


# Question:
To confirm a ‘significant’ improvement between the second and first model, use ANOVA to compare them. What are the results?

# Answer:
ANOVA was performed to compare the first and second models, resulting in a significant difference (p-value < 2.2e-16).


# Question:
After observing both models (specifically, residual normality), provide your thoughts concerning whether the model is biased or not.

# Answer:

Based on the randomness of residuals in the plots, both models appear unbiased. However, conducting formal statistical tests or additional diagnostic plots would provide more assurance.


# Question:
What is the RMSE for the first model?

# Answer:
The RMSE for the first model is calculated as 401,452.5, indicating the average deviation of the model's predictions from actual sale prices.

# Question:
Did the second model’s RMSE improve upon the first model? By how much?

# Answer:
The second model's RMSE (374,595.4) is lower than the first model's RMSE (401,452.5), indicating an improvement in predictive accuracy.



## Full Report:


Executive Summary:
This report presents a comprehensive analysis of the housing (df) dataset, aiming to predict real estate sale prices through regression modeling. The dataset encompasses various features, including 'sq_ft_lot,' 'bedrooms,' 'bath_full_count,' and 'year_built.' Two linear regression models are developed, and their performance is critically evaluated against actual sale prices. The report unfolds the intricate relationships among predictors, providing valuable insights for stakeholders involved in real estate decision-making.


Introduction:
The analysis focuses on predicting real estate sale prices using the 'df' dataset, exploring the relationship between sale prices and various predictors. Two linear regression models are developed, one considering only 'sq_ft_lot' and the other incorporating additional predictors such as 'bedrooms,' 'bath_full_count,' and 'year_built.' Actual results are analyzed, diverging from assumed outcomes, to provide a realistic assessment of model performance.


Statement of the Problem:
The 'df' dataset poses challenges in understanding the intricate relationships among predictors and sale prices. The primary challenge is to accurately predict sale prices based on a diverse set of features. Addressing this involves constructing robust regression models and scrutinizing their performance against actual data.


Business Objective:
The overarching business goal is to enhance the accuracy of predicting real estate sale prices, providing stakeholders with reliable tools for decision-making. The analysis aims to identify significant predictors and build models that capture the complexity of the real estate market.


Methodology:
The comprehensive methodology involves data import, inspection, cleaning, and transformation. Two linear regression models are developed: the first predicts sale prices based solely on 'sq_ft_lot,' while the second incorporates additional predictors. Model performance is evaluated using metrics such as R-squared, RMSE, and ANOVA.


Results:

Linear Regression Models:

4.1 Model 1 - 'sq_ft_lot' Predicting Sale Price:
4.1.1 Coefficients:
Intercept: $641,800
'sq_ft_lot' Coefficient: $0.851
R-squared: 0.01435
RMSE: $401,452.5

4.1.2 Residual Analysis:
Residuals display significant dispersion, suggesting limited predictive power with only 'sq_ft_lot.'


4.2 Model 2 - Multiple Predictor Variables:
4.2.1 Coefficients:
Intercept: -$8,993,000
'sq_ft_lot' Coefficient: $0.935
'Bedrooms' Coefficient: $80,910
'Bath Full Count' Coefficient: $84,690
'Year Built' Coefficient: $4,616
R-squared: 0.1418
RMSE: $374,595.4


4.2.2 Residual Analysis:
The addition of predictors improves model performance, evident in lower RMSE and higher R-squared. Residuals show a more centered distribution.



Model 1 Discussion:
The first model's performance is highlighted by an RMSE of 401,452.5, suggesting considerable variation from actual sale prices. Residual analysis indicates significant dispersion, questioning the model's ability to capture the complexity of real estate pricing with only 'sq_ft_lot' as a predictor.


Model 2 Discussion:
The second model, incorporating multiple predictors, demonstrates improved performance with an RMSE of 374,595.4. The addition of 'bedrooms,' 'bath_full_count,' and 'year_built' contributes to better predictive accuracy. The ANOVA results show a significant difference between the two models, justifying the inclusion of additional predictors.


Comparative Analysis:

The analysis of the housing (df) dataset results reveals nuanced model performance. In the first model, considering only 'sq_ft_lot,' the estimated coefficient is 8.510e-01, indicating that for each additional square foot of lot, the sale price increases by approximately $0.85. The R-squared is 0.01435, implying limited explanatory power.

Comparing the models, the second model outperforms the first, evident in lower RMSE and higher R-squared. The coefficients for 'bedrooms,' 'bath_full_count,' and 'year_built' are significant, emphasizing their impact on sale prices.


Conclusion:
In conclusion, the analysis of the 'df' dataset underscores the importance of multiple predictors in real estate price prediction. The second model, considering 'sq_ft_lot,' 'bedrooms,' 'bath_full_count,' and 'year_built,' provides a more accurate representation of sale prices compared to the simplistic 'sq_ft_lot' model.


Recommendations:
To enhance model accuracy, further exploration of potential predictors and nonlinear relationships is advised. Additionally, ongoing validation and refinement are crucial for adapting models to the dynamic real estate market. Advanced machine learning techniques could be explored for improved predictive capabilities.


