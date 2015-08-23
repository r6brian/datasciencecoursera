
futureValue <- function(inputData) {
    
    names(inputData) <- c("open","high","low","closed","volume","adjusted")
    
    stockMean <- mean(inputData$adjusted)
    
    price <- inputData[nrow(inputData),"adjusted"]
    
    percentageGain <- format(( stockMean - price )/price * 100, digits=2, nsmall=2 )
    
    
}

currentPrice <- function(inputData) {
    
    names(inputData) <- c("open","high","low","closed","volume","adjusted")
    
    stockMean <- mean(inputData$adjusted)
    
    currentPrice <- inputData[nrow(inputData),"adjusted"]
    
}