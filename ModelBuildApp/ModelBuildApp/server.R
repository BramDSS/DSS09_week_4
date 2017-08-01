library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    # Make selection of covariates from mtcars dataset
    mtcarsSelect <- reactive({
        mtcars[, c("mpg", input$variable)]
    })
    
    # fit a linear model
    modelFit <- reactive({
        modelFit <- lm(mpg ~ ., data = mtcarsSelect())
    })
    
    # Show statistics of the fitted model
    output$Model <- renderPrint({
        summary(modelFit())
    })
    
    # Make summary of variables in subsetted dataframe
    output$Summary <- renderPrint({
        summary(mtcarsSelect())
    })
    
    # Plot predicted values (by model) against observed values
    output$ModelPlot <- renderPlot({
        pred <- predict(modelFit())
        plot(x = mtcarsSelect()$mpg, y = pred, xlab = "MPG data",
             ylab = "MPG predict", bty = "n", pch = 16,
             xlim = c(10, 35), ylim = c(10, 35))
        
    })
    
    # Plot residual plots for analysis
    output$ResidualPlot <- renderPlot({
        par(mfrow=c(2,2))
        plot(modelFit())
    })
    
})
