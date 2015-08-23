This Shiny App developed for the Coursera John Hopkins course on Developing data products. 

The two folders contain the following:
 - source code for the slide presentation created in rPresentation
 - source code for the shiny app

The project is on Shiny User Showcase page (Shiny Apps with popular appeal):   
[Stock Values](https://r6brian.shinyapps.io/stockValues).

Also, i have created a slide deck via Rpresentation which is published here:
[Future Prices](http://rpubs.com/r6brian/futurePrices)

To run the App Locally on your mac in R, follow the following instructions: 

 - Download and set your working directory
 - Check the dependencies to see if you are missing locally any package:     
install.packages("shiny")   
install.packages('devtools')     
devtools::install_github('rstudio/shinyapps')   
install.packages('ggplot2')    

 - Load locally the necessary libraries:    
library(shiny)   
library(devtools)   
library(ggplot2)   
library(shinyapps)   
 - Type: runApp()  

