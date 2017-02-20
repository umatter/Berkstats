#' ---
#' title: "Berkstats Day 1: First Steps in R"
#' author: "Ulrich Matter"
#' date: "2/19/2017"
#' output: html_document
#' ---
#' 
## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

#' 
#' 
#' 
#' 
#' The R-Console
#' ========================================================
## ------------------------------------------------------------------------
print("Hello world")

#' 
#' 
#' Variables and Vectors
#' ========================================================
## ------------------------------------------------------------------------
a <- c(10,22,33, 22, 22)
names(a) <- c("Andy", "Betty", "Claire", "Daniel", "Eva")
a
a[3]
a["Claire"]


#' 
#' 
#' 
#' Compute the Mean
#' ========================================================
#' 
## ------------------------------------------------------------------------
a
sum(a) / length(a)

# or use the predefined function
mean(a)


#' 
#' 
#' Compute the Median
#' ========================================================
#' 
## ------------------------------------------------------------------------

middle <- length(a)/2
a[middle]


#' 
#' 
#' Compute the Mode
#' ========================================================
#' 
## ------------------------------------------------------------------------
# count occurrences 
counts <- table(a)
# which value occurs most often
which.max(counts)


#' 
#' 
#' 
#' Measures of Variability
#' ========================================================
#' 
## ---- echo=TRUE----------------------------------------------------------
range(a)
var(a)
sd(a)


#' 
#' 
#' 
#' Compute the Standard Deviation
#' ========================================================
#' 
## ---- echo=TRUE----------------------------------------------------------
sqrt(sum((a-mean(a))^2) / (length(a) - 1))
sd(a)


#' 
#' 
#' 
#' Random Draws and Distributions
#' ========================================================
#' 
## ------------------------------------------------------------------------
normal_distr <- rnorm(1000)
hist(normal_distr)

#' 
#' 
#' Why variability matters
#' ========================================================
#' 
## ---- echo=TRUE----------------------------------------------------------

largevar <- rnorm(10000, mean = 5000, sd = 5)
littlevar <- rnorm(10000, mean = 5000, sd = 1)
plot(density(littlevar), col = "blue", 
     xlim=c(min(largevar), max(largevar)), main="Income Distribution")
lines(density(largevar), col = "red")


#' 
#' 
#' Skewness and Kurtosis
#' ========================================================
#' 
## ---- echo=TRUE----------------------------------------------------------
library(moments)
kurtosis(largevar)
skewness(largevar)
largevar[largevar>mean(largevar)] <- largevar[largevar>mean(largevar)] + 3000
skewness(largevar)

#' 
