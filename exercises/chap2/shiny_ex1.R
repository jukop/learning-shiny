# https://mastering-shiny.org/basic-ui.html#exercises-1

library(shiny)
ui <- fluidPage(
  textInput("name", "Enter your name, please!",value = "Your name")
)
server <- function(input, output, session) {
}
shinyApp(ui, server)
