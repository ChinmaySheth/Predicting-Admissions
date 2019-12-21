# Predicting-Admissions

## Introduction

In this exercise, I'm analyzing a university dataset which contains information about student admissions. I am hoping to build a generalized linear model in order to reliably predict a student's admission to the university using SAS.

## Dataset

The dataset that I am using was obtained from Kaggle and it contains data on university admission data. The dataset contains the following columns:

1. Serial No.
2. GRE Score
3. TOEFL Score
4. University Rating
5. SOP
6. LOR
7. CGPA
8. Research
9. Chance of Admit

The dataset contains 400 entries with no data missing. The only categorical variable is Research, as Serial No. is not considered, and the rest of the variables are continuous. 

## Results

Using SAS procedures, I was able to develop a model which explained the predicted results 4.95% more accurately than the base model with fewer covariates being used, thus resulting in less computational power for future use and increased accuracy.

The full report is presented in the PDF file in the root folder.
