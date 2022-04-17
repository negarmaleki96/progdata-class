install.packages("shiny")
library("shiny")

# Load data and libraries
source("ui.R")
source("server.R")
shinyApp(ui = ui, server = server)
