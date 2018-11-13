#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)

# Define UI for application that draws a histogram
ui <- fluidPage(
  "This is some text.",
  "This is some more text.",
  tags$h1("Level 1 Header"),
  h1(em("Level 1 Header, part 2")),
  HTML("<h1>Level 1 header, part 3<h1>"),
  a(href="https://google.ca", "Link to Google"),
  titlePanel("BC Liquor price app", 
             windowTitle = "BCL app"),
  sidebarLayout(
    sidebarPanel("Sidebar"),
    mainPanel( 
      plotOutput("price_hist"),
      tableOutput("price_table")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$price_hist <- renderPlot(ggplot2::qplot(bcl$Price))
  output$price_table <- renderTable(bcl)
}

# Run the application 
shinyApp(ui = ui, server = server)

