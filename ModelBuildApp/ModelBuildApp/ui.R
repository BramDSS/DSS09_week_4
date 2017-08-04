library(shiny)
library(markdown)

# Define UI for application 
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Build a model for mpg"),
    
    # Sidebar with checkbox input for variables to be used in linear model 
    sidebarLayout(
        sidebarPanel(
            checkboxGroupInput("variable", "Select covariates for the model:",
                               c("Cylinders" = "cyl",
                                 "Displacement (cubic inches)" = "disp",
                                 "Gross horsepower" = "hp",
                                 "Rear axle ratio" = "drat",
                                 "Weight (1000 lbs)" = "wt",
                                 "1/4 mile time" = "qsec",
                                 "V/S" = "vs",
                                 "Transmission (automatic or manual)" = "am",
                                 "Number of forward gears" = "gear",
                                 "Number of carburetors" = "carb"),
                               selected = c("am")
            )
        ),
        
        # Show documentation, the selected data, the fit and some plots
        mainPanel(
            tabsetPanel(type = "tab",
                        tabPanel("Documentation", includeMarkdown("docds09wk4.md")),
                        tabPanel("Summary data", verbatimTextOutput("Summary")),
                        tabPanel("Model fit", verbatimTextOutput("Model")),
                        tabPanel("Plots",
                                 h3("Predicted versus real miles per gallon"),
                                 plotOutput("ModelPlot"),
                                 h3("Residual plots"),
                                 plotOutput("ResidualPlot"))
            )
            
        )
    )
))

