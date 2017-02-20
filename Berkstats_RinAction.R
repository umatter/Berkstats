#' ---
#' title: "Exercises: R in Action"
#' author: "Ulrich Matter"
#' output: html_document
#' ---
#' 
## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

#' 
#' ## Data: Student's GPA
#' 
#' The data used in the exercices are based on .....
#' The data file is in sav-format (SPSS). We can read data from other stats packages into R with the **foreign** library.
#' Thus, first, we load and install this R-package:
#' 
## ----foreign, message=FALSE, results=FALSE-------------------------------
install.packages("foreign", repos = 'http://cran.us.r-project.org')
library(foreign)

#' 
#' Read the data into R as follows:
## ----data, warning=FALSE-------------------------------------------------
sample <- read.spss("data/sample_data.sav", to.data.frame = TRUE)

#' 
#' Have a looka at the data set:
## ----view----------------------------------------------------------------
names(sample)
View(sample)

#' 
#' "Clean" the data
## ----clean---------------------------------------------------------------
sample <- sample[!is.na(sample$SSATScore),] # remove observations without SSATScore
sample <- sample[!is.na(sample$HSGPA),] # remove observations without HSGPA
sample <- sample[!is.na(sample$race),] # remove observations without race attribute
sample <- sample[!is.na(sample$sex),] # remove observations without gender attribute

#' 
#' 
#' 
#' ## Descriptives
#' 
#' Average time studying and average college GPA
#' 
## ----averages------------------------------------------------------------
mean(sample$ClassPrepTime)
mean(sample$OverallGPA)

#' 
#' Percentages of female, African-American?
## ----averages2-----------------------------------------------------------
mean(sample$female) * 100
mean(sample$africanamerican) * 100

#' 
#' 
#' ## Correlations
#' 
#' What is the relationship between SAT Score and College GPA?
#' 
## ----satgpa--------------------------------------------------------------
cor(x = sample$SSATScore, y = sample$OverallGPA)

#' 
#' What is the relationship between High School GPA and College GPA?
## ----sathsgpa------------------------------------------------------------
cor(x = sample$HSGPA, y = sample$OverallGPA)

#' 
#' Which one predicts more of the variance in College GPA?
#' 
#' 
#' ## Hypothesis test
#' 
#' Is there a difference in SAT scores between men and women?
## ----satdiff-------------------------------------------------------------
anova(lm(SSATScore~factor(sex), data=sample)) # anova
summary(lm(SSATScore~factor(sex), data=sample)) # t-test of regression coefficient


#' 
#' Is there a difference in College GPA between men and women?
## ----gpadiff-------------------------------------------------------------
anova(lm(OverallGPA~factor(sex), data=sample)) # anova
summary(lm(OverallGPA~factor(sex), data=sample)) # t-test of regression coefficient


#' 
#' 
#' Are there differences in College GPA among members of different racial groups?
## ----gpadiff_race--------------------------------------------------------
anova(lm(OverallGPA~factor(race), data=sample)) # anova
summary(lm(OverallGPA~factor(race), data=sample)) # t-test of regression coefficient


#' 
#' 
#' 
#' ## Multiple regression
#' 
#' Controlling for pre-existing ability, are there differences in College GPA among members of different racial groups?
## ----reg1----------------------------------------------------------------
anova(lm(OverallGPA~factor(race) + HSGPA, data=sample)) # anova
summary(lm(OverallGPA~factor(race) + HSGPA, data=sample)) # t-test of regression coefficient


#' 
#' Does time spent on Facebook predict Overall College GPA when controlling for sex, race, and prior academic ability?
## ----fb------------------------------------------------------------------
anova(lm(OverallGPA~factor(race) + factor(sex) + HSGPA + facebookminutesselfreport, data=sample)) # anova
summary(lm(OverallGPA~factor(race) + factor(sex) + HSGPA + facebookminutesselfreport, data=sample)) # t-test of regression coefficient


#' 