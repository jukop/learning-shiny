# guess the number -game, Juho Kopra



library(shiny)
ui <- fluidPage(
  numericInput("guess", "Guess what number I am thinking!",value=0, min=0, max=10, step=0.001),
  textOutput("answer")
)
server <- function(input, output, session) {
  thinking <- round(runif(n=1,0,1),2)
  output$answer <- renderText({
    dplyr::case_when(input$guess == thinking ~ "Correct! How did you know that?",
                     round(input$guess,1) == round(thinking,1) ~ "Quite close!",
                     input$guess < thinking ~ "Too small!",
                     input$guess > thinking ~ "Too large!",
                     input$guess > 10 | input$guess < 0 ~ "Out of range!")
  })
}
shinyApp(ui, server)