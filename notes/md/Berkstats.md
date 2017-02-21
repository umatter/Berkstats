Berkstats: Code Snippets
========================

Hello world
-----------

Your first line of R code :)!

    print("Hello world!")

    ## [1] "Hello world!"

R as a Calculator
-----------------

    2 + 2 

    ## [1] 4

    4 * 5

    ## [1] 20

    20 / 5

    ## [1] 4

    (3/5) / (4/5)

    ## [1] 0.75

Variables and Vectors
---------------------

    a <- c(1,22,333)
    names(a) <- c("Andy", "Betty", "Claire")
    print(a)

    ##   Andy  Betty Claire 
    ##      1     22    333

    print(a[3])

    ## Claire 
    ##    333

    print(a["Betty"])

    ## Betty 
    ##    22

    # calculate with variables
    b <- 5
    c <- 8
    b + c

    ## [1] 13

    # simple calculations with vectors
    a + b

    ##   Andy  Betty Claire 
    ##      6     27    338

    a * c

    ##   Andy  Betty Claire 
    ##      8    176   2664

Random Draws and Distributions
------------------------------

    normal_distr <- rnorm(1000)
    hist(normal_distr)

![](/Users/ueli/Dropbox/Teaching/Berkstats/Berkstats/notes/md/Berkstats_files/figure-markdown_strict/unnamed-chunk-4-1.png)

Compute the Mean
----------------

    a <- c(1,22,333)
    sum(a) / length(a)

    ## [1] 118.6667

    # or simpler, with an R function
    mean(a)

    ## [1] 118.6667
