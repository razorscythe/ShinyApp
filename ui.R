#This is app to check the EUstock data and predict the mean prices 
#and see the percentage change in index in the given time period. 
# 
#

library(shiny)
library(tidyverse)
library(plotly)
library(tsbox)
data("EuStockMarkets")
#converting time series data into data frame
data1 <- ts_data.frame(EuStockMarkets)
data1$time <- strftime(data1$time, "%Y-%m-%d")


# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("EU stocks Data"),

    # Sidebar for selecting the index and date range
    sidebarLayout(
        sidebarPanel(
            h1("Enter the following values:"),
            selectInput(inputId = "Index", 
                        label = "Index", 
                        choices = unique(data1$id)
                        ),
            dateInput(inputId = "date1", label = "start date",
                      min =  "1991-07-01", 
                      max =  "1998-08-24",
                      value = "1991-07-01",
                      ),
            dateInput(inputId = "date2", label = "end date",
                      min = "1991-07-01",
                      max = "1998-08-24",
                      value = "1998-08-24")
        ),
#main panel to show the plot and percentage change
        mainPanel(
            h1("Plot:"),
            plotlyOutput("Plotdata"),
            h2("Percentage Change:"),
            textOutput("percentage")
        )
    )
))
