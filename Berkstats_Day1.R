

## ------------------------------------------------------------------------
print("Hello world")

## ------------------------------------------------------------------------
a <- c(10,22,33, 22, 40)
names(a) <- c("Andy", "Betty", "Claire", "Daniel", "Eva")
a
a[3]
a["Claire"]


## ------------------------------------------------------------------------
# own implementation: use R-function for summing up the elements in a vector
# and getting the number of elements in a vector
sum(a) / length(a)

# or use the function delivered with the R installation
mean(a)


## ------------------------------------------------------------------------

# own implementation
# 1) sort the vector in ascending order (if not yet ordered)
sorted_a <- sort(a) 
# 2) get the index of the element in the middle (i.e., the [(N + 1)/2]th element)
middle <- (length(sorted_a)+1)/2 
# 3) check whether the index of the element we get is a fraction
is_fraction <- (middle %% 1) != 0 
# 4) if so, take the mean of the element above and below as median
#    else, take that middle element as median
if (is_fraction) {
     (sorted_a[floor(middle)] + sorted_a[ceiling(middle)]) / 2
} else {
     sorted_a[middle]
}

# function delivered with R-installation
median(a)


## ------------------------------------------------------------------------
# count occurrences 
counts <- table(a)
# which value occurs most often
which.max(counts)

# write your own mode-function:
mymode <- function(x) {
     counts <- table(x)
     x_mode <- as.numeric(names(which.max(counts)))
     
     return(x_mode)
}

# apply your own mode-function:
mymode(a)


## ---- echo=TRUE----------------------------------------------------------
range(a)
var(a)
sd(a)


## ---- echo=TRUE----------------------------------------------------------
# own implementaion
sqrt(sum((a-mean(a))^2) / (length(a) - 1))
# function delivered with R-installation
sd(a)


## ------------------------------------------------------------------------
normal_distr <- rnorm(1000)
hist(normal_distr)

## ---- echo=TRUE----------------------------------------------------------
# draw a random sample from a normal distribution with a large standard deviation
largevar <- rnorm(10000, mean = 5000, sd = 5)
# draw a random sample from a normal distribution with a small standard deviation
littlevar <- rnorm(10000, mean = 5000, sd = 1)

# visualize the distributions of both samples with a density plot
plot(density(littlevar), col = "blue", 
     xlim=c(min(largevar), max(largevar)), main="Income Distribution")
lines(density(largevar), col = "red")


## ---- echo=TRUE----------------------------------------------------------
# Install the R-package called "moments" with the following command (if not installed yet):
# install.packages("moments")

# load the package
library(moments)


## ---- echo=TRUE----------------------------------------------------------
# draw a random sample of simulated data from a normal distribution
# the sample is of size 1000 (hence, n = 1000)
sample <- rnorm(n = 1000)

# plot a histogram and a density plot of that sample
# note that the distribution is neither strongly positively nor negatively skewed
# (this is to be expected, as we have drawn a sample from a normal distribution!)
hist(sample)
plot(density(sample))

# now compute the skewness
skewness(sample)

# Now we intentionally change our sample to be strongly positively skewed
# We do that by adding some outliers (observations with very high values) to the sample 
sample <- c(sample, (rnorm(200) + 2), (rnorm(200) + 3))

# Have a look at the distribution and re-calculate the skewness
plot(density(sample))
skewness(sample)


#


## ------------------------------------------------------------------------
# draw a random sample of simulated data from a normal distribution
# the sample is of size 1000 (hence, n = 1000)
sample <- rnorm(n = 1000)

# plot the density & compute the kurtosis
plot(density(sample))
kurtosis(sample)

# now lets remove observations from the extremes in this distribution
# we thus intentionally alter the distribution to have less mass in its tails
sample <- sample[ sample > -0.6 & sample < 0.6]

# plot the distribution again and see how the tails of it (and thus the kurtosis has changed)
plot(density(sample))

# re-calculate the kurtosis
kurtosis(sample)
# as expected, the kurtosis has now a lower value


## ---- echo=TRUE----------------------------------------------------------
# own implementation
sum((sample-mean(sample))^3) / ((length(sample)-1) * sd(sample)^3)

# implementation in moments package
skewness(sample)

## ---- echo=TRUE----------------------------------------------------------
# own implementation
sum((sample-mean(sample))^4) / ((length(sample)-1) * sd(sample)^4)

# implementation in moments package
kurtosis(sample)

