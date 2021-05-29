Reproducible Pitch For Air Quality
=================================
title : "Analysis on Daily Air Quality Measurements in New York May to Sep 1973"
author: "Kumar Shaket"
date: "29-05-2021"
autosize: true

Introduction
========================================================

## Coursera Reproducible Pitch

### See the Regression Models Course Project  

- URL: *https://github.com/kumarshaket/DevelopingDataProductWeek4Assignment*
- Find here all the data that have been use for this presentation and also for the first part of the data Science Project: "First, you will create a Shiny application and deploy it on Rstudio's servers.Second, you will use Slidify or Rstudio Presenter to prepare a reproducible pitch presentation about your application."

### Find all details here
URL: *https://www.coursera.org/learn/data-products/peer/tMYrn/course-project-shiny-application-and-reproducible-pitch*

---
Table Analysis
========================================================

### AirQuality Measurement

> Daily air quality measurements in New York, May to September 1973.


### Format
> A data frame with 153 observations on 6 variables.

>|Field|Data Type|Description|
------|---------|-----------|
|Ozone |numeric	|Ozone (ppb)|
|Solar.R|numeric|Solar R (lang)|
|Wind	|numeric	|Wind (mph)
|Temp	|numeric	|Temperature (degrees F)
|Month|	numeric	|Month (1--12)
|	Day	|numeric|	Day of month (1--31)

Table Summary
========================================================

```r
library(datasets)
head(airquality, 3)
```

```
  Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2
3    12     149 12.6   74     5   3
```

```r
summary(airquality)
```

```
     Ozone           Solar.R           Wind             Temp      
 Min.   :  1.00   Min.   :  7.0   Min.   : 1.700   Min.   :56.00  
 1st Qu.: 18.00   1st Qu.:115.8   1st Qu.: 7.400   1st Qu.:72.00  
 Median : 31.50   Median :205.0   Median : 9.700   Median :79.00  
 Mean   : 42.13   Mean   :185.9   Mean   : 9.958   Mean   :77.88  
 3rd Qu.: 63.25   3rd Qu.:258.8   3rd Qu.:11.500   3rd Qu.:85.00  
 Max.   :168.00   Max.   :334.0   Max.   :20.700   Max.   :97.00  
 NA's   :37       NA's   :7                                       
     Month            Day      
 Min.   :5.000   Min.   : 1.0  
 1st Qu.:6.000   1st Qu.: 8.0  
 Median :7.000   Median :16.0  
 Mean   :6.993   Mean   :15.8  
 3rd Qu.:8.000   3rd Qu.:23.0  
 Max.   :9.000   Max.   :31.0  
                               
```

Main Code For Generating Plot
========================================================


 >formulaText <- reactive({paste("Ozone~",input$variable)})
            
  >  formulaTextPoint <- reactive(
        {
            paste("Ozone~","as.integer(",input$variable,")")
        }
    )
    
  >  fit <- reactive({
        lm(as.formula(formulaTextPoint()),data=AirData)

