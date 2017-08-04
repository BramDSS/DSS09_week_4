---
title       : Modelbuild app
subtitle    : Pitch for shiny app "Modelbuild"
author      : Bram van Dam
date        : August 4, 2017
job         : Developing data products
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]     # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---


## Overview

For the course 9, "Developing Data Products", which is part of the Data science specialization on Coursera, a web app was created with the Shiny package. The idea behind it stems from course 7 (Regression Models) in which a model had to be build for the (dependent) variable `mpg` (miles per gallon) of the `mtcars` dataset.  
At that stage in the specialization, it meant just typing another model definition and evaluating the result over and over again. This got kind of boring, and the app makes this process easier and more "clickable".

The app can be found is hosted at shinyapps and is called [ModelBuildApp](https://bramdss.shinyapps.io/ModelBuildApp/).  
Because of the origin in the Regression Models course, the app is made specific for the [mtcars](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/mtcars.html) dataset.


--- .class #id

## What the app does

The key question then was whether type of transmission (variable `am`, automatic of manual) is a factor that influences `mpg`. Instead of typing a model definition (or: typing the covariates and retreiving the model fit statistics and plot commands), with the app the covariates can be chosen by clicking and immediately the results are shown.

- In the sidebar panel the variables can be chosen
- In the main panel the following tabs can be viewed:
  + *Documentation* to view a short description of the app (and instructions)
  + *Summary* data to view some summary statistics on the variables in the model
  + *Model fit* to view the model coefficients and statistics like $R^2$
  + *Plots* to view residual plots and a plot of predicted mpg versus mpg from the data set.

--- .class #id .smallcode

## Example calculation

Below an example calcuation is made with `mpg` (miles per gallon) as dependent variable and `am` (transmission type) and `wt` (weight) as covariates.

```r
mtcarsSelect <- mtcars[, c("mpg", "am", "wt")]
modelFit <- lm(mpg ~ ., data = mtcarsSelect)
# Show statistics of the fitted model
summary(modelFit)
```

```
## 
## Call:
## lm(formula = mpg ~ ., data = mtcarsSelect)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -4.5295 -2.3619 -0.1317  1.4025  6.8782 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 37.32155    3.05464  12.218 5.84e-13 ***
## am          -0.02362    1.54565  -0.015    0.988    
## wt          -5.35281    0.78824  -6.791 1.87e-07 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 3.098 on 29 degrees of freedom
## Multiple R-squared:  0.7528,	Adjusted R-squared:  0.7358 
## F-statistic: 44.17 on 2 and 29 DF,  p-value: 1.579e-09
```

--- .class #id .smallcode

## Slide with Plot

The plot of predicted versus data mpg is as follows.

```r
# Plot predicted values (by model) against observed values
pred <- predict(modelFit)
plot(x = mtcarsSelect$mpg, y = pred, xlab = "MPG data",
     ylab = "MPG predict", bty = "n", pch = 16,
     xlim = c(10, 35), ylim = c(10, 35))
```

![plot of chunk plotje](figure/plotje-1.png)
