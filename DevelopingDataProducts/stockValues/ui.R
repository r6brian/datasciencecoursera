library(shiny)

shinyUI(fluidPage(
  titlePanel(h1("A simple future value prediction of chosen stocks")),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select a stock to examine, based upon
        information collected from yahoo finance, this app will compare current day to a future value based upon your historical date range selection."),
    
      textInput("symb", "Symbol", "SPY"),
      
      helpText(div("Good Investment?", style="color:blue")),
      
      radioButtons("dateRange", label = "Date Range to Compare",
                   choices = list("1 Week" = 7, "1 Month" = 31,"1 Year" = 365),
                   selected = 7)
      

    ),
    
    mainPanel(
        tags$style(type='text/css', '#wiseInvestment {background-color: rgba(255,255,0,0.40); color: green;}'), 
        h3('GOOD INVESTMENT, You be the JUDGE!!'),
        br(),
        textOutput("dateSelection"),
        textOutput("currentStockPrice"),
        textOutput("wiseInvestment"),
        br(),br(),
        div('Your stock selection over time', style="color:red;text-align:center;font-size:250%"),
        plotOutput("plot")
    )
  )
))