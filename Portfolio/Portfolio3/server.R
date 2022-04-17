# Load libraries, data ------------------------------------------------
library(XML)
library(reshape2)
library(plyr)
library(ggplot2)

WH <- read.csv(here::here("data","WorldHappiness.csv"))


# Create server -------------------------------------------------------
server <- function(input, output) {
  output$plot <- renderPlot({
    # sort by class
    WH$Country <- factor(WH$Country, 
                        levels = WH$Country[order(WH$Region)])
    
    ggplot(data=WH, aes_string(x='Country', y=input$y_var, fill="Region")) +
      geom_bar(stat="identity", width=0.8) +
      scale_x_discrete(guide = guide_axis(check.overlap = TRUE))+
      labs(x="Country", y=input$y_var) + coord_flip()
    
  })
}