library(shiny)
shinyUI(fluidPage(
  titlePanel(title=h1("Traffic Management System",align="center")),
  sidebarLayout(
    sidebarPanel(
      sliderInput("prob","1.Select the probability of a car in 1 sec",min=0.01,max=1,value=0.5,step=0.01),
      br(),
      sliderInput("n","2.Select the total time(in sec) for which you want to count the cars",min=1000,max=10000,value=5000),
      br(),
      sliderInput("seed","3.Select seed",min=100,max=1000,value=500)
    ),
    mainPanel(
      tabsetPanel(type="tab",
        tabPanel("Data",verbatimTextOutput("data")),
        tabPanel("Regression Model",verbatimTextOutput("regression")),
        tabPanel("Actuals vs Fits Graph",plotOutput("graph")),
        tabPanel("Goodness of Fit",verbatimTextOutput("test"))
      )
    )
  )
)
)