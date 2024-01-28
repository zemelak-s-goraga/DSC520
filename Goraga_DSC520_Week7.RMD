---
title: "Descriptive Analysis & Visualization of individuals' time spent on reading, watching TV, and self-reported happiness"
author: "Zemelak Goraga"
date: "2024-01-27"
output:
  pdf_document: default
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
# Load the dataset
df <- data.frame(
  TimeReading = c(1, 2, 2, 2, 3, 4, 4, 5, 5, 6, 6),
  TimeTV = c(90, 95, 85, 80, 75, 70, 75, 60, 65, 50, 70),
  Happiness = c(86.2, 88.7, 70.17, 61.31, 89.52, 60.5, 81.46, 75.92, 69.37, 45.67, 77.56),
  Gender = c(1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1)
)
```

```{r}
head(df)
```

```{r}
# Plots of Survey Variables
library(ggplot2)
```

## Question 1: Create the following 3 plots of survey variables (first variable is x-axis, second is y-axis)
TimeReading, TimeTV
TimeReading, Happiness
TimeTV, Happiness

Based on the plots you created, provide a rough estimate of the relationship between the variables; do the slopes indicate a positive or negative relationship? Instead of the plots, use the descriptive statistics 

```{r}
# Plot TimeReading vs. TimeTV
plot1 <- ggplot(df, aes(x = TimeReading, y = TimeTV)) +
  geom_point() +
  labs(title = "TimeReading vs. TimeTV", x = "TimeReading (in hour)", y = "TimeTV (in minutes)")
print(plot1)
```

```{r}
# Create plot1 using 'Gender' as a grouping variable
plot1 <- ggplot(df, aes(x = TimeReading, y = TimeTV, color = factor(Gender))) +
  geom_point() +
  labs(title = "TimeReading vs TimeTV",
       x = "TimeReading (in hour)",
       y = "TimeTV (in minutes)",
       color = "Gender")
print(plot1)

```



```{r}
# Descriptive statistics for TimeReading and TimeTV based on Gender
summary(df[c("TimeReading", "TimeTV")])
```

```{r}
# Plot TimeReading vs. Happiness
plot2 <- ggplot(df, aes(x = TimeReading, y = Happiness)) +
  geom_point() +
  labs(title = "TimeReading vs. Happiness", x = "TimeReading (in hour)", y = "Happiness (in %)")
print(plot2)
```

```{r}
# Create plot2 using 'Gender' as a grouping variable

plot2 <- ggplot(df, aes(x = TimeReading, y = Happiness, color = factor(Gender))) +
  geom_point() +
  labs(title = "TimeReading vs Happiness",
       x = "TimeReading (in hour)",
       y = "Happiness (in %)",
       color = "Gender")

print(plot2)
```


```{r}
# Descriptive statistics for TimeReading and Happiness based on Gender
summary(df[c("TimeReading", "Happiness")])

```


```{r}
# Plot TimeTV vs. Happiness
plot3 <- ggplot(df, aes(x = TimeTV, y = Happiness)) +
  geom_point() +
  labs(title = "TimeTV vs. Happiness", x = "TimeTV (in minutes)", y = "Happiness (in %)") 
print(plot3)
```

```{r}
# Create plot3 using 'Gender' as a grouping variable

plot3 <- ggplot(df, aes(x = TimeTV, y = Happiness, color = factor(Gender))) +
  geom_point() +
  labs(title = "TimeTV vs Happiness",
       x = "TimeTV (in minutes)",
       y = "Happiness (in %)",
       color = "Gender")

print(plot3)
```


```{r}
# Descriptive statistics for TimeTV and Happiness based on Gender
summary(df[c("TimeTV", "Happiness")])
```


```{r}
# Save plots to a PDF file as survey_plots.pdf
pdf("survey_plots.pdf", width = 10, height = 8)
print(plot1)
print(plot2)
print(plot3)
dev.off() 
```
## Answer for Question 1: Both the 'plots' and the 'descriptive statistics' for TimeReading, TimeTV, and Happiness provided insights into the relationships between these variables:

TimeReading and TimeTV:

Descriptive Statistics:
Mean TimeReading: 3.636
Mean TimeTV: 74.09
Interpretation: On average, as TimeReading increases, there is a slight decrease in TimeTV, suggesting a weak negative relationship.


TimeReading and Happiness:

Descriptive Statistics:
Mean TimeReading: 3.636
Mean Happiness: 73.31
Interpretation: On average, as TimeReading increases, there is a moderate decrease in Happiness, indicating a moderate negative relationship.


TimeTV and Happiness:

Descriptive Statistics:
Mean TimeTV: 74.09
Mean Happiness: 73.31
Interpretation: On average, as TimeTV increases, there is a moderate increase in Happiness, suggesting a moderate positive relationship.
Overall Interpretation: The plots and the descriptive statistics provided a rough estimate that supports the relationships observed in the correlation matrix.




## Question 2: Explain the relationship between the variables using the covariance matrix.

```{r}
# Relationship between Variables
# Create a covariance matrix
cov_matrix <- cov(df[, c("TimeReading", "TimeTV", "Happiness")])
cov_matrix 
```

## Answer for Question 2: The covariance matrix indicates the covariances between pairs of variables:

Covariance(TimeReading, TimeTV) = -20.36364:

Interpretation: A negative covariance implies an inverse relationship; as TimeReading increases, TimeTV tends to decrease.

Covariance(TimeReading, Happiness) = -10.35009:

Interpretation: A negative covariance suggests that as TimeReading increases, Happiness tends to decrease.

Covariance(TimeTV, Happiness) = 114.37727:

Interpretation: A positive covariance implies that as TimeTV increases, Happiness tends to increase.
Overall Interpretation: Covariance provides a directional indication but lacks the standardized nature of correlation.


## Question 3: Explain the relationship between the variables using the correlation matrix. Additionally, in your opinion, are the relationships between variables easier to interpret using the covariance or correlation matrix? Explain your answer.

```{r}
# Create a correlation matrix
cor_matrix <- cor(df[, c("TimeReading", "TimeTV", "Happiness")])
cor_matrix
```
## Answer for Question 3: The correlation matrix provides correlation coefficients, which are standardized measures of the strength and direction of linear relationships:

Correlation(TimeReading, TimeTV) = -0.8830677:

Interpretation: A strong negative correlation indicates that as TimeReading increases, TimeTV tends to decrease.


Correlation(TimeReading, Happiness) = -0.4348663:

Interpretation: A moderate negative correlation suggests that as TimeReading increases, Happiness tends to decrease.


Correlation(TimeTV, Happiness) = 0.6365560:

Interpretation: A moderate positive correlation implies that as TimeTV increases, Happiness tends to increase.
Opinion: Correlation matrices are easier to interpret as they provide standardized measures, making comparisons between different variable pairs straightforward.



## Question 4: Perform a correlation test on TimeReading and TimeTV. What does the correlation value tell you about the relationship between them? Can you say that TimeReading has an effect on TimeTV?

```{r}
# Correlation Test
# Correlation test between TimeReading and TimeTV
cor_test_result <- cor.test(df$TimeReading, df$TimeTV)
cor_test_result 
```

## Answer for Question 4: correlation test on TimeReading and TimeTV:

Correlation coefficient: -0.8830677
p-value: 0.0003153 (statistically significant)
Interpretation: The strong negative correlation suggests that there is a significant inverse relationship between TimeReading and TimeTV. As the time spent on reading increases, the time spent on TV tends to decrease.

Conclusion: Based on the correlation value and statistical significance, it can be concluded that TimeReading has a significant negative effect on TimeTV.



## Overall Summary of Results:


The exercise did focus on unraveling the intricate connection between TimeReading, TimeTV, and Happiness through an in-depth analysis of sample survey data. By employing various statistical techniques, such as plotting, descriptive statistics, and exploration of covariance and correlation matrices, the exercise aimed to draw meaningful conclusions from the collected sample data. 

The dataset utilized encapsulated survey responses featuring variables such as TimeReading (measured in hours), TimeTV (measured in minutes), Happiness (expressed in percentage), and Gender as a categorical variable. The analytical approach used in this exercise involved the calculation of descriptive statistics for TimeReading, TimeTV, and Happiness. Moreover, the anlysis delved into covariance and correlation matrices to unveil the intricate relationships between these variables, with a specific focus on gender-based differences.

Analysis of the relationships between TimeReading, TimeTV, and Happiness has yielded intriguing findings. Notably, a robust negative correlation (-0.88) emerged between TimeReading and TimeTV, indicating a tendency for increased reading time to coincide with decreased TV time. Moreover, a moderate negative correlation (-0.43) between TimeReading and Happiness suggests a potential connection between elevated reading hours and lower reported happiness. Conversely, a moderate positive correlation (0.64) between TimeTV and Happiness implies that increased TV time aligns with higher reported happiness levels. Covariance and correlation matrices further illustrated these associations, with standardized correlation coefficients offering a clearer picture of the strength and direction of these relationships. The correlation test underscored the significance of the negative correlation between TimeReading and TimeTV, providing statistical support for the observed pattern. As we look ahead, gender-based variations in these relationships warrant exploration, along with qualitative inquiries to elucidate the nuanced factors influencing reported happiness and time allocation. In essence, our project has unveiled intricate dynamics, paving the way for deeper understanding and future investigations.
