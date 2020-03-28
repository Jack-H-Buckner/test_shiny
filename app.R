# test shiny app
library(shiny)
library(ggplot2)

data <- read.csv("data/test_data.csv")

ui  <- fluidPage(
                      titlePanel(
                        h1("simple plot", style = {'font'})
                        
                      ), 
                      mainPanel(
                        
                        plotOutput(outputId ="plot1", height = 600)
                        
                      ))

server <- function(input,output){
  
  
  output$plot1 <- renderPlot({
    ggplot(data, aes(x = x, y = y))+
      geom_point()
  })
  
}

app <- shinyApp(ui, server)