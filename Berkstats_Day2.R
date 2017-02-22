## ------------------------------------------------------------------------
# A vector containing numeric (or integer) values
numeric_vector <- 10:20
numeric_vector[2]
numeric_vector[2:5]

# A string vector ('a vector containing text')
string_vector <- c("a", "b", "c")
string_vector[-3]

# Lists
# A list can contain different types of elements, for example a numeric vector and a string_vector
mylist <- list(numbers = numeric_vector, letters = string_vector)
mylist

# We can access the elements of a list in various ways
# with the element's name
mylist$numbers
mylist["numbers"]
# via the index
mylist[1]
# with [[]] we can access directly the content of the element
mylist[[1]]

# lists can also be nested (list of lists of lists....)
mynestedlist <- list(a = mylist, b = 1:5)

## ------------------------------------------------------------------------

# matrices
mymatrix <- matrix(numeric_vector, nrow = 4)
# get the second row
mymatrix[2,]
# get the first two columns
mymatrix[, 1:2]

# data frames ("lists as columns")
mydf <- data.frame(Name = c("Alice", "Betty", "Claire"), Age = c(20, 30, 45))
mydf
# select the age column
mydf$Age
mydf[, "Age"]
mydf[, 2]
# select the second row
mydf[2,]



## ------------------------------------------------------------------------
# have a look at what kind of object you are dealing with
class(mydf)
class(mymatrix)

# have a closer look at the data structure
str(mydf)

## ------------------------------------------------------------------------
# The Z-Score formula in R
# define the parameter values
X <- 10
mu <- 12
sigma <- 2
# compute the z-score
z <- (X - mu) / sigma
z

# Plot the Standard Normal Distribution
plot(function(x) dnorm(x), -4, 4, main = "Normal density")

# Get the area under the curve (probability of observing a value of a certain size)
pnorm(-1)
pnorm(-2)
pnorm(-1) - pnorm(-2)


## ------------------------------------------------------------------------
# forumla for standard error
# define parameter values
s <- 20
n <- 100
# compute the standard error (of the mean)
se <- s / sqrt(n)
se

# write your own standard error (of the mean) function
se <- function(x) {
     
     s <- sd(x)
     n <- length(x)
     se <- s / sqrt(n)
     
     return(se)
}

# draw a random sample of size 100 and compute the mean and its estimated standard error
mysample <- rnorm(100)
mean(mysample)
se(mysample)

# repeat this but this time with a larger sample
mysample <- rnorm(1000)
mean(mysample)
se(mysample)



## ------------------------------------------------------------------------
# define parameters
mu <- 39000
sample_mean <- 37000
sample_sd <- 6150
n <- 100

# calculate the  standard error of the sample mean
se <- sample_sd / sqrt(n)

# compute the t-statistic (and compare it with the critical value)
t <- (sample_mean - mu) / se

# look up the p-value 
# (the fraction of the mass under the standard normal distribution)
2*pnorm(-abs(t))


## ------------------------------------------------------------------------
# I) Compute the t-value step by step with our own implementation while controlling the properties of the distribution we are drawing a sample form

# define size of sample
n <- 100
# draw the random sample from a normal distribution with mean 10 and sd 2
sample <- rnorm(n, mean = 10, sd = 2)

# compute the sample mean
sample_mean <- mean(sample)
# compute the sample sd
sample_sd <- sd(sample)
# estimated standard error of the mean
mean_se <- sample_sd/sqrt(length(sample))

# compute the t-statistic for the null hypothesis: H0: mu = 9
t <- (sample_mean - 10) / mean_se
t 

# get the p value
2*pnorm(-abs(t))


# II) Apply the R-function t.test
t.test(sample, mu = 10)


