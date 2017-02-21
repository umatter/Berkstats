## ----foreign, message=FALSE, results=FALSE-------------------------------
# install the package called "foreign" with the following command (if not yet installed)
# install.packages("foreign", repos = 'http://cran.us.r-project.org')
library(foreign)

## ----data, warning=FALSE-------------------------------------------------
print(getwd())
sample <- read.spss("../data/sample_data.sav", to.data.frame = TRUE)

## ----view----------------------------------------------------------------
names(sample)
View(sample)

## ----clean---------------------------------------------------------------
sample <- sample[!is.na(sample$SSATScore),] # remove observations without SSATScore
sample <- sample[!is.na(sample$HSGPA),] # remove observations without HSGPA
sample <- sample[!is.na(sample$race),] # remove observations without race attribute
sample <- sample[!is.na(sample$sex),] # remove observations without gender attribute

## ----averages------------------------------------------------------------
mean(sample$ClassPrepTime)
mean(sample$OverallGPA)

## ----averages2-----------------------------------------------------------
mean(sample$female) * 100
mean(sample$africanamerican) * 100

## ----satgpa--------------------------------------------------------------
cor(x = sample$SSATScore, y = sample$OverallGPA)

## ----sathsgpa------------------------------------------------------------
cor(x = sample$HSGPA, y = sample$OverallGPA)

## ----satdiff-------------------------------------------------------------
anova(lm(SSATScore~factor(sex), data=sample)) # anova
summary(lm(SSATScore~factor(sex), data=sample)) # t-test of regression coefficient


## ----gpadiff-------------------------------------------------------------
anova(lm(OverallGPA~factor(sex), data=sample)) # anova
summary(lm(OverallGPA~factor(sex), data=sample)) # t-test of regression coefficient


## ----gpadiff_race--------------------------------------------------------
anova(lm(OverallGPA~factor(race), data=sample)) # anova
summary(lm(OverallGPA~factor(race), data=sample)) # t-test of regression coefficient


## ----reg1----------------------------------------------------------------
anova(lm(OverallGPA~factor(race) + HSGPA, data=sample)) # anova
summary(lm(OverallGPA~factor(race) + HSGPA, data=sample)) # t-test of regression coefficient


## ----fb------------------------------------------------------------------
anova(lm(OverallGPA~factor(race) + factor(sex) + HSGPA + facebookminutesselfreport, data=sample)) # anova
summary(lm(OverallGPA~factor(race) + factor(sex) + HSGPA + facebookminutesselfreport, data=sample)) # t-test of regression coefficient


