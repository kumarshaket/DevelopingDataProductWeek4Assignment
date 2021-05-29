#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    titlePanel("Impact Analysis of Each Variables On Ozone"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("variable","Variable:",c(
                                                 "Solar Radiation" = "Solar.R",
                                                 "Wind" = "Wind",
                                                 "Temp" = "Temp",
                                                 "Month" = "Month",
                                                 "Day" = "Day")),
            checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
        ),

        mainPanel(
            h3(textOutput("caption")),
            tabsetPanel(type="tabs",
                        tabPanel("BoxPanel",plotOutput("mpgBoxPlot")),tabPanel("Regression Model",plotOutput("mpgPlot"),verbatimTextOutput("fit")),
                        tabPanel("About the Data Set",
                                 
                                 h3("Regression Models Course Project (from Coursera)"),
                                 helpText("Daily air quality measurements in New York, May to September 1973.
"),
                                 p("A data frame with 153 observations on 6 variables.les."),
                                                        ),
                        tabPanel("More Data Detail",
                                 h2("New York Air Quality Measurements"),
                                 hr(),
                                 h3("Description"),
                                 helpText("Daily air quality measurements in New York, May to September 1973."),
                                 h3("Format"),
                                 p("A data frame with 153 observations on 6 variables."),
                                 
                                 p("  [, 1]   Ozone         numeric	Ozone (ppb)"),
                                 p("  [, 2]	 Solar.R	numeric	Solar R (lang)"),
                                 p("  [, 3]	 Wind	numeric	Wind (mph)"),
                                 p("  [, 4]	 Temp	numeric	Temperature (degrees F)"),
                                 p("  [, 5]	 Month	numeric	Month (1--12)"),
                                 p("  [, 6]	 Day	numeric	Day of month (1--31)"),
                                 h3("Please Note"),
                                 p("you can load above dataset by caling data(airquality)" ))
                    
                        )
    
            
            
                )
    )
))
