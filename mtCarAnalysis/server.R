#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)
AirData <- airquality
#mpgData$am <- factor(mpgData$am,labels = c("Automatic","Manual"))

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    formulaText <- reactive({paste("Ozone~",input$variable)})
            
    formulaTextPoint <- reactive(
        {
            paste("Ozone~","as.integer(",input$variable,")")
        }
    )
    fit <- reactive({
        lm(as.formula(formulaTextPoint()),data=AirData)
    })
    output$caption<- renderText({
        formulaText()}
    )
    output$mpgBoxPlot <- renderPlot({
        boxplot(as.formula(formulaText()),data=AirData,outline=input$outliers)
    })
    output$fit <- renderPrint(
        {
            summary(fit())
        }
    )
  output$mpgPlot <- renderPlot({
      with(AirData,{plot(as.formula(formulaTextPoint()))
          abline(fit(),col=2)
                 })
  })
})
