library(shiny)
ui <- fluidPage(
  textInput("name", "What's your name?"),
  textOutput("greeting")
)
server <- function(input, output, session) {
  output$greeting <- renderText({
    if(input$name=="Juho") {
      paste0("Hello ", input$name)
    } else if (input$name=="") {
      paste0("")
    } else {
      paste0("You are not Juho.")
    }
  })
}
shinyApp(ui, server)
