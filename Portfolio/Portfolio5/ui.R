# Load libraries, data -----------------------------------------------
LD <- read.csv(here::here("data", "data", "Cleaned_Laptop_data.csv"))
LD[!duplicated(LD$brand), ]

# Page 1 - Introduction ----------------------------------------------
intro_panel <- tabPanel(
  "Introduction",
  
  titlePanel("Laptop Specs and latest price"),
  
  img(src = "Best-Laptop-Brand.webp", height = 400, width = 600),
  br(), br(),
  
  p("This is an R Shiny App which shows laptop brands against different features each contains.
    In the second tab, I used Laptop Specs and latest price data from Kaggle in order to 
    explore different brands in their operating systems."),
  
  p(a(href = "https://www.kaggle.com/datasets/kuchhbhi/latest-laptop-price-list?datasetId=2037622&language=Python", "Data Source (Kaggle)"))
)

# Page 2 - Vizualization -------------------------------------------
select_values <- colnames(LD)
select_values <- select_values[! select_values %in% c('brand', 'os')] # remove unwanted columns

sidebar_content <- sidebarPanel(
  selectInput(
    "y_var",
    label = "Variables",
    choices = select_values,
    selected = 'model'
  )
)

main_content <- mainPanel(
  plotOutput("plot")
)

second_panel <- tabPanel(
  "Visualization",
  titlePanel("What are the different features for a laptop?"),
  p("Use the selector input below to choose which variable you would like to see."),
  sidebarLayout(
    sidebar_content, main_content
  )
)


# User Interface -----------------------------------------------------
ui <- navbarPage(
  "Laptop Price",
  intro_panel,
  second_panel
)