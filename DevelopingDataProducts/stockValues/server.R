# server.R

library(quantmod)
source("futureValue.R")


shinyServer(function(input, output) {
    
    stockData <- reactive({
        
            getSymbols(input$symb, src = "yahoo", 
                   from = as.Date(as.character(Sys.Date()))-as.numeric(input$dateRange),
                   to = as.character(Sys.Date()),
                   auto.assign = FALSE)

    })

    
    output$dateSelection <- renderText({ 
        paste("Based upon your selection of",input$dateRange,"days")
    })
    
    output$currentStockPrice <- renderText({ 
        paste("and the current price of ",input$symb,"being",currentPrice(stockData()))
    })

    output$wiseInvestment <- renderText({ 
        paste("you could potential return ",futureValue(stockData()),"% in the same amount of time, if you act today :-)" )
    })
        
    output$plot <- renderPlot({    
        chartSeries(stockData(), theme = chartTheme("white"), 
                    type = "line", TA = NULL)
    })

})