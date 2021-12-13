library(shiny)

ui <- fluidPage(
  sliderInput("x", label = "If x is", min = 1, max = 50, value = 30),
  sliderInput("y", label = "and y is", min = 1, max = 50, value = 30),
  "then x times y is",
  textOutput("product")
)

server <- function(input, output, session) {
  output$product <- renderText({ 
    input$x * input$y # paste0 ei ole tarpeen. Sen tarvii vain jos pitää liittää tekstejä tms. yhteen.
  })
}

shinyApp(ui, server)