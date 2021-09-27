#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) { 
    a<-reactive(data1$value[which(data1$time==input$date1& data1$id==input$Index)])
    b<-reactive(data1$value[which(data1$time==input$date2& data1$id==input$Index)])
    output$Plotdata <- renderPlotly({
    plot_ly(data = data1, x=~time,y=~value,
            color =~id,
            mode="lines",
            type = "scatter")
})
    output$percentage <- renderText({a()/b()*100})
    

})
