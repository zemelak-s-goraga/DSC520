---
title: "Descriptive Analysis and Visualization of the Iris Dataset"
author: "Zemelak Goraga"
date: "2024-01-20"
output:
  pdf_document: default
  word_document: default
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
# Task 1: Load the iris dataset
library(datasets)
data(iris)
```

```{r}
# Task 2: Inspect the iris dataset
head(iris, 150)  # Display the first few rows of the dataset
summary(iris)  # Summary statistics of the dataset
```

```{r}
# Task 3: Assign the iris dataset to a new variable(df)
df <- iris
```

```{r}
# Task 4: Using dplyr to group by species and provide average sepal length
library(dplyr)
```

```{r}
average_sepal_length <- df %>%
  group_by(Species) %>%
  summarise(avg_sepal_length = mean(Sepal.Length))

# Display the summary_data dataframe
print(average_sepal_length)
```


```{r}
# Task 4: Visualization using ggplot2
library(ggplot2)

# Create a bar plot
ggplot(average_sepal_length, aes(x = Species, y = avg_sepal_length, fill = Species)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Average Sepal Length by Species", x = "Species", y = "Average Sepal Length")
```

```{r}
average_sepal_width <- iris %>%
  group_by(Species) %>%
  summarise(avg_sepal_width = mean(Sepal.Width))

# Display the summary_data dataframe
print(average_sepal_width)

```

```{r}
# Create a bar plot
ggplot(average_sepal_width, aes(x = Species, y = avg_sepal_width, fill = Species)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Average Sepal width by Species", x = "Species", y = "Average Sepal width")
```




```{r}
average_petal_length <- iris %>%
  group_by(Species) %>%
  summarise(avg_petal_length = mean(Petal.Length))

# Display the summary_data dataframe
print(average_petal_length)

```

```{r}
# Create a bar plot
ggplot(average_petal_length, aes(x = Species, y = avg_petal_length, fill = Species)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Average petal length by Species", x = "Species", y = "Average petal length")
```



```{r}
average_petal_width <- iris %>%
  group_by(Species) %>%
  summarise(avg_petal_width = mean(Petal.Width))

# Display the summary_data dataframe
print(average_petal_width)

```

```{r}
ggplot(average_petal_width, aes(x = Species, y = avg_petal_width, fill = Species)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Average petal width by Species", x = "Species", y = "Average petal width")
```



```{r}
# Task 5: Visualizing Differences in Sepal Length, Sepal Width, Petal Length, and Petal Width using histograms and box plots
# 5.1. Sepal Length
ggplot(df, aes(x = Sepal.Length, fill = Species)) +
  geom_histogram(position = "identity", alpha = 0.7, bins = 30) +
  labs(title = "Distribution of Sepal Length by Species", x = "Sepal Length", y = "Frequency") +
  facet_wrap(~Species, scales = "free")
```

```{r}
ggplot(df, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  labs(title = "Boxplot of Sepal Length by Species", x = "Species", y = "Sepal Length")
```


```{r}
# 5.2. Sepal Width

ggplot(df, aes(x = Sepal.Width, fill = Species)) +
  geom_histogram(position = "identity", alpha = 0.7, bins = 30) +
  labs(title = "Distribution of Sepal Width by Species", x = "Sepal Width", y = "Frequency") +
  facet_wrap(~Species, scales = "free")
```

```{r}
ggplot(df, aes(x = Species, y = Sepal.Width, fill = Species)) +
  geom_boxplot() +
  labs(title = "Boxplot of Sepal Width by Species", x = "Species", y = "Sepal Width")
```

```{r}
# 5.3. Petal Length

ggplot(df, aes(x = Petal.Length, fill = Species)) +
  geom_histogram(position = "identity", alpha = 0.7, bins = 30) +
  labs(title = "Distribution of Petal Length by Species", x = "Petal Length", y = "Frequency") +
  facet_wrap(~Species, scales = "free")
```

```{r}
ggplot(df, aes(x = Species, y = Petal.Length, fill = Species)) +
  geom_boxplot() +
  labs(title = "Boxplot of Petal Length by Species", x = "Species", y = "Petal Length")
```


```{r}
# 5.4. Petal Width

ggplot(df, aes(x = Petal.Width, fill = Species)) +
  geom_histogram(position = "identity", alpha = 0.7, bins = 30) +
  labs(title = "Distribution of Petal Width by Species", x = "Petal Width", y = "Frequency") +
  facet_wrap(~Species, scales = "free")
```

```{r}
ggplot(df, aes(x = Species, y = Petal.Width, fill = Species)) +
  geom_boxplot() +
  labs(title = "Boxplot of Petal Width by Species", x = "Species", y = "Petal Width")
```


## Task 6: Describing Differences Between Species

The dataset comprises three species of iris flowers: setosa, versicolor, and virginica. Descriptive statistics provide an overall view of the dataset, including the number of observations for each species. The average sepal length varies across species, with setosa having the shortest (5.006), followed by versicolor (5.936), and then virginica (6.588). In terms of sepal width, setosa has the highest average (3.428), while versicolor (2.770) and virginica (2.974) are relatively narrower. For petal length, setosa has the smallest average (1.462), followed by versicolor (4.260) and virginica (5.552), indicating an increasing trend. The average petal width also shows a similar pattern, with setosa having the smallest (0.246), followed by versicolor (1.326), and then virginica (2.026).

Visualizations with histograms and boxplots for each variable did further illustrate these differences. Sepal length tends to increase from setosa to virginica, while sepal width decreases. Petal length and width exhibit significant increases from setosa to virginica. These visualizations enhance our understanding of the variations in the selected variables among the three iris species.




