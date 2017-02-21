
## ------------------------------------------------------------------------
# Install required packages (if not yet installed)
# install.packages(c("gsheet", "ggplot2", "data.table"))

# Load required packages
library(gsheet)
library(ggplot2)
library(data.table)


## ------------------------------------------------------------------------
# Fetch data from google docs
URL <- 'https://docs.google.com/spreadsheets/d/1rQZasD4o2aLTf3-sfcFt0TMiRJudWOR_qW7ZXgw8Jt8/edit?usp=sharing'
mnm_data <- gsheet2tbl(URL)

## ----ex1-----------------------------------------------------------------
# Plot histogram of total occurrences
hist(mnm_data$Total, main = "M&M Bag Histogram", xlab = "Count")


## ----ex2-----------------------------------------------------------------
# II ) FREQUENCY DISTRIBUTION OF M & Ms PER COLOR ---------------------------------------------------------------

# get data for each color in 'long' format
mnm_long <- as.data.table(mnm_data[,-ncol(mnm_data)])
mnm_long <- melt(mnm_long, id.vars = "Name")
names(mnm_long) <- c("Name", "Color", "Count")

# Plot counts per color
ggplot(data = mnm_long, aes(x = Count, group=1)) +
    geom_histogram(fill = "steelblue", bins = 5)+
    facet_wrap(~Color) +
    theme_light()

## ---- echo=TRUE----------------------------------------------------------
# compute the average number (i.e., the mean) of M&Ms per bag in our sample
mean(mnm_data$Total)

# compute the average number for each color
# a) select only those columns containing data on the count of M&Ms of a specific color
# (i.e, columns 2 to 7)
mnm_colors <- mnm_data[, 2:7]
# b) use the already implemented R-function 'colMeans' to compute the mean for each column (color)
colMeans(mnm_colors)
# or alternatively use sapply (see ?sapply for what this function does!)
sapply(mnm_colors, mean)


## ---- echo=TRUE----------------------------------------------------------

# for the total number of M&Ms
var(mnm_data$Total)
sd(mnm_data$Total)

# per color
sapply(mnm_colors, var)
sapply(mnm_colors, sd)


## ------------------------------------------------------------------------
# for the total number of M&Ms
range(mnm_data$Total) # the range
median(mnm_data$Total) # the median
mymode(mnm_data$Total) # the mode (NOTE: we have implemented this funciton ourselves, see above!)

# for each color
sapply(mnm_colors, range)
sapply(mnm_colors, median)
sapply(mnm_colors, mymode)

