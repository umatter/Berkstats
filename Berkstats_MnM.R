#' ---
#' title: "M & M Histogram"
#' author: "Ulrich Matter"
#' date: "2/19/2017"
#' output: html_document
#' ---
#' 
## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

#' 
#' ## Preparations: Install/load packages
#' 
## ------------------------------------------------------------------------
# Install required packages (if not yet installed)
# install.packages(c("gsheet", "ggplot2", "data.table"))

# Load required packages
library(gsheet)
library(ggplot2)
library(data.table)


#' 
#' ## Fetch data from our Google-spreadsheet
#' 
## ------------------------------------------------------------------------
# Fetch data from google docs
URL <- 'https://docs.google.com/spreadsheets/d/1rQZasD4o2aLTf3-sfcFt0TMiRJudWOR_qW7ZXgw8Jt8/edit?usp=sharing'
mnm_data <- gsheet2tbl(URL)

#' 
#' 
#' ## Example I: Plot a simple histogram for total counts
## ----ex1-----------------------------------------------------------------
# Plot histogram of total occurrences
hist(mnm_data$Total, main = "M&M Bag Histogram", xlab = "Count")


#' 
#' ## Example II: Plot a histogram for each color
#' Note: here we use **ggplot2**, a powerful R-extension to visualize data.
## ----ex2-----------------------------------------------------------------
# II ) FREQUENCY DISTRIBUTION OF M & Ms PER COLOR ---------------------------------------------------------------

# get data for each color in 'long' format
mnm_data <- as.data.table(mnm_data[, -"Total"])
mnm_long <- melt(mnm_data, id.vars = "Name")
names(mnm_long) <- c("Name", "Color", "Count")

# Plot counts per color
ggplot(data = mnm_long, aes(x = Count, group=1)) +
    geom_histogram(fill = "steelblue")+
    facet_wrap(~Color) +
    theme_light()

#' 
