library(shiny)
ui <- fluidPage(
  textOutput("title"),
  textInput("name", "What's your name?", value="Firstname Lastname(s)"),
  textOutput("greeting"),
  textInput("student_number", "What's your Peppi student number? (usually 8 digits)"),
  textOutput("student_msg"),
  textOutput("que1a"),
  numericInput(inputId="answer1a", label="Answer", value=0.000, min=-1000,max=1000,
               step=0.001), #min, max, 
  textOutput("response")
)


server <- function(input, output, session) {
  output$title <- renderText({"SPSS course for UEF: development version 0.001"})
  output$greeting <- renderText({
    if(input$name!="") {
      paste0("Hello ", input$name)
    }
  })
  output$student_msg <- renderText({
    if (stringr::str_detect(string=input$student_number,pattern="^\\d{7,8}$")) {
      "Thank you."
    } else if (stringr::str_detect(string=input$student_number,pattern="^\\d{6}$")) {
      "It looks like you have entered Weboodi style student number. Give Peppi student number instead."
    } else if (stringr::str_detect(string=input$student_number,pattern="^\\d{9}+$")) {
      "Student number is too long."
    } else {
      ""
    }
  })
  output$que1a <- renderText({"How much is 1.03 to the power of 3 ?"})
  output$response <- renderText({
    if (round(input$answer1a,3)==round(1.03^3,3)) {
      paste0("It is correct.")
    } else if (round(input$answer1a,2)==round(1.03^3,2)) {
      paste0("Almost! Check rounding.")
    } else {
      paste0("Incorrect.")
    }
  })
}
shinyApp(ui, server)
