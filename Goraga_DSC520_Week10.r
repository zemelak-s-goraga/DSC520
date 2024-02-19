---
title: "Logistic Regression Model using Thoracic Surgery Binary Dataset"
author: "Zemelak Goraga"
date: "2024-02-17"
output:
  pdf_document: default
  word_document: default
Assignment: DSC520/Week10
---

```{r}
# specify CRAN mirror for R session
options(repos = c(CRAN = "https://cran.rstudio.com"))
```

```{r}
# Set the working directory to the correct path
setwd("C:\\Users\\MariaStella\\Downloads\\week10")

```

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
# Load the dataset
df<- read.csv("C:\\Users\\MariaStella\\Downloads\\week10\\thoracic.csv")
```

```{r}
head(df)
```

```{r}
# 3. Inspect the data
summary(df)
```

```{r}
# Inspect the data
str(df)
```


```{r}
# Fit a Logistic Regression Model
model <- glm(Risk1Yr ~ ., data = df, family = binomial)
```


```{r}
# Summary of the model
summary(model)
```

```{r}
# Compute the accuracy of the model
predictions <- ifelse(predict(model, type = "response") > 0.5, 1, 0)
accuracy <- mean(predictions == df$Risk1Yr) * 100
accuracy
```

# Fit a logistic regression model to the binary (binary-classifier-data.csv) dataset

```{r}
# Load the binary dataset and save it as df2
df2<- read.csv("C:\\Users\\MariaStella\\Downloads\\week10\\binary.csv")
```


```{r}
# Display the first few rows of the dataset
head(df2)
```


```{r}
# Fit logistic regression model
model_df2 <- glm(label ~ ., data = df2, family = binomial)
```


```{r}
# Summary of the model
summary(model_df2)
```


```{r}
# What is the accuracy of the logistic regression classifier?
# Predictions
predictions_df2 <- predict(model_df2, type = "response")
```


```{r}
# Convert probabilities to binary predictions
binary_predictions_df2 <- ifelse(predictions_df2 > 0.5, 1, 0)
```


```{r}
# Compute accuracy
accuracy_df2 <- mean(binary_predictions_df2 == df2$label)
print(paste("Accuracy of the model for df2 dataset:", accuracy_df2))
```


##  Analysis Report

Executive Summary:

This report presents an in-depth analysis of the Thoracic Surgery Binary Dataset, employing logistic regression to predict the risk of 1-year mortality following surgery. The dataset encompasses diverse patient attributes, including age, diagnosis, and preoperative medical conditions. Through logistic regression modeling, key predictors influencing mortality risk were identified. Notable findings from the analysis reveal significant impacts of specific preoperative medical conditions and patient demographics on the likelihood of 1-year mortality post-surgery. Among the findings, certain variables exhibited substantial effects on survival rates, with coefficient estimates providing valuable insights into the magnitude of their influence. Of particular significance, the variable PRE14OC14 emerged as the most significant factor, indicating a substantial increase in the likelihood of survival (coefficient estimate = 1.653, significant at 0.01 level). Additionally, the logistic regression model demonstrated a high accuracy rate of approximately 83.62%, underscoring its effectiveness in predicting patient outcomes. These findings provide crucial insights for healthcare professionals to identify high-risk patients and implement targeted interventions to improve postoperative outcomes.

On the other hand, the logistic regression model applied to the 'binary-classifier-data.csv' or df2 dataset reveals a significant effect of the intercept and variable y on the outcome likelihood, indicated by a statistically significant coefficient (p < 0.05). However, the variable x do not exhibit significance. The model's accuracy is 58.3%, suggesting moderate predictive performance, with potential room for improvement.


Introduction:

Thoracic surgery poses significant risks, including the potential for mortality within the first year post-surgery. Understanding the contributing factors to this risk is vital for healthcare providers to optimize patient care and outcomes. The Thoracic Surgery Binary Dataset offers insights into the preoperative characteristics of patients undergoing thoracic surgery and their subsequent risk of 1-year mortality. In this report, we analyze the dataset using logistic regression to identify significant predictors of mortality and provide recommendations for clinical practice.

Statement of the Problem:

The primary aim of this analysis is to pinpoint factors associated with an increased risk of 1-year mortality following thoracic surgery. By examining patient demographics, preoperative medical conditions, and other relevant attributes, we aim to develop a predictive model that can help healthcare providers assess patient risk and implement appropriate interventions to improve outcomes.


Methodology:

Data Inspection: Summary statistics and structure of the dataset were reviewed to understand the distribution and characteristics of variables.
Data Preparation: The Thoracic Surgery Binary Dataset was preprocessed to ensure data quality and consistency.
Exploratory Data Analysis: Descriptive statistics and data visualization techniques were utilized to explore variable distributions and detect potential relationships.
Logistic Regression Modeling: A binary logistic regression model was fitted to the dataset, with the binary outcome variable indicating the risk of 1-year mortality after surgery.
Model Evaluation: The fitted model was evaluated using statistical measures such as p-values, odds ratios, and accuracy to assess its predictive performance and identify significant predictors of mortality.

Actual Results:

The logistic regression model revealed several significant predictors of 1-year mortality following thoracic surgery. Notably, age, certain preoperative interventions, and specific preoperative medical conditions were found to be associated with mortality risk.

Age was identified as a significant predictor of 1-year mortality, with older patients being at higher risk.
Certain preoperative medical conditions were associated with an increased risk of mortality.
Some preoperative interventions, such as chemotherapy or radiation therapy, appeared to reduce the risk of mortality.
The variables with the greatest effect on the survival rate (Risk1Yr) are those with the largest absolute coefficient values:

PRE14OC14: Coefficient Estimate = 1.653 (significant at 0.01 level)
PRE9TRUE: Coefficient Estimate = 1.368 (significant at 0.05 level)
PRE17TRUE: Coefficient Estimate = 0.9266 (significant at 0.05 level)
PRE30TRUE: Coefficient Estimate = 1.084 (significant at 0.05 level)
These variables have positive coefficients, indicating that an increase in their values corresponds to an increase in the log-odds of the patient surviving past one year.

The logistic regression model achieved an accuracy of approximately 83.62% in predicting the risk of 1-year mortality after thoracic surgery.

On the other hand, the following logistic regression model summary results were obtained for the  'binary-classifier-data' datset:

Coefficients:
##              Estimate Std. Error z value Pr(>|z|)    
## (Intercept)  0.424809   0.117224   3.624  0.00029 ***
## x           -0.002571   0.001823  -1.411  0.15836    
## y           -0.007956   0.001869  -4.257 2.07e-05 ***
## ---

Accuracy:
"Accuracy of the model: 0.583444592790387"



Discussion:

The logistic regression model revealed several significant predictors of 1-year mortality following thoracic surgery. Notably, age, certain preoperative interventions, and specific preoperative medical conditions were found to be associated with mortality risk.

Age emerged as a prominent predictor of 1-year mortality, with older patients facing heightened risks. The coefficient estimate for age suggests that for each additional year of age, the log-odds of mortality increase by approximately 0.0095 units, emphasizing the critical role age plays in prognosis.

Certain preoperative medical conditions exhibited notable impacts on mortality risk. Of particular significance were PRE9 (p-value = 0.00494) and PRE17 (p-value = 0.03709). Patients presenting with these conditions experienced elevated risks of mortality, as evidenced by their respective coefficient estimates of 1.368 and 0.9266. Additionally, the presence of certain medical interventions, such as PRE30 (p-value = 0.02984), was associated with improved outcomes, as indicated by its positive coefficient estimate of 1.084.

Further emphasizing the significance of preoperative factors, variables such as PRE14 also played a pivotal role. For instance, patients with the preoperative medical condition denoted by PRE14OC14 had a notably higher likelihood of survival (coefficient estimate = 1.653, p-value < 0.01).

Moreover, the logistic regression model's high accuracy of approximately 83.62% underscores its effectiveness in predicting 1-year mortality following thoracic surgery. This level of accuracy signifies the model's ability to correctly classify patients' survival outcomes based on the identified predictors, thus providing valuable prognostic insights for healthcare providers.

These findings highlight the multifaceted nature of mortality risk in thoracic surgery patients and underscore the importance of comprehensive preoperative assessment in identifying individuals at higher risk. By leveraging the predictive capabilities of the logistic regression model and integrating these results into clinical practice, healthcare providers can optimize risk stratification strategies and tailor interventions to improve postoperative outcomes.


Furthermore, a logistic regression model was fitted using the 'binary-classifier-data.csv' dataset which was renamed as df2.csv. In this logistic regression model, the dependent variable (outcome) is "label," which appears to be binary. The independent variables (predictors) are "x" and "y."

From the summary of the model, it can be concluded that both the intercept and the variable "y" have statistically significant coefficients (p < 0.05), suggesting they have a significant impact on the likelihood of the outcome. However, the variable "x" does not exhibit statistical significance (p > 0.05), indicating it may not significantly influence the outcome.

The accuracy of the logistic regression classifier, as calculated, is approximately 58.3%. This suggests moderate predictive performance, indicating potential room for improvement or further investigation into the model's variables and structure.


Conclusions:

The analysis of the Thoracic Surgery Binary Dataset using logistic regression offers valuable insights into the factors influencing 1-year mortality following thoracic surgery. By identifying significant predictors of mortality, healthcare providers can better assess patient risk and implement targeted interventions to optimize outcomes. Continued research efforts are needed to validate predictive models and further understand mortality risk factors.

On the other hand, the logistic regression model applied to the 'binary-classifier-data.csv' dataset reveals a significant effect of the intercept and variable y on the outcome likelihood with accuracy of the model is 58.3% suggesting moderate predictive performance.


The Way Forward:

Moving forward, healthcare providers should integrate the findings from this analysis into clinical practice by incorporating risk assessment tools and guidelines for thoracic surgery patients. Continued research and data collection efforts are crucial to refining predictive models and improving our understanding of mortality risk factors. Ongoing monitoring and evaluation of patient outcomes will help identify opportunities for further optimization of care delivery and patient management strategies.
