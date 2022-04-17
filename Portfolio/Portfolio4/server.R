# Load libraries, data ------------------------------------------------
library(XML)
library(reshape2)
library(plyr)
library(ggplot2)

LD <- read.csv(here::here("data", "data", "Cleaned_Laptop_data.csv"))
LD <- LD[!duplicated(LD$brand), ]

# Create server -------------------------------------------------------
server <- function(input, output) {
  output$plot <- renderPlot({
    # sort by class
    LD$brand <- factor(LD$brand, 
                         levels = LD$brand[order(LD$os)])
    
    ggplot(data=LD, aes_string(x='brand', y=input$y_var, fill="os")) +
      geom_bar(stat="identity", width=0.8) +
      #scale_x_discrete(guide = guide_axis(n.dodge=3))+
      scale_y_discrete(guide = guide_axis(n.dodge=2))+
      labs(x="Brand", y=input$y_var) + coord_flip()
    
  })
}

