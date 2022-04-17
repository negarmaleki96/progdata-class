# Load libraries, data -----------------------------------------------
WH <- read.csv(here::here("data","WorldHappiness.csv"))

# Page 1 - Introduction ----------------------------------------------
intro_panel <- tabPanel(
  "Introduction",
  
  titlePanel("World Happiness Report 2015-2022"),
  
  img(src = "WH.jpg", height = 600, width = 800),
  br(), br(),
  
  p("This is an R Shiny App which shows the World Happiness in 2015-2022
    in interactive visualization. In the second tab, I used world happiness 
    data from Kaggle in order to explore happiness ranking in countries of each region."),
  
  p(a(href = "https://www.kaggle.com/datasets/shivkumarganesh/world-happiness-report-20152022", "Data Source (Kaggle)"))
)

# Page 2 - Vizualization -------------------------------------------
select_values <- colnames(WH)
select_values <- select_values[! select_values %in% c('Country', 'Region')] # remove unwanted columns

sidebar_content <- sidebarPanel(
  selectInput(
    "y_var",
    label = "Y Variable",
    choices = select_values,
    selected = 'Happiness.Rank'
  )
)

main_content <- mainPanel(
  plotOutput("plot")
)

second_panel <- tabPanel(
  "Visualization",
  titlePanel("Which country in which region get the lowest/highest happiness rank?"),
  p("Use the selector input below to choose which variable you would like to see."),
  sidebarLayout(
    sidebar_content, main_content
  )
)


# User Interface -----------------------------------------------------
ui <- navbarPage(
  "World Happiness",
  intro_panel,
  second_panel
)